# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_name  :string
#

class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true 

  has_many :artworks, dependent: :destroy, 
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork  

  has_many :artwork_shares, dependent: :destroy, 
    primary_key: :id, 
    foreign_key: :viewer_id, 
    class_name: :ArtworkShare 

  has_many :shared_artworks, 
    through: :artwork_shares, 
    source: :artwork 
end
