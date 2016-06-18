class CheckBoxesGentellelaInput < SimpleForm::Inputs::CollectionInput
  def input(wrapper_options = nil)
    template.content_tag(:div, style: 'display: flex; flex-flow: column nowrap;') do
      # p collection
      # p attribute_name
      # p input_options[:class]
      # p "#{input_options[:class]}[#{attribute_name.to_s}][]"



      @input_name = "#{input_options[:class]}[#{attribute_name.to_s}][]"
      collection.map do |key,value|
        label = t("models.#{input_options[:class]}.#{attribute_name.to_s}.#{key}")
        template.concat div_checkbox(key,value,label)
      end
      # mesmo que include_blank = false
      # template.concat "<input type='hidden' value='' name='#{@input_name}'>".html_safe
    end
  end

  def div_checkbox(key,value,label)
    template.content_tag(:div, class: 'checkbox') do
      template.concat create_label(key,value,label)
    end
  end

  def create_label(key,value,label)
    template.content_tag(:label, class: '', style: input_options[:style]) do
      template.concat label
      template.concat create_input(value,label)
    end
  end

  def create_input(value,label)
    tag("input", type: 'checkbox', class: 'flat', style: 'position: absolute; opacity: 0;', value: "#{value}", name: "#{@input_name}" )
  end
end
