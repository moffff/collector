class Country < ActiveRecord::Base
  belongs_to :currency
  has_many :visited_countries

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
  validates :currency, :presence => true

  scope :visited, -> { joins(:visited_countries) }
  scope :remainig, -> { joins("left join visited_countries v ON  countries.id = v.country_id").where("v.id is null") }

  def visited?
    visited_countries.any?
  end
end
