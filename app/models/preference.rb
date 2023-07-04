class Preference < ApplicationRecord
  belongs_to :video
  belongs_to :user

  scope :by_user, ->user_id { where(user_id: user_id) }

  enum pref: [:idle, :like, :dislike]
end
