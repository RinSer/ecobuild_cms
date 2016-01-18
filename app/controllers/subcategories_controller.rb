class SubcategoriesController < ApplicationController
  before_action :ensure_login
  before_action :set_category
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  def index
    @subcategories = @catefory.subcategories.all
  end

  def show
  end

  def new
    @subcategory = @category.subcategories.new
  end

  def edit
  end

  def create
    @subcategory = @category.subcategories.new(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to admins_path, notice: 'Подкатегория успешно сохранена.' }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to admins_path, notice: 'Подкатегория успешно обновлена.' }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Подкатегория успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Confirm that user has logged in
    def ensure_login
      redirect_to login_path unless session[:admin_id]
    end

    # Add category
    def set_category
      @category = Category.find(params[:category_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = @category.subcategories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcategory_params
      params.require(:subcategory).permit(:title, :description, :image, :pic_url)
    end
end
