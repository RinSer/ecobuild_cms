class AdminsController < ApplicationController
  before_action :ensure_login
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :set_categories
  helper_method :logged_in?, :current_admin


  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
    @main_data = MainDatum.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Пользователь успешно создан.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if params[:password] == params[:password_confirmation]
      respond_to do |format|
        if @admin.update(admin_params)
          format.html { redirect_to admins_path, notice: 'Пользователь успешно обновлен.' }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :back, alert: 'Пароль должен быть введен правильно два раза!'
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if (Admin.count > 1)
      @admin.destroy
      respond_to do |format|
        format.html { redirect_to admins_url, notice: 'Пользователь успешно удален.' }
        format.json { head :no_content }
      end
    else
      redirect_to :back, alert: 'Должен быть хотя бы один администратор!!!'
    end
  end

  private
    # Confirm that user has logged in
    def ensure_login
      redirect_to login_path unless session[:admin_id]
    end

    def logged_in?
      session[:admin_id]
    end

    def current_admin
      @current_admin ||= Admin.find(session[:admin_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Add categories
    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :password, :password_confirmation)
    end
end
