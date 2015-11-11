class Owner < ActiveRecord::Base
  has_many :dogs

  validates :first_name, :last_name, :phone, presence: true
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
