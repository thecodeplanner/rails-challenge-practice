class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  def number_of_floors_available
    # each office knows its floor number
    # we have n number of floors
    all_floors = Array(1..self.number_of_floors)

    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def total_rent_income
    self.companies.count * self.rent_per_floor
  end

end
