module IconsHelper

  def icon_text(text, icon=nil, opts={})
    content_tag :span, title: opts[:title] do
      if icon.present?
        icon(icon) +
        content_tag(
          :span,
          ( "&nbsp;#{text}".html_safe if text ) )
      else
        text.to_s
      end.gsub('"', "'").html_safe
    end
  end

  # def icon_url_text(text, icon_url=nil, opts={})
  #   content_tag :span, title: opts[:title] do
  #     if icon_url.present?
  #       image_tag(icon_url) +
  #       content_tag(
  #         :span,
  #         ( "&nbsp;#{text}".html_safe if text ) )
  #     else
  #       text.to_s
  #     end.gsub('"', "'").html_safe
  #   end
  # end

  def icon(icon)

      content_tag(:i, nil, class: "#{icon.to_s.split('-', 2).first} #{icon}")


    # if icon.is_a? String
    #   single_icon(icon)
    # else
    #   stacked_fa_icon(icon)
    # end
  end

  # def single_icon(icon)
  #   content_tag(:i, nil, class: "#{icon.to_s.split('-', 2).first} #{icon}")
  # end

  # def stacked_fa_icon(icon)
  #   content_tag :span, style: 'font-size: 0.5em;', class: 'fa-stack' do
  #     content_tag(:i, nil, class: "fa #{icon.first} fa-stack-2x fa-sm") +
  #     content_tag(:i, nil, class: "fa #{icon.last} fa-sm fa-stack-1x fa-inverse")
  #   end
  # end

end
