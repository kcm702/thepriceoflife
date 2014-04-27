class Item < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	attr_accessor :total_cost

	class << self
		def price_total
			total = 0.0
			Item.order(:id).collect do |p|
				total += p.price
				p.total_cost=total
			end
		end
	end

end
