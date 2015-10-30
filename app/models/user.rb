class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, :foreign_key => :sender_id
  has_many :certificates
  mount_uploader :image_url, ImageUploader

  def role?(r)
    role.include? r.to_s
  end


end