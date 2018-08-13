class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees
  accepts_nested_attributes_for :employees
  accepts_nested_attributes_for :offices

  def total_cost
    self.buildings.pluck(:rent_per_floor).reduce(:+)
  end

  def office_info
    self.offices.map do |office|
      "#{office.building.name} F#{office.floor} - $#{office.building.rent_per_floor}"
    end
  end
end
