class ProductsController < ApplicationController
  before_action :ensure_login
  before_action :set_category
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = @category.products.all
  end

  def show
  end

  def new
    @product = @category.products.new
  end

  def edit
  end

  def create
    @product = @category.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admins_path, notice: 'Товар успешно сохранен.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admins_path, notice: 'Товар успешно обновлен.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Товар успешно удален.' }
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
    def set_product
      @product = @category.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image, :pic_url)
    end
end
