class Currency < ActiveRecord::Base
  has_many :countries

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
end
