module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Saint Stories'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def gender_options
    [
      %w(Male Male),
      %w(Female Female)
    ]
  end
end
