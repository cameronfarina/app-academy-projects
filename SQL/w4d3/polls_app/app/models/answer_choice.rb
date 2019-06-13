# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord
    
    belongs_to :question,
        class_name: :Question,
        foreign_key: :question_id,
        primary_key: :id

    has_many :responses,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :Response

        
end
