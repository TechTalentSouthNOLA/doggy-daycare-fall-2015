class Owner < ActiveRecord::Base
  has_many :dogs

  # Normalizes the attribute itself before validation
  phony_normalize :phone, default_country_code: 'US'

  validates :first_name, :last_name, presence: true
  validates_plausible_phone :phone, normalized_country_code: 'US', presence: true

  def last_comma_first
    "#{last_name}, #{first_name}"
  end

end

# == Schema Information
#
# Table name: owners
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  phone       :string
#  evac_waiver :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
