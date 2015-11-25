class MainDataController < ApplicationController
  before_action :ensure_login
  before_action :set_main_datum, only: [:show, :edit, :update, :destroy]

  # GET /main_data/1/edit
  def edit
  end

  # PATCH/PUT /main_data/1
  # PATCH/PUT /main_data/1.json
  def update
    respond_to do |format|
      if @main_datum.update(main_datum_params)
        format.html { redirect_to admins_path, notice: 'Контактная информация успешно изменена.' }
        format.json { render :show, status: :ok, location: @main_datum }
      else
        format.html { render :edit }
        format.json { render json: @main_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Check login status
    def ensure_login
      redirect_to login_path unless session[:admin_id]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_main_datum
      @main_datum = MainDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_datum_params
      params.require(:main_datum).permit(:title, :telephone, :address, :about)
    end
end
