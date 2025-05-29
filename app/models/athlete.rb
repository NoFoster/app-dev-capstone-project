# == Schema Information
#
# Table name: athletes
#
#  id                   :bigint           not null, primary key
#  bio                  :text
#  college_profile_url  :string
#  current_college      :string
#  insta_follower_count :integer
#  insta_url            :string
#  interests            :string
#  location             :string
#  name                 :string
#  photo                :string
#  previous_college     :string
#  primary_sport        :string
#  secondary_sport      :string
#  tik_tok_impres_avg   :integer
#  tik_tok_url          :string
#  year                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#
class Athlete < ApplicationRecord
end
