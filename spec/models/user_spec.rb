require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it 'is valid' do
    is_expected.to be_valid
  end

  it 'is invalid without a username' do
    subject.username = nil
    is_expected.to be_invalid
  end

  it 'is invalid without a email' do
    subject.email = nil
    is_expected.to be_invalid
  end
end
