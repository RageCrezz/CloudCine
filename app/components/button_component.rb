class ButtonComponent < ViewComponent::Base
  def initialize(label:, style: "primary", url: "#", method: :get, options: {}, form: nil)
    @label = label
    @style = style
    @url = url
    @method = method
    @options = options
    @form = form
  end

  def button_classes
    base_classes = "px-4 py-4 font-semibold text-white transition-all rounded-md cursor-pointer"
    style_classes = case @style
                    when "primary" then "bg-[#405eed] hover:bg-[#405eed]/80"
                    when "secondary" then "border-1 border-[#405eed] bg-transparent hover:bg-[#405eed]"
                    when "danger" then "bg-[#E74C3C] hover:bg-[#E74C3C]/75"
                    else "bg-transparent text-[#405eed] hover:text-[#405eed]/50"
                    end
    "#{base_classes} #{style_classes}"
  end
end
