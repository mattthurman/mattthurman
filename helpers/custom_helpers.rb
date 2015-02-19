module CustomHelpers
	def page_title
    [current_page.data.title, config[:site_name]].reject(&:blank?).join(' | ')
  end

  def active_nav(page)
  	'class="active"' if current_page?(page) 
  end

  def current_page?(page)
  	parts = current_page.path.split('/')
  	return true if parts.length == 1 && page == 'home'
  	parts.first.split('.').first.downcase == page.downcase
  end
end