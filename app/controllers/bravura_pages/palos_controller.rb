require_dependency "bravura_pages/application_controller"

module BravuraPages
  class PalosController < BravuraPages::ApplicationController
    before_action :set_palo, only: [ :show, :edit, :update, :destroy ]

    def index
      @palos = Palo.all
    end

    def show
    end

    def new
      @palo = Palo.new
    end

    def create
      @palo = Palo.new(palo_params)
      @palo.author = current_user
      if @palo.save
        redirect_to @palo, notice: "Palo was successfully created."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @palo.update(palo_params)
        redirect_to @palo, notice: "Palo was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @palo.destroy
      redirect_to palos_url, notice: "Palo was successfully destroyed."
    end

    private

    def set_palo
      @palo = Palo.find(params[:id])
    end

    def palo_params
      params.require(:palo).permit(:title, :content)
    end
  end
end
