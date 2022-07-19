require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe '#create' do
    subject { process :create, method: :post, params: }

    let(:params) { { post_id: post.id, comment: { body: 'New Comment' } } }
    let(:post) { create(:post, user:) }

    it 'creates a comment' do
      expect { subject }.to change(Comment, :count).by(1)
    end

    it 'redirects to the post page' do
      subject
      expect(response).to redirect_to post_path(post)
    end

    context 'when user is not signed in' do
      before { sign_out user }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
