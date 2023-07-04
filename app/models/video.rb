class Video < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :preferences

  PER = 5

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at description embed_url id title url user_id]
  end
end
