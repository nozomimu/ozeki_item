class Item < ApplicationRecord

	attachment :image
	has_many :histories
	has_many :carts
	belongs_to :category

	enum active: { display: 0, hide: 1}

end
