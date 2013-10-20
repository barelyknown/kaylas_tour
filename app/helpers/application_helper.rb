module ApplicationHelper

  def caret(label="")
    content_tag(:span, label) + content_tag(:b, "", class: "caret")
  end

  def panel_dropdown(name, pull_direction=:left)
    content_tag(:div, class: "btn-group") do
      content_tag(:button, class: "btn btn-default btn-xs dropdown-toggle", data: { toggle: "dropdown" }) do
        caret(name).html_safe
      end +
      content_tag(:ul, class: "dropdown-menu pull-#{pull_direction}") do
        yield
      end
    end.html_safe
  end

end
