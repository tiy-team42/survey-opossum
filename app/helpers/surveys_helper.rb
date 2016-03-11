module SurveysHelper

  def new_fields_template(f,association,options={})
  # options[:object] ||= f.object.class.reflect_on_association(association).klass.new
  # options[:partial] ||= association.to_s.singularize+"_fields"
  # options[:template] ||= association.to_s+"_fields"
  # options[:f] ||= :f

 tmpl = content_tag(:div,:id =>"#{options[:template]}") do
    tmpl = f.fields_for(association,options[:object], :child_index => "new_#{association}") do |f|
      render 'questions_fields'
    end
  end
  tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ' '
  return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
end

  def add_child_button(name, association)
    content_tag(:spam,"<span>#{name}</span>".html_safe,
      :class => "add_child",
      :style => "cursor:pointer; border:1px solid #777;",
      :"data-association" => association,
    )
  end
  def remove_child_button(name)
    content_tag(:div,"<span>Remove</span>".html_safe,
      :style => "cursor:pointer; border:1px solid #777; display:inline-block; width: 60px;",
      :class => "remove_child")
  end
end
