class Province < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: %i[slugged finders]
  has_many :jobs, dependent: :destroy

  validates :title, presence: true
end
