module ApplicationHelper

  def title
    base_title = "Katalog Miniatur"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
#  def logo
#    image_tag("logo.png", :alt => "Katalog Miniatur")
#  end

end
