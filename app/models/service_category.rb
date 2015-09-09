class ServiceCategory < ActiveRecord::Base
  has_many :services, :dependent => :destroy
  mount_uploader :image_url, ImageUploader
  mount_uploader :image_small_url, ImageUploader

  validates :name, :image_url, :image_small_url, presence: true
  
  #include PgSearch
  #pg_search_scope :search, against: [:name],
  #associated_against: {services: [:name, :description, :description_two]}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      all
    end
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end
