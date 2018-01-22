class Item < ApplicationRecord

	attachment :image
	has_many :discs, dependent: :destroy
	has_many :histories
	has_many :carts
	#belongs_to :category

 	accepts_nested_attributes_for :discs

end
