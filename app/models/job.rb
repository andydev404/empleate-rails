class Job < ApplicationRecord
  extend FriendlyId
  include MeiliSearch::Rails

  meilisearch do
    attribute :title, :description
    attribute :province do
      province.slug
    end

    searchable_attributes %i[title description]
    filterable_attributes %i[province]
    sortable_attributes %i[created_at]
  end

  friendly_id :title, use: %i[slugged finders]

  belongs_to :account
  belongs_to :province
  after_touch :index!

  has_rich_text :description

  validates :title,
            :description,
            presence: true

  # Overriding the friendly_id method
  alias_attribute :should_generate_new_friendly_id?, :title_changed?
end
