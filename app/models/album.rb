class Album < ActiveRecord::Base
  attr_accessible :style
  cattr_reader :album_comic_page_size

  validates_inclusion_of :style, in: %w[thumbnail-rows horizontal-scroll coffee-table comic]
  has_many :album_elements, dependent: :destroy, order: 'sequence ASC'

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
