module Sabisu::ExplorerHelper
  def label_attribute(explorer, attr)
    explorer.required_attribute?(attr) ? "* #{attr.capitalize}" : attr.capitalize
  end
end
