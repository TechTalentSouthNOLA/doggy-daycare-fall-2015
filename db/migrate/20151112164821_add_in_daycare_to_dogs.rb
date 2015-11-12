class AddInDaycareToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :in_daycare, :boolean
  end
end
