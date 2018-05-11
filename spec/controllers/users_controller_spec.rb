require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'POST #import' do
    context 'with correct file' do
      it 'returns success' do
        @file = fixture_file_upload(Rails.root.join('public', 'test.csv'))
        post :import, params: { file: @file }
        expect(response).to redirect_to(users_path)
        expect(flash[:notice]).to match(/Data imported!/)
      end
    end

    context 'with another file format' do
      it 'returns error' do
        @file = fixture_file_upload(Rails.root.join('public', 'robots.txt'))
        post :import, params: { file: @file }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to match(/Invalid format - txt! Must be - CSV!/)
      end
    end
  end
end