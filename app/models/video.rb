class Video < ApplicationRecord
  acts_as_paranoid

  PER = 5

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at description embed_url id title url user_id]
  end

  belongs_to :user
end
