# encoding: UTF-8
module ApplicationHelper
	def active_li_css(comparison_name, *names)
	  # Make sure we can pass in an array or multiple strings
	  names.flatten!
	  for name in names
  	  if name == comparison_name
        return 'current'
      end
    end
    return ''
  end

  def truncate_words(text, length = 30, end_string = '')
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  def is_active?(url)
    return "subnavActive" if request.path == url.to_s
  end

  def active?(controller_name, *action_name)
    unless action_name.empty?
      return "subnavActive" if controller.controller_name == controller_name && controller.action_name == action_name[0]
    else
      return "subnavActive" if controller.controller_name == controller_name
    end
  end

  def pageless(total_pages, url=nil, container=nil)
    opts = {
      :totalPages => total_pages,
      :url        => url,
      :loaderMsg  => '正在载入更多事迹'
    }

    container && opts[:container] ||= container

    javascript_tag("$('#results').pageless(#{opts.to_json});")
  end
end
