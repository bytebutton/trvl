module ApplicationHelper

  def title(page_title)
    content_for(:title, "Travel-LINK | #{page_title.to_s}")
  end

end
