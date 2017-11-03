class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
    # , :recoverable, :rememberable, :trackable, :validatable

  has_many :client_apps
  accepts_nested_attributes_for :client_apps # for 'drag to sort' form

  # def sorted_client_apps
  #   byebug
  #   client_apps.sorted
  # end

  attr_accessor :workshop_key

  validates :username, length: {minimum: 5, maximum: 12}, uniqueness: true
  validates :password, length: {minimum: 6}, confirmation: true
  validate :workshop_key_is_correct, on: :create

  # Assign an API token on create
  before_create do |user|
    user.api_token = user.secure_random_token
  end

  # Generate a unique API token
  def secure_random_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_token: token)
    end
  end

  def regenerate_api_token(password)
    if valid_password? password
      update( api_token: secure_random_token, password: password, password_confirmation: password )
    else
      errors.add :password, 'incorrect'
      false
    end
  end

  def workshop_key_is_correct
    errors.add :workshop_key, 'is incorrect' unless username == 'admin' || Rails.application.config.workshop_key == self.workshop_key
  end

  def is_admin?
    username == 'admin'
  end

end
