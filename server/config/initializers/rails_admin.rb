RailsAdmin.config do |config|

  # added
  # config.parent_controller = 'ApplicationController'


  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate!(scope: :user)
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  # To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = false

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model User do
    edit do
      exclude_fields :client_apps, :api_token
    end
  end

  config.model Room do
    edit do
      exclude_fields :user, :messages
    end
  end

  config.model Message do
    edit do
      exclude_fields :user
    end
  end


end
