module ModalHelper

  def modal(title, body)
    content_tag( :div, class: 'modal', tabindex: '-1' ) do
      content_tag( :div, class: 'modal-dialog' ) do
        content_tag( :div, class: 'modal-content' ) do
          content_tag( :div, class: 'modal-header' ) do
            content_tag( :button, class: 'close', data: { dismiss: :modal } ) do
              content_tag( :span, "&times;".html_safe )
            end +
            content_tag( :h4, title, class: "modal-title" )
          end +
          content_tag( :div, body, class: 'modal-body' )
        end
      end
    end
  end

end
