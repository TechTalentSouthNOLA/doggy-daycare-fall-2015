class Dog < ActiveRecord::Base
  belongs_to :breed
  belongs_to :owner

  validates :name, :breed_id, :owner_id, :dob, presence: true
end

# == Schema Information
#
# Table name: dogs
#
#  id                 :integer          not null, primary key
#  name               :string
#  breed_id           :integer
#  dob                :date
#  owner_id           :integer
#  medical_conditions :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_dogs_on_breed_id  (breed_id)
#  index_dogs_on_owner_id  (owner_id)
#
