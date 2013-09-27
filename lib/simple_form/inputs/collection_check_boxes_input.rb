module SimpleForm
  module Inputs
    class CollectionCheckBoxesInput < CollectionRadioButtonsInput
      protected

      # Checkbox components do not use the required html tag.
      # More info: https://github.com/plataformatec/simple_form/issues/340#issuecomment-2871956
      def has_required?
        false
      end

      def build_nested_boolean_style_item_tag(collection_builder)
        collection_builder.check_box + collection_builder.text
      end

      def item_wrapper_class
        "checkbox"
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
