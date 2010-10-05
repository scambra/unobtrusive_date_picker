module UnobtrusiveDatePicker
  module ActionViewHelpers
    def self.included(base)
      ::ActionView::Helpers::InstanceTag.send :include, InstanceTag
      ::ActionView::Helpers::DateTimeSelector.send :include, DateTimeSelector
      ::ActionView::Helpers::FormBuilder.send :include, FormBuilder
    end

    def date_picker(object_name, method, options = {}, html_options = {})
      javascript_tag ::ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object)).to_date_picker_js(options, html_options)
    end

    module DateTimeSelector
      DATE_PICKER_FORMAT = {:year => 'Y', :month => 'n', :day => 'j'}
      def date_picker_js
        @options[:include_position] = false
        id = input_id_from_type(nil)
        date_order = I18n.t('date.order')
        formElements = date_order.reverse.collect! {|field| ["#{id}_#{::ActionView::Helpers::DateTimeSelector::POSITION[field]}i", DATE_PICKER_FORMAT[field]]}.flatten!
        js_options = (@options[:date_picker_options] || {}).merge(:formElements => ActiveSupport::OrderedHash[*formElements])
        %|if (typeof datePickerController != 'undefined') {
  datePickerController.destroyDatePicker("#{id}_#{::ActionView::Helpers::DateTimeSelector::POSITION[date_order.last]}i");
  datePickerController.createDatePicker(#{js_options.to_json});
}|
      end
    end

    module InstanceTag
      def to_date_picker_js(options = {}, html_options = {})
        datetime_selector(options, html_options).date_picker_js.html_safe
      end
    end

    module FormBuilder
      def date_picker(method, options = {}, html_options = {})
        @template.date_picker(@object_name, method, objectify_options(options), html_options)
      end
    end
  end
end
