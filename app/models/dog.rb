class Dog < ActiveRecord::Base
  belongs_to :breed
  belongs_to :owner

  validates :name, :breed_id, :owner_id, :dob, presence: true

  has_attached_file :avatar, styles: {
    medium: "300x300#",
    thumb: "100x100#"
    }, default_url: ":style_missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_attachment_size :avatar, :less_than => 3.megabytes,
    :unless => Proc.new {|m| m[:avatar_file_name].blank?}
end

# == Schema Information
#
# Table name: dogs
#
#  id                  :integer          not null, primary key
#  name                :string
#  breed_id            :integer
#  dob                 :date
#  owner_id            :integer
#  medical_conditions  :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  in_daycare          :boolean
#
# Indexes
#
#  index_dogs_on_breed_id  (breed_id)
#  index_dogs_on_owner_id  (owner_id)
#
