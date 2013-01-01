class Post < ActiveRecord::Base
  self.inheritance_column = nil

  # @@valid_types = ['single-column-text', 'two-column-text', 'time-lapse', 'album', 'video', 'notes', 'quote']
  @@valid_styles = [
                    'album-thumbails', 'album-strip', 'album-carousel', 'album-flipbook', 'album-comic', #album styles
                    'video-big',
                   ]
  @@valid_effects = ['fade-in']

  @@album_comic_page_size = {width: 470, height: 600}
  @@album_comic_margin = 7
  @@album_comic_data_template = [
                                 { #PAGE 0
                                   width: @@album_comic_page_size[:width],
                                   rows: [
                                          { #ROW 0
                                            height: 35,
                                            items:
                                            [
                                             {width: 33, z_index: 1},
                                             {width: 33, z_index: 1},
                                             {width: 34, z_index: 1}
                                            ]
                                          },
                                          { #ROW 1
                                            height: 30,
                                            items:
                                            [
                                             {width: 50, z_index: 1},
                                             {width: 50, z_index: 1}
                                            ]
                                          },
                                          { #ROW 2
                                            height: 35,
                                            items:
                                            [
                                             {width: 25, z_index: 1},
                                             {width: 25, z_index: 1},
                                             {width: 25, z_index: 1},
                                             {width: 25, z_index: 1}
                                            ]
                                          }
                                         ],
                                   items: []
                                 },
                                 { #PAGE 1
                                   width: @@album_comic_page_size[:width],
                                   rows: [],
                                   items: [
                                           {width: 100, height: 100, top: 0, left: 0, z_index: 1},
                                           {width: 33, height: 20, top: 3, left: 5, z_index: 2},
                                           {width: 33, height: 20, top: 27, left: 5, z_index: 2},
                                           {width: 33, height: 20, top: 51, left: 5, z_index: 2},
                                           {width: 33, height: 20, top: 75, left: 5, z_index: 2},
                                           {width: 47, height: 20, top: 75, left: 47, z_index: 2}
                                          ]
                                 },

                                 { #PAGE 2
                                   width: @@album_comic_page_size[:width],
                                   rows: [
                                          { #ROW 0
                                            height: 20,
                                            items:
                                            [
                                             {width: 77, z_index: 1},
                                             {width: 23, z_index: 1, height: 51},
                                            ]
                                          },
                                          { #ROW 1
                                            height: 30,
                                            items:
                                            [
                                             {width: 35, z_index: 1},
                                             {width: 40, z_index: 1}
                                            ]
                                          },
                                          { #ROW 2
                                            height: 50,
                                            items:
                                            [
                                             {width: 100, z_index: 1}
                                            ]
                                          }
                                         ],
                                   items: []
                                 },
                                 { #PAGE 3
                                   width: @@album_comic_page_size[:width],
                                   rows: [
                                          { #ROW 0
                                            height: 33,
                                            items:
                                            [
                                             {width: 33, z_index: 1},
                                             {width: 67, z_index: 1},
                                            ]
                                          },
                                          { #ROW 1
                                            height: 33,
                                            items:
                                            [
                                             {width: 33, z_index: 1},
                                             {width: 67, z_index: 1}
                                            ]
                                          },
                                          { #ROW 2
                                            height: 34,
                                            items:
                                            [
                                             {width: 33, z_index: 1},
                                             {width: 33, z_index: 1},
                                             {width: 34, z_index: 1},
                                            ]
                                          }
                                         ],
                                   items: []
                                 },
                                 { #PAGE 4
                                   width: @@album_comic_page_size[:width],
                                   rows: [
                                          { #ROW 0
                                            height: 25,
                                            items:
                                            [
                                             {width: 100, z_index: 1},
                                            ]
                                          },
                                          { #ROW 1
                                            height: 25,
                                            items:
                                            [
                                             {width: 100, z_index: 1},
                                            ]
                                          },
                                          { #ROW 2
                                            height: 50,
                                            items:
                                            [
                                             {width: 40, z_index: 1},
                                             {width: 60, z_index: 1},
                                            ]
                                          }
                                         ],
                                   items: []
                                 }
                                ]

  attr_accessible :type, :space, :style, :published, :date_published, :bg_color, :title, :body, :show_header, :min_height, :effect, :previous_post_id
  cattr_reader :album_comic_page_size

  validates_presence_of :title
  validates_inclusion_of :space, in: ['foreground', 'background', 'midground', 'auto']
  validates_inclusion_of :effect, in: @@valid_effects, allow_nil: true

  has_many :images, dependent: :destroy, order: 'position ASC'
  has_many :videos, dependent: :destroy, order: 'position ASC'
  has_many :background_images, dependent: :destroy, order: 'z_index DESC'
  has_many :quotes, dependent: :destroy
  has_many :post_elements, dependent: :destroy, order: 'sequence ASC'
  belongs_to :previous_post, class_name: "Post"

  def method_missing(name, *args)
    name = name.to_s
    case name.to_s
    when /is_(.*)\?/
      searching_for = ($1)
      type == searching_for.gsub(/_/, "-") || style == searching_for.gsub(/_/, "-")
    end
  end

  def has_shifting_background?
    for background_image in background_images
      return true if background_image.is_shifting?
    end

    false
  end

  def has_background?
    !background_images.empty?
  end

  def time_lapse_posts
    posts = []
    posts << self

    while post = posts[-1].previous_post
      posts << post
    end

    posts
  end

  def images_with_time_lapse
    images = []

    for post in time_lapse_posts
      images.concat(post.images_without_time_lapse)
    end

    images
  end

  alias_method_chain :images, :time_lapse

  def self.album_comic_data_for_index(index)
    @@album_comic_data_processed ||= process_comic_data
    @@album_comic_book_total_width ||= comic_book_width
    @@album_comic_book_total_pages ||= @@album_comic_data_template.count

    location_data = @@album_comic_data_processed[index % @@album_comic_data_processed.count].clone

    unless(index < @@album_comic_data_processed.count)
      book = (index / @@album_comic_data_processed.count).floor
      location_data[:left] += book * @@album_comic_book_total_width + @@album_comic_book_total_pages * @@album_comic_margin
    end

    location_data
  end

  private

  def self.comic_book_width
    @@album_comic_data_template.sum {|page_data| page_data[:width]}
  end

  def self.process_comic_data
    #FIRST PASS, setting most data for items in rows
    row_top_starting_point = []
    page_left_starting_point = [0]

    processed_data =  @@album_comic_data_template.map.with_index do |page, page_num|
      #process the rows
      page_width = page[:width]
      tot_rows_in_page = page[:rows].count
      row_top_starting_point[page_num] = [0]

      page[:rows].map.with_index do |row, row_num|
        tot_elements_in_row = row[:items].count
        pixels_in_row = 0
        row_top_starting_point[page_num][row_num + 1] = 0

        width_without_margins = page_width - [tot_elements_in_row - 1, 0].max * @@album_comic_margin
        height_without_margins = @@album_comic_page_size[:height] - [tot_rows_in_page - 1, 0].max * @@album_comic_margin

        starting_point_including_margin = (row[:height] * height_without_margins / 100) + @@album_comic_margin + row_top_starting_point[page_num][row_num]
        row_top_starting_point[page_num][row_num + 1] = starting_point_including_margin if starting_point_including_margin > row_top_starting_point[page_num][row_num + 1]

        row[:items].map.with_index do |item, item_num|
          item[:width] = item[:width] * width_without_margins / 100
          item[:height] = (item[:height] ? item[:height] : row[:height]) * height_without_margins / 100

          item[:left] = pixels_in_row
          pixels_in_row += item[:width] + @@album_comic_margin

          item
        end

        row
      end

      page_left_starting_point[page_num + 1] = page_left_starting_point[page_num] + page_width + @@album_comic_margin

      page
    end

    #SECOND PASS. setting top and left offsets for row items and pages translating all data for free floating items
    processed_data.map.with_index do |page, page_num|
      page_width = page[:width]

      page[:rows].map.with_index do |row, row_num|
        row[:items].map.with_index do |item, item_num|
          item[:left] += page_left_starting_point[page_num]
          item[:top] = row_top_starting_point[page_num][row_num]
        end
      end

      page[:items].each do |item|
        item[:width] = item[:width] * page_width / 100
        item[:height] = item[:height] * @@album_comic_page_size[:height] / 100

        item[:left] = page_left_starting_point[page_num] + item[:left] * page_width / 100
        item[:top] = item[:top] * @@album_comic_page_size[:height] / 100
      end
    end

    flattened_template = []
    #LAST PASS, flattening this son of a motherless father
    #TODO, make this order elements from left to right
    processed_data.each do |page|
      page[:rows].each do |row|
        row[:items].each do |item|
          flattened_template << item
        end
      end

      page[:items].each do |item|
        flattened_template << item
      end
    end

    flattened_template
  end
end
