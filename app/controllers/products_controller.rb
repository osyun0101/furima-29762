class ProductsController < ApplicationController
  def index
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:content,:price,:image,:category_id,:state_id,:delivery_fee_id,:area_id,:delivery_day_id).merge(user_id: current_user.id)
  end
end
