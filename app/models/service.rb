class Service < ActiveRecord::Base
  belongs_to :service_category

  mount_uploader :image_url, ImageUploader

  validates :name, :image_url, :description, :service_category_id, presence: true
  validates :name, length: {
    minimum: 2,
    maximum: 50,
    too_short: "должен содержать не менее %{count} символа",
    too_long: "должен содержать не более %{count} символов"
  }


  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end
