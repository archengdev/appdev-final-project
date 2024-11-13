class FoodsController < ApplicationController
  def index
    matching_foods = Food.all

    @list_of_foods = matching_foods.order({ :created_at => :desc })

    render({ :template => "foods/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_foods = Food.where({ :id => the_id })

    @the_food = matching_foods.at(0)

    render({ :template => "foods/show" })
  end

  def create
    the_food = Food.new
    the_food.image_url = params.fetch("query_image_url")
    the_food.name = params.fetch("query_name")

    if the_food.valid?
      the_food.save
      redirect_to("/foods", { :notice => "Food created successfully." })
    else
      redirect_to("/foods", { :alert => the_food.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_food = Food.where({ :id => the_id }).at(0)

    the_food.image_url = params.fetch("query_image_url")
    the_food.name = params.fetch("query_name")

    if the_food.valid?
      the_food.save
      redirect_to("/foods/#{the_food.id}", { :notice => "Food updated successfully."} )
    else
      redirect_to("/foods/#{the_food.id}", { :alert => the_food.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_food = Food.where({ :id => the_id }).at(0)

    the_food.destroy

    redirect_to("/foods", { :notice => "Food deleted successfully."} )
  end
end
