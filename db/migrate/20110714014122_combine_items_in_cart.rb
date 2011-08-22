class CombineItemsInCart < ActiveRecord::Migration
	def self.up
	  Cart.all.each do |cart|
		  sums = cart.line_items.group(:machandise_id).sum(:quantity)
		  sums.each do |machandise_id, quantity|
			  if quantity >1
			    cart.line_items.where(:machandise_id=>machandise_id).delete_all
			    cart.line_items.create(:machandise_id=>machandise_id, :quantity=>quantity)
			  end
	      end
	  end
	end

  def self.down
  end
end
