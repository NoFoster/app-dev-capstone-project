class AddNameToAthletes < ActiveRecord::Migration[7.1]
  def change
    add_column :athletes, :name, :string
  end
end
