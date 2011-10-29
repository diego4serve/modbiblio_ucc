module ApplicationHelper
  def title
    base_title = "iBiblio Ateneo Moderno"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def header
    @header
  end
end
