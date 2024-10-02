# app/controllers/bravura_pages/static_pages_controller.rb
module BravuraPages
  class StaticPagesController < ApplicationController
    set_current_tenant_through_filter
    before_action :set_current_account
    before_action :authenticate_user!
    before_action :set_static_page, only: [ :show, :edit, :update, :destroy, :publish, :unpublish ]

    def index
      @static_pages = StaticPage.order(created_at: :desc)
    end

    def show
    end

    def new
      @static_page = StaticPage.new
    end

    def create
      @static_page = StaticPage.new(static_page_params)
      @static_page.author = current_user

      if @static_page.save
        redirect_to @static_page, notice: "Static page was successfully created."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @static_page.update(static_page_params)
        redirect_to @static_page, notice: "Static page was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @static_page.destroy
      redirect_to static_pages_url, notice: "Static page was successfully destroyed."
    end

    def publish
      @static_page.publish
      redirect_to @static_page, notice: "Static page was successfully published."
    end

    def unpublish
      @static_page.unpublish
      redirect_to @static_page, notice: "Static page was successfully unpublished."
    end

    private

    def set_current_account
      #   current_account = Account.find_by!(subdomain: request.subdomain)
      set_current_tenant(current_account)
    end

    def set_static_page
      @static_page = StaticPage.friendly.find(params[:id])
    end

    def static_page_params
      params.require(:static_page).permit(:title, :content, :published_at)
    end
  end
end
