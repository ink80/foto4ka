require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe '#create' do
    subject { process :create, method: :post, params: }

    let(:params) { { post_id: post.id } }
    let(:post) { create(:post, user:) }

    it 'creates a like' do
      expect { subject }.to change(Like, :count).by(1)
    end

    # it 'assigns like to current user' do
    #   subject
    #   expect(assigns(:like).user).to eq user
    # end
  end

#   describe '#destroy' do
#     subject { process :destroy, method: :delete }
#     let(:like) { create(:like, user: user) }

#     it 'deletes the like' do
#       expect { subject }.to change(Like, :count).by(-1)
#     end
#   end
end
