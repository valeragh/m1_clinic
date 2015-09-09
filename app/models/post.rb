class Post < ActiveRecord::Base
  mount_uploader :image_url, ImageUploader
  validates :name, :title, :image_url, :description, presence: true

    extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end