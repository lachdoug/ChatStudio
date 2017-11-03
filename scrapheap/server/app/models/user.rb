class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
    # , :recoverable, :rememberable, :trackable, :validatable

  has_many :client_apps

  attr_accessor :workshop_key

  validates :username, length: {minimum: 5, maximum: 12}, uniqueness: true
  validates :password, length: {minimum: 6}, confirmation: true
  validate :workshop_key_is_correct

  # Assign an API token on create
  before_create do |user|
    user.api_token = user.generate_api_token
  end

  # Generate a unique API token
  def generate_api_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_token: token)
    end
  end

  def workshop_key_is_correct
    errors.add :workshop_key, 'is incorrect' unless username == 'admin' || Rails.application.config.workshop_key == self.workshop_key
  end

  def is_admin?
    username == 'admin'
  end

end
