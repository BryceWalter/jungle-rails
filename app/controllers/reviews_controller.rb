class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @new_review = @product.new_review(review_params, current_user)

    if @new_review.save
      redirect_to [@product]
    else
      @reviews = @product.reviews.order(created_at: :desc)
      redirect_to [@product]
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find params[:id]
    @review.destroy
    redirect_to [@product]
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
