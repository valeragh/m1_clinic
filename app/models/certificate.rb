class Certificate < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
  mount_uploader :image_url, ChatUploader

  validates :image_url, presence: true
end
