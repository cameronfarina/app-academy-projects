require 'rails_helper'

RSpec.describe Goal, type: :model do

    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }

end