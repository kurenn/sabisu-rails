module SabisuRails::ExplorerHelper

  def label_attribute(explorer, attr)
    explorer.required_attribute?(attr) ? "* #{attr.capitalize}" : attr.capitalize
  end

  def active_resource_state(resource)
    loaded_resource = SabisuRails.default_resource
    if params[:explorer].nil?
      "active" if loaded_resource  == resource
    else
      "active" if params[:explorer][:resource] == resource
    end
  end

  def prettify_headers(headers)
    html = ""
    headers.each do |k, v|
      k = k.titleize.split(' ').join('-')
      header_name = content_tag :span, k, class: 'text-muted text-strong'
      arrow = content_tag :span," <i class='fa fa-long-arrow-right'></i> ".html_safe, class: 'text-muted'
      header_value = content_tag :span, v, class: 'text-muted'
      html << (header_name + arrow + header_value)
      html << "<br />"
    end
    html.html_safe
  end
end
