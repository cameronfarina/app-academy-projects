require 'rails_helper'

RSpec.describe Comment, type: :model do
  
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:goal_id) }
    it { should belong_to(:goal).class_name(:Goal) }
    it { should belong_to(:user).class_name(:User) }    
end