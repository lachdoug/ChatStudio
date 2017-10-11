module BodyHelper

  def page_body(body)
    content_tag(:div, class: 'flatchat_page container-fluid') do
      content_tag(:div, class: "page_header clearfix") do
        content_tag(:div, class: "pull-left") do
          brand_link +
          if current_user
            client_apps_link +
            server_data_link +
            workshop_link
          end
        end +
        content_tag(:div, class: "pull-right") do
          if current_user
            user_link +
            signout_link
          else
            signin_link
          end
        end
      end +
      flash_messages +
      body
    end
  end

  def brand_link
    link_to(root_path, class: "page_navigation_link btn btn-lg") do
      icon_text 'ChatStudio', 'fa-comment'
    end
  end

  def workshop_link
    link_to(workshop_path, class: "page_navigation_link btn btn-lg #{'active' if controller_name == 'workshops'}") do
      icon_text 'Workshop', 'fa-keyboard-o'
    end
  end

  def client_apps_link
    link_to(client_apps_path, class: "page_navigation_link btn btn-lg #{'active' if controller_name == 'client_apps'}") do
      icon_text 'Clients', 'fa-mobile'
    end
  end

  def server_data_link
    link_to(server_data_path, class: "page_navigation_link btn btn-lg #{'active' if controller_name == 'server_data'}") do
      icon_text 'Server', 'fa-server'
    end
  end

  def user_link
    link_to(user_path(current_user), class: "page_navigation_link btn btn-lg #{'active' if controller_name == 'users'}") do
      icon_text(current_user.username, 'fa-user')
    end
  end

  def signin_link
    controller_name == 'sessions' || controller_name == 'registrations' ?
    ''.html_safe :
    link_to(new_user_session_path, class: "page_navigation_link btn btn-lg") do
      icon_text('Sign in', 'fa-sign-in')
    end
  end

  def signout_link
    link_to(destroy_user_session_path, method: :delete, class: "page_navigation_link btn btn-lg") do
      icon_text('Sign out', 'fa-sign-out')
    end
  end

  # def home_link
  #   link_to(home_path, class: "page_navigation_link btn btn-lg pull-right") do
  #     icon 'fa-times'
  #   end
  # end

end
