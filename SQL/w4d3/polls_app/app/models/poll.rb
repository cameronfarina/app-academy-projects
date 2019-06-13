# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
    
    belongs_to :author,
        foreign_key: :user_id,
        class_name: :User,
        primary_key: :id 

    has_many :questions,
        class_name: :Question,
        primary_key: :id,
        foreign_key: :poll_id
end
