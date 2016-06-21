class CustomCheckboxInput < SimpleForm::Inputs::CollectionInput
  def input

    @value_input = "#{input_options[:class]}[#{attribute_name}]"
    template.content_tag(:div) do
      collection.map do |key, value|
        template.concat div_tag(key, value)
      end
    end
 end

 def div_tag(key,value)
   template.content_tag(:div, class: "checkbox checkbox-primary") do
     template.concat input_tag(key, value)
     template.concat label_tag(key)
   end
 end

 def input_tag(key, value)
   "<input id='#{key}' class='check_boxes optional' value='#{value}' name='#{@value_input}[]' type='checkbox' >".html_safe
 end

 def label_tag(key)
   "<label for='#{key}'>#{t("models.#{input_options[:class]}.#{attribute_name}.#{key}")}</label>".html_safe
 end
end
