class ButtonComponent < ViewComponent::Base
  def initialize(label:, style: "primary", url: "#", method: :get, options: {}, form: nil, class: nil)
    @label = label
    @style = style
    @url = url
    @method = method
    @options = options
    @form = form
    @custom_class = binding.local_variable_get(:class)
  end

  def button_classes
    base_classes = "button"
    style_classes = case @style
                    when "primary" then "is-primary"
                    when "secondary" then "is-link"
                    when "danger" then "is-danger"
                    else "is-light"
                    end

    [base_classes, style_classes, @custom_class].compact.join(" ")
  end
end
