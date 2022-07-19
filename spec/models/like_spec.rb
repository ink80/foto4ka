require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { build(:like) }

  it 'is valid' do
    is_expected.to be_valid
  end

  it 'is invalid without a user' do
    subject.user = nil
    is_expected.to be_invalid
  end
end
