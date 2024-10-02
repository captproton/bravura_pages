require 'rails_helper'

module BravuraPages
  RSpec.describe "/static_pages", type: :request do
    include Engine.routes.url_helpers

    let(:valid_attributes) {
      skip("Add a hash of attributes valid for your model")
    }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    describe "GET /index" do
      it "renders a successful response" do
        pending("Test implementation pending")
        StaticPage.create! valid_attributes
        get static_pages_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        pending("Test implementation pending")
        static_page = StaticPage.create! valid_attributes
        get static_page_url(static_page)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        pending("Test implementation pending")
        get new_static_page_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        pending("Test implementation pending")
        static_page = StaticPage.create! valid_attributes
        get edit_static_page_url(static_page)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new StaticPage" do
          pending("Test implementation pending")
          expect {
            post static_pages_url, params: { static_page: valid_attributes }
          }.to change(StaticPage, :count).by(1)
        end

        it "redirects to the created static_page" do
          pending("Test implementation pending")
          post static_pages_url, params: { static_page: valid_attributes }
          expect(response).to redirect_to(static_page_url(StaticPage.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new StaticPage" do
          pending("Test implementation pending")
          expect {
            post static_pages_url, params: { static_page: invalid_attributes }
          }.to change(StaticPage, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          pending("Test implementation pending")
          post static_pages_url, params: { static_page: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested static_page" do
          pending("Test implementation pending")
          static_page = StaticPage.create! valid_attributes
          patch static_page_url(static_page), params: { static_page: new_attributes }
          static_page.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the static_page" do
          pending("Test implementation pending")
          static_page = StaticPage.create! valid_attributes
          patch static_page_url(static_page), params: { static_page: new_attributes }
          static_page.reload
          expect(response).to redirect_to(static_page_url(static_page))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          pending("Test implementation pending")
          static_page = StaticPage.create! valid_attributes
          patch static_page_url(static_page), params: { static_page: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested static_page" do
        pending("Test implementation pending")
        static_page = StaticPage.create! valid_attributes
        expect {
          delete static_page_url(static_page)
        }.to change(StaticPage, :count).by(-1)
      end

      it "redirects to the static_pages list" do
        pending("Test implementation pending")
        static_page = StaticPage.create! valid_attributes
        delete static_page_url(static_page)
        expect(response).to redirect_to(static_pages_url)
      end
    end
  end
end
