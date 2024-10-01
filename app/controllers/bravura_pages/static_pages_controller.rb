module BravuraPages
  class StaticPagesController < ApplicationController
    before_action :set_static_page, only: %i[ show edit update destroy ]

    # GET /static_pages
    def index
      @static_pages = StaticPage.all
    end

    # GET /static_pages/1
    def show
    end

    # GET /static_pages/new
    def new
      @static_page = StaticPage.new
    end

    # GET /static_pages/1/edit
    def edit
    end

    # POST /static_pages
    def create
      @static_page = StaticPage.new(static_page_params)

      if @static_page.save
        redirect_to @static_page, notice: "Static page was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /static_pages/1
    def update
      if @static_page.update(static_page_params)
        redirect_to @static_page, notice: "Static page was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /static_pages/1
    def destroy
      @static_page.destroy!
      redirect_to static_pages_url, notice: "Static page was successfully destroyed.", status: :see_other
    end

    private

    def set_static_page
      @static_page = StaticPage.friendly.find(params[:id])
    end

      # Only allow a list of trusted parameters through.
      def static_page_params
        params.require(:static_page).permit(:account_id, :title, :content)
      end
  end
end
