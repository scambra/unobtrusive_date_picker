module UnobtrusiveDatePicker
  module AssetTagHelper
    ##
    # This will add the necessary <link> and <script> tags to include the necessary stylesheet and
    # javascripts.
    #
    def unobtrusive_datepicker_stylesheets
      ['datepicker']
    end

    def unobtrusive_datepicker_javascripts
      ["datepicker_lang/#{I18n.locale}", 'datepicker']
    end

    def unobtrusive_datepicker_includes(options = {})
      output = []
      output << stylesheet_link_tag(*unobtrusive_datepicker_stylesheets.push(options))
      output << javascript_include_tag(*unobtrusive_datepicker_javascripts.push(options))
      output * "\n"
    end
  end
end
