require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user:) }

  before { sign_in user }

  describe '#show' do
    subject { process :show, method: :get, params: }

    let(:params) { { id: user.id } }

    it 'renders the show template' do
      subject
      expect(response).to render_template :show
    end

    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq user
    end

    context 'when user is not signed in' do
      before { sign_out user }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

#   describe '#update' do
#     subject { process :update, method: :patch, params: }

#     let(:params) { { id: user.id, profile: { name: 'New Name', bio: 'New Bio' } } }

#     it 'updates the profile' do
#       subject
#       expect(assigns(:profile).name).to eq 'New Name'
#     end

#     it 'redirects to the profile page' do
#       subject
#       expect(response).to redirect_to view_profile_path(user.id)
#     end

#     context 'when user is not signed in' do
#       before { sign_out user }
#       it 'redirects to the sign in page' do
#         subject
#         expect(response).to redirect_to new_user_session_path
#       end
#     end
#   end
end
