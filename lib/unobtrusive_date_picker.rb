module UnobtrusiveDatePicker
  autoload 'ActionViewHelpers', 'unobtrusive_date_picker/action_view_helpers'
  autoload 'AssetTagHelper', 'unobtrusive_date_picker/asset_tag_helper'
end
ActionView::Base.send :include, UnobtrusiveDatePicker::ActionViewHelpers
ActionView::Base.send :include, UnobtrusiveDatePicker::AssetTagHelper
