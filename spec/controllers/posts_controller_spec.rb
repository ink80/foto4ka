require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe '#index' do
    subject { process :index }
    let(:posts) { create_list(:post, 3) }

    it 'renders the index template' do
      subject
      expect(response).to render_template :index
    end

    it 'assigns @posts' do
      subject
      expect(assigns(:posts)).to eq posts
    end

    context 'when user is not signed in' do
      before { sign_out user }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#create' do
    subject { process :create, method: :post, params: }

    let(:params) { { post: attributes_for(:post) } }

    it 'creates a post' do
      expect { subject }.to change(Post, :count).by(1)
    end

    it 'redirects to the posts page' do
      subject
      expect(response).to redirect_to post_path(Post.last)
    end

    it 'assigns post to current user' do
      subject
      expect(assigns(:post).user).to eq user
    end
  end

  describe '#update' do
    subject { process :update, method: :patch, params: }

    let(:params) { { id: post.id, post: {title: 'New Title'} } }
    let(:post) { create(:post, user: user) }
    
    it 'updates the post' do
      subject 
      expect(assigns(:post).title).to eq 'New Title'
    end

    it 'redirects to the post page' do
      subject
      expect(response).to redirect_to post_path(post)
    end

    it 'assigns post to current user' do
      subject
      expect(assigns(:post).user).to eq user
    end
  end

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: }
    let(:params) { { id: post.id } }
    let!(:post) { create(:post, user:) }

    it 'deletes the post' do
      expect { subject }.to change(user.posts, :count).by(-1)
    end

    it 'redirects to the posts page' do
      subject
      expect(response).to redirect_to root_path
    end

    # context 'when user tries to remove someones posts' do
    #   let(:post) { create :post }

    #   it 'redirects to posts page' do
    #     expect { subject }.to raise_exception(ActiveRecord::RecordNotFound).and(change(user.posts, :count).by(0))
    #   end
    # end
  end
end
