class ClientApp < ApplicationRecord

  belongs_to :user

  # after_commit :unpack
  #
  # def unpack
  #
  # end

end
