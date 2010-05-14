module UnobtrusiveDatePicker
  autoload 'ActionViewHelpers', 'unobtrusive_date_picker/action_view_helpers'
  autoload 'AssetTagHelper', 'unobtrusive_date_picker/asset_tag_helper'
end
ActionView::Helpers.send :include, UnobtrusiveDatePicker::ActionViewHelpers
ActionView::Helpers.send :include, UnobtrusiveDatePicker::AssetTagHelper
