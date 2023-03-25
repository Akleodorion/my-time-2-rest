class Offer < ApplicationRecord
  belongs_to :user
  scope :excluding_user, ->(id) { where.not(user_id: id) }
end
