require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_uniqueness_of(:name) }
  end
end