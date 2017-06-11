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

  def gender_options
    [
      %w(Male Male),
      %w(Female Female)
    ]
  end

  def canonization_status_options
    [
      ['Saint', 'Saint'],
      ['Blessed', 'Blessed'],
      ['Venerable', 'Venerable'],
      ['Servant of God', 'Servant of God']
    ]
  end
end
