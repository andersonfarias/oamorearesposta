class DatepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options=nil)
    col_class = options[:input_html][:class] if !options[:input_html].nil?
    template.content_tag(:div, class: "input-group date form_datetime #{col_class}") do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_table
    end
 end

 def input_html_options
   super.merge({class: "form-control date-input"})
 end

  def span_table
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_table
    end
  end

  def icon_table
    "<span class='glyphicon glyphicon-calendar'></span>".html_safe
  end
end
