module ApplicationHelper

  #ページごとの適切なタイトル
  def full_title
    base_title = "Coffee Anywhere"
    if page_title.empty?
      base_title
    else
      page_title + "|" + base_title
    end
  end

end
