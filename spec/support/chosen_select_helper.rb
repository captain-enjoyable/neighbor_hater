module Capybara
  module Chosen
    module Select
      def select(value, options={})
        if options.has_key?(:from)
          element = find(:select, options[:from], options.except(:from).merge(visible: false))
            .find(:option, value, visible: false)
          if element.visible?
            element.select_option
          else
            chosen_select(value, options)
          end
        else
          find(:option, value).select_option
        end
      end

      # private

      def chosen_select(value, options = {})
        field = find_field(options[:from], visible: false)
        option_value = page.evaluate_script("$(\"##{field[:id]} option:contains('#{value}')\").val()")
        page.execute_script("$('##{field[:id]}').val('#{option_value}')")
        page.execute_script("$('##{field[:id]}').trigger('chosen:updated').trigger('change')")
      end
    end
  end
end
