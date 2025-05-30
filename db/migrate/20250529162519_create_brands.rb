class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :location
      t.string :business_type
      t.integer :annual_revenue
      t.text :description
      t.string :website_url
      t.string :insta_url
      t.string :requirements
      t.string :logo
      t.integer :user_id

      t.timestamps
    end
  end
end
