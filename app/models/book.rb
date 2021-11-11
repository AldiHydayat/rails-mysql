class Book < ApplicationRecord
	# belongs_to :author

	# validates :title, uniqueness: true
	validates :pages, :presence => true
	# validates :price, length: { minimum: 3 }
	# validates :price, numericality: { less_than: 50000 }, if: :page_conditional
	validates :price, numericality: { less_than: 50000 }, if: Proc.new {|r| r.pages <= 100 }
	# validate :custom_validate

	def page_conditional
		pages <= 100
	end

	# custom validate
	def custom_validate
		if price >= 100000
			if pages <= 100
				errors.add(:price, 'harga tidak boleh lebih dari 100000')
			end
		end
	end

	def self.expensive
		where('price >= 100000')
	end

	def self.greater_than(price)
		where('price >= ?', price)
	end
end
