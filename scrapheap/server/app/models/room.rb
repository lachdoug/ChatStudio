class Room < ApplicationRecord

  has_many :messages, dependent: :destroy
  belongs_to :user

  after_create_commit :send_new_room_update

  validates :name, uniqueness: true, length: { minimum: 4, maximum: 24 }

  def as_json(opts={})
    if opts[:include] == :messages
      { id: id,
        user: user.username,
        name: name,
        created_at: created_at,
        messages: messages.as_json }
    else
      { id: id,
        user: user.username,
        name: name,
        created_at: created_at }
    end
  end

  def send_new_room_update
    # CreateRoomJob.perform_later(self)

    # ActionCable.server.broadcast 'events_channel', {event: :new_room, room: to_json}
  end


end
