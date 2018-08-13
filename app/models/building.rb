class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  def total_rent_income
    companies.count * rent_per_floor
  end

  def number_of_floors_available
    all_floors = Array(1..number_of_floors)
    offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end


end
