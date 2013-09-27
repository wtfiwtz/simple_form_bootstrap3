module SimpleForm
  module Inputs
    class StringInput < Base
      enable :placeholder, :maxlength, :pattern

      def input
        unless string?
          input_html_classes.unshift("string")
          input_html_options[:type] ||= input_type if html5?
        end

        @builder.text_field(attribute_name, input_html_options)
      end

      private

      def string?
        input_type == :string
      end

      def html_options_for(namespace, css_classes)
        css_classes.delete('form-control') if bootstrap3_check_or_radio?
        super(namespace, css_classes)
      end

      def bootstrap3_check_or_radio?
        SimpleForm.bootstrap3 && (input_type == :check_boxes || input_type == :radio_buttons)
      end

    end
  end
end
