require 'rails_helper'

RSpec.describe Notification, type: :model do
  # let(:notification) { FactoryBot.create(:notification) }

  describe 'validation' do
    it 'has valid factory' do
      expect(FactoryBot.create(:notification)).to be_valid
    end
  end

end
