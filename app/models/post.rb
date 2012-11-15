class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_types = ['single-column-text', 'two-column-text', 'time-lapse', 'album', 'video', 'notes', 'quote']
  @@valid_styles = [
                    'album-thumbails', 'album-strip', 'album-carousel', 'album-flipbook', 'album-comic', #album styles
                    'video-big',
                   ]
  @@valid_effects = ['fade-in']

  @@album_comic_page_size = {width: 400, height: 600}
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
                                           {width: @@album_comic_page_size[:width], height: @@album_comic_page_size[:height], top: 0, left: 0, z_index: 1},
                                           {width: 33, height: 20, top: 10, left: 10, z_index: 2},
                                           {width: 33, height: 20, top: 33, left: 10, z_index: 2},
                                           {width: 33, height: 20, top: 60, left: 10, z_index: 2}
                                          ]
                                 }
                                ]

=begin
  @@album_comic_data_template = [
                                 {width: 0.33, height: 0.35, z_index: 1, page: 1, row: 1},
                                 {width: 0.33, height: 0.35, z_index: 1, page: 1, row: 1},
                                 {width: 0.34, height: 0.35, z_index: 1, page: 1, row: 1},

                                 {width: 0.5, height: 0.3, z_index: 1, page: 1, row: 2},
                                 {width: 0.5, height: 0.3, z_index: 1, page: 1, row: 2},

                                 {width: 0.25, height: 0.35, z_index: 1, page: 1, row: 3},
                                 {width: 0.25, height: 0.35, z_index: 1, page: 1, row: 3},
                                 {width: 0.25, height: 0.35, z_index: 1, page: 1, row: 3},
                                 {width: 0.25, height: 0.35, z_index: 1, page: 1, row: 3},
                                ]


  @@album_comic_data_template = [
                                 {width: 3, height: 5, top: 0, left: 0, z_index: 1, page: 1, row: 1},
                                 {width: 4.5, height: 4, top: 5, left: 0, z_index: 1, page: 1, row: 2},
                                 {width: 2.25, height: 5, top: 9, left: 0, z_index: 1, page: 1, row: 3},
                                 {width: 2.25, height: 5, top: 9, left: 2.25, z_index: 1, page: 1, row: 3},
                                 {width: 3, height: 5, top: 0, left: 3, z_index: 1, page: 1, row: 1},
                                 {width: 4.5, height: 4, top: 5, left: 4.5, z_index: 1, page: 1, row: 2},
                                 {width: 2.25, height: 5, top: 9, left: 4.5, z_index: 1, page: 1, row: 3},
                                 {width: 3, height: 5, top: 0, left: 6, z_index: 1, page: 1, row: 1},
                                 {width: 2.25, height: 5, top: 9, left: 6.75, z_index: 1, page: 1, row: 3},

                                 #page 2
                                 {width: @@album_comic_page_size[:width], height: @@album_comic_page_size[:height], top: 0, left: 0, z_index: 1, page: 2}, #bg
                                 {width: 2.5, height: 2.5, top: 0.25, left: 0.25 + @@album_comic_page_size[:width], z_index: 2}, #row 1
                                 {width: 2.5, height: 2.5, top: 2.75, left: 0.25 + @@album_comic_page_size[:width], z_index: 2}, #2
                                {width: 2.5, height: 2.5, top: 5.25, left: 0.25 + @@album_comic_page_size[:width], z_index: 2}, #3


                       ]
=end


  attr_accessible :type, :space, :style, :published, :date_published, :bg_color, :title, :body, :show_header, :min_height, :effect, :previous_post_id
  cattr_reader :valid_types

  validates_presence_of :title
  validates_inclusion_of :type, in: @@valid_types
  validates_inclusion_of :space, in: ['foreground', 'background', 'midground', 'auto']
  validates_inclusion_of :effect, in: @@valid_effects, allow_nil: true

  has_many :images, dependent: :destroy, order: 'position ASC'
  has_many :videos, dependent: :destroy, order: 'position ASC'
  has_many :background_images, dependent: :destroy, order: 'z_index DESC'
  has_many :quotes, dependent: :destroy
  belongs_to :previous_post, class_name: "Post"

  def method_missing(name, *args)
    name = name.to_s
    case name.to_s
    when /is_(.*)\?/
      type == ($1).gsub(/_/, "-")
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
    @@album_comic_data_processed[index]
  end

  private

  def self.process_comic_data
    #FIRST PASS
    row_top_starting_point = []

    processed_data =  @@album_comic_data_template.map.with_index do |page, page_num|
      #process the rows
      page_width = page[:width]
      tot_rows_in_page = page[:rows].count
      row_top_starting_point[page_num] = [0]

      page[:rows].map.with_index do |row, row_num|
        tot_elements_in_row = row[:items].count
        pixels_in_row = 0
        row_top_starting_point[page_num][row_num + 1] = 0

        row[:items].map.with_index do |item, item_num|
          width_without_margins = page_width - [tot_elements_in_row - 1, 0].max * @@album_comic_margin
          height_without_margins = @@album_comic_page_size[:height] - [tot_rows_in_page - 1, 0].max * @@album_comic_margin

          item[:width] = item[:width] * width_without_margins / 100
          item[:height] = (item[:height] ? item[:height] : row[:height]) * height_without_margins / 100

          item[:left] = pixels_in_row
          #item[:top] = per_page_row_start[page_num][row_num] * @@album_comic_page_size[:height] / 100 + (row_num) * @@album_comic_margin
          starting_point_including_margin = item[:height] + @@album_comic_margin + row_top_starting_point[page_num][row_num]
          row_top_starting_point[page_num][row_num + 1] = starting_point_including_margin if starting_point_including_margin > row_top_starting_point[page_num][row_num + 1]
          pixels_in_row += item[:width] + @@album_comic_margin

          item
        end

        row
      end

      #process free elements
      #element[:left] = (element[:page] - 1) * @@album_comic_page_size[:width] + element[:left] * width_without_margins
      #element[:top] = element[:top] * height_without_margins

      page
    end

    #SECOND PASS
    processed_data.map.with_index do |page, page_num|
      page[:rows].map.with_index do |row, row_num|
        row[:items].map.with_index do |item, item_num|
          item[:top] = row_top_starting_point[page_num][row_num]
        end
      end
    end

    flattened_template = []
    #LAST PASS, FLATTEN THIS SON OF A MOTHERLESS FATHER
    #TODO, make this order elements from left to right
    processed_data.each do |page|
      page[:rows].each do |row|
        row[:items].each do |item|
          flattened_template << item
        end
      end
    end

    flattened_template
  end
end
