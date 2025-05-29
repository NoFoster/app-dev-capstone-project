# == Schema Information
#
# Table name: brands
#
#  id             :bigint           not null, primary key
#  annual_revenue :integer
#  business_type  :string
#  description    :text
#  insta_url      :string
#  location       :string
#  logo           :string
#  name           :string
#  requirements   :string
#  website_url    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Brand < ApplicationRecord
end
