require_dependency "bravura_pages/application_controller"

module BravuraPages
  class StaticPagesController < BravuraPages::ApplicationController
    before_action :set_static_page, only: [ :show, :edit, :update, :destroy ]

    def index
      @static_pages = StaticPage.all
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

    private

    def set_static_page
      @static_page = StaticPage.find(params[:id])
    end

    def static_page_params
      params.require(:static_page).permit(:title, :content, :published_at)
    end
  end
end
