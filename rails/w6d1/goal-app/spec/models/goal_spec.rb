require 'rails_helper'

RSpec.describe Goal, type: :model do

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id) }
    it { should have_many(:comments).class_name(:Comment) }
    it { should belong_to(:user).class_name(:User) }

end