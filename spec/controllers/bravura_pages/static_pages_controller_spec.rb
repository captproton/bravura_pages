# spec/controllers/bravura_pages/static_pages_controller_spec.rb
require 'rails_helper'

module BravuraPages
  RSpec.describe StaticPagesController, type: :controller do
    let(:account) { create(:account) }
    let(:user) { create(:user) }

    before do
      ActsAsTenant.current_tenant = account
      sign_in user
    end

    describe 'GET #index' do
      it 'returns a successful response' do
        get :index
        expect(response).to be_successful
      end

      it 'assigns @static_pages' do
        static_page = create(:bravura_pages_static_page, account: account)
        get :index
        expect(assigns(:static_pages)).to eq([ static_page ])
      end
    end

    describe 'GET #show' do
      it 'returns a successful response' do
        static_page = create(:bravura_pages_static_page, account: account)
        get :show, params: { id: static_page.to_param }
        expect(response).to be_successful
      end
    end

    describe 'GET #new' do
      it 'returns a successful response' do
        get :new
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new StaticPage' do
          expect {
            post :create, params: { static_page: attributes_for(:bravura_pages_static_page) }
          }.to change(StaticPage, :count).by(1)
        end

        it 'redirects to the created static_page' do
          post :create, params: { static_page: attributes_for(:bravura_pages_static_page) }
          expect(response).to redirect_to(StaticPage.last)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the new template)' do
          post :create, params: { static_page: attributes_for(:bravura_pages_static_page, title: nil) }
          expect(response).to be_successful
        end
      end
    end

    describe 'GET #edit' do
      it 'returns a successful response' do
        static_page = create(:bravura_pages_static_page, account: account)
        get :edit, params: { id: static_page.to_param }
        expect(response).to be_successful
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) { { title: 'Updated Title' } }

        it 'updates the requested static_page' do
          static_page = create(:bravura_pages_static_page, account: account)
          put :update, params: { id: static_page.to_param, static_page: new_attributes }
          static_page.reload
          expect(static_page.title).to eq 'Updated Title'
        end

        it 'redirects to the static_page' do
          static_page = create(:bravura_pages_static_page, account: account)
          put :update, params: { id: static_page.to_param, static_page: new_attributes }
          expect(response).to redirect_to(static_page)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the edit template)' do
          static_page = create(:bravura_pages_static_page, account: account)
          put :update, params: { id: static_page.to_param, static_page: attributes_for(:bravura_pages_static_page, title: nil) }
          expect(response).to be_successful
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested static_page' do
        static_page = create(:bravura_pages_static_page, account: account)
        expect {
          delete :destroy, params: { id: static_page.to_param }
        }.to change(StaticPage, :count).by(-1)
      end

      it 'redirects to the static_pages list' do
        static_page = create(:bravura_pages_static_page, account: account)
        delete :destroy, params: { id: static_page.to_param }
        expect(response).to redirect_to(static_pages_url)
      end
    end

    describe 'PUT #publish' do
      it 'publishes the static page' do
        static_page = create(:bravura_pages_static_page, :draft, account: account)
        put :publish, params: { id: static_page.to_param }
        static_page.reload
        expect(static_page).to be_published
      end
    end

    describe 'PUT #unpublish' do
      it 'unpublishes the static page' do
        static_page = create(:bravura_pages_static_page, :published, account: account)
        put :unpublish, params: { id: static_page.to_param }
        static_page.reload
        expect(static_page).not_to be_published
      end
    end
  end
end
