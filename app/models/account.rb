# frozen_string_literal: true

class Account < ApplicationRecord
  extend FriendlyId

  friendly_id :display_name_and_ulid, use: %i[slugged finders]

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:google_oauth2]

  has_many :jobs, dependent: :destroy
  has_one_attached :logo
  has_one_attached :cover_image

  validates :display_name, presence: true

  before_create do
    add_default_logo
  end

  after_create_commit :add_default_cover_image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.display_name = auth.info.name
    end
  end

  private

  def add_default_logo
    default_logo = Avatarly.generate_avatar(display_name, {
                                              size: 150,
                                              background_color: '#15A800',
                                              font_color: '#ffffff'
                                            })

    logo.attach(
      io: StringIO.new(default_logo),
      filename: "account-#{id}-default-logo.png",
      content_type: 'image/png'
    )
  end

  def add_default_cover_image
    cover_image.attach(
      io: File.open(Rails.root.join('app/assets/images/default-cover-image.jpg')),
      filename: "account-#{id}-default-cover-image.jpg",
      content_type: 'image/jpg'
    )
  end

  def display_name_and_ulid
    "#{display_name} #{ULID.generate}"
  end

  # Overriding the friendly_id method
  alias_attribute :should_generate_new_friendly_id?, :display_name_changed?
end
