module Sabisu::ExplorerHelper
  def label_attribute(explorer, attr)
    explorer.required_attribute?(attr) ? "* #{attr.capitalize}" : attr.capitalize
  end

  def active_resource_state(resource)
    "active" if params[:explorer][:resource] == resource
  end
end
