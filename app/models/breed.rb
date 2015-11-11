class Breed < ActiveRecord::Base
  has_many :dogs

  validates :breed_name, presence: true
end

# == Schema Information
#
# Table name: breeds
#
#  id         :integer          not null, primary key
#  breed_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
