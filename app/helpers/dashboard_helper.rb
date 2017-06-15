module DashboardHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Dashboard"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end

  def default_keyword(page_keyword = '')
    base_keyword = "Royal Cokelat Cafe"
    if page_keyword.empty?
      base_keyword
    else
      base_keyword + ", " + page_keyword
    end
  end

  def default_description(page_description = '')
    page_description = "Royal Cokelat Cafe Pelopor Milkshake"
  end
  
end
