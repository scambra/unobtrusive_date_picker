module UnobtrusiveDatePicker
  ::ActionView::Base.send :include, ActionViewHelpers
  ::ActionView::Base.send :include, AssetTagHelper
end
