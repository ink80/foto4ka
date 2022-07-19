require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  it 'is valid' do
    is_expected.to be_valid
  end

  it 'is invalid without a body' do
    subject.body = nil
    is_expected.to be_invalid
  end

  it 'is invalid without a username' do
    subject.username = nil
    is_expected.to be_invalid
  end
end
