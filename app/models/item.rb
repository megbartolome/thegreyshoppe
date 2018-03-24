class Item < ApplicationRecord

	validates :name, presence: true

	def total_price
		quantity * price if quantity.present? && price.present?
	end

end
