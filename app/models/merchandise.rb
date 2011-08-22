class Merchandise < ActiveRecord::Base
  default_scope :order => 'merchandise_name'

  has_many:line_items
  has_many :orders, :through => :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :merchandise_name, :presence => true,:length => {:maximum => 64}
  validates :price, :presence => true
  validates :merchandise_detail, :presence => true
  validates :production_month_from, :numericality => true, :inclusion => 1..12
  validates :production_month_to,:numericality => true, :inclusion => 1..12
  validates :origin, :length => {:maximum => 25}

  private 
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
