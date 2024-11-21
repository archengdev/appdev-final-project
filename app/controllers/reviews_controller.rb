class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    # @userID = current_user.id
    matching_reviews = Review.all

    # @list_of_reviews = matching_reviews.order({ :created_at => :desc })
    @list_of_reviews = @user.reviews.order({ :created_at => :desc })

    render({ :template => "reviews/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)
    @food = @the_review.food

    render({ :template => "reviews/show" })
  end

  def create
    the_review = Review.new
    the_review.food_id = params.fetch("query_food_id")
    the_review.user_id = params.fetch("query_user_id")
    the_review.rating = params.fetch("query_rating")
    the_review.description = params.fetch("query_description")

    if the_review.valid?
      the_review.save
      redirect_to("/foods/"+params.fetch("query_food_id"), { :notice => "Review created successfully." })
    else
      redirect_to("/foods/"+params.fetch("query_food_id"), { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.food_id = params.fetch("query_food_id")
    the_review.user_id = params.fetch("query_user_id")
    the_review.rating = params.fetch("query_rating")
    the_review.description = params.fetch("query_description")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)
    food_id = the_review.food.id

    the_review.destroy

    redirect_to("/foods/"+food_id.to_s, { :notice => "Review deleted successfully."} )
  end
end
