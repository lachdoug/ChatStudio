class ClientApp < ApplicationRecord

  belongs_to :user

  scope :published, -> { where(published: true).sort_by { |client_app| client_app.sort_order || 0 }.sort_by { |client_app| client_app.user.username == 'lachlan' ? 1 : 2 } }
  scope :sorted, -> { all.sort_by { |client_app| client_app.sort_order || 0 } }

end
