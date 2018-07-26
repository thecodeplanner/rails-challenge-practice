class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  def total_rent_income
    self.offices.count * self.rent_per_floor
  end

  def number_of_floors_available
    all_floors = Array(1..self.number_of_floors)

    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    # self.number_of_floors_available.map {|f| Office.new(floor: f, building: self) }
    self.number_of_floors_available.map {|f| self.offices.build(floor: f) }
  end
end
