class Photo < ApplicationRecord
  belongs_to :post
  
  attachment :image
end
