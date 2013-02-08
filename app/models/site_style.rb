class SiteStyle < ActiveRecord::Base
  attr_accessible :site_id, :font_color_data, :title_font_data, :header_font_data, :body_font_data

  belongs_to :site

  serialize :font_color_data
  serialize :title_font_data
  serialize :header_font_data
  serialize :body_font_data

  def font_color
    font_color_data && font_color_data[:font_color] ? font_color_data[:font_color] : nil
  end

  def link_color
    font_color_data && font_color_data[:link_color] ? font_color_data[:link_color] : nil
  end

  def link_hover_color
    font_color_data && font_color_data[:link_hover_color] ? font_color_data[:link_hover_color] : nil
  end

  def title_font_code
    title_font_data && title_font_data[:font_code] ? title_font_data[:font_code] : nil
  end

  def title_font_family
    title_font_data && title_font_data[:font_family] ? title_font_data[:font_family] : nil
  end

  def header_font_code
    header_font_data && header_font_data[:font_code] ? header_font_data[:font_code] : nil
  end

  def header_font_family
    header_font_data && header_font_data[:font_family] ? header_font_data[:font_family] : nil
  end

  def body_font_code
    body_font_data && body_font_data[:font_code] ? body_font_data[:font_code] : nil
  end

  def body_font_family
    body_font_data && body_font_data[:font_family] ? body_font_data[:font_family] : nil
  end
end
