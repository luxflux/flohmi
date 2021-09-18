SimpleForm.setup do |config|
  #config.generate_additional_classes_for = ['field']

  config.wrappers :default, tag: 'div', class: 'field', error_class: 'has-error' do |b|
    b.use         :placeholder
    b.optional    :maxlength
    b.optional    :pattern
    b.optional    :min_max
    b.optional    :readonly

    b.optional :label, class: 'label', wrap_with: { tag: 'label', class: 'label' }
    b.use :input, class: 'input', error_class: 'is-danger'
    b.optional :hint, wrap_with: { tag: 'p', class: 'help' }
    b.use :error, wrap_with: { tag: 'p', class: 'help is-danger' }
  end

  # config.wrappers :boolean, tag: 'div', class: 'control', error_class: 'has-error' do |b|
  #   b.wrapper :label, tag: "label", class: "checkbox" do |ba|
  #     ba.use :input, class: 'checkbox'
  #     ba.use :label_text
  #     ba.use :hint, wrap_with: {tag: 'p', class: 'help'}
  #   end
  # end

  class StringInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      template.content_tag(:div, super, class: 'control')
    end
  end

  class TextInput < SimpleForm::Inputs::TextInput
    def input_html_classes
      super.push('textarea')
    end
  end
end
