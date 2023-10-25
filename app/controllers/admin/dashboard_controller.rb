class Admin::DashboardController < Admin::BaseAdminController
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
