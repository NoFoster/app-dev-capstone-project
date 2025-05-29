class CreateAthletes < ActiveRecord::Migration[7.1]
  def change
    create_table :athletes do |t|
      t.string :primary_sport
      t.string :secondary_sport
      t.string :current_college
      t.string :previous_college
      t.string :location
      t.string :year
      t.string :college_profile_url
      t.string :insta_url
      t.string :tik_tok_url
      t.integer :insta_follower_count
      t.integer :tik_tok_impres_avg
      t.string :photo
      t.text :bio
      t.string :interests
      t.integer :user_id

      t.timestamps
    end
  end
end
