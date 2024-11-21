class CategorisationsController < ApplicationController
  before_action :authenticate_user!
  def index
    matching_categorisations = Categorisation.all

    @list_of_categorisations = matching_categorisations.order({ :created_at => :desc })

    render({ :template => "categorisations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_categorisations = Categorisation.where({ :id => the_id })

    @the_categorisation = matching_categorisations.at(0)

    render({ :template => "categorisations/show" })
  end

  def create
    the_categorisation = Categorisation.new
    the_categorisation.food_id = params.fetch("query_food_id")
    cat_id = params.fetch("query_category_id")
    the_categorisation.category_id = cat_id
    if the_categorisation.valid?
      the_categorisation.save
      redirect_to("/categories/"+ cat_id, { :notice => "Categorisation created successfully." })
    else
      redirect_to("/categories/" + cat_id, { :alert => the_categorisation.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_categorisation = Categorisation.where({ :id => the_id }).at(0)

    the_categorisation.food_id = params.fetch("query_food_id")
    the_categorisation.category_id = params.fetch("query_category_id")

    if the_categorisation.valid?
      the_categorisation.save
      redirect_to("/categorisations/#{the_categorisation.id}", { :notice => "Categorisation updated successfully."} )
    else
      redirect_to("/categorisations/#{the_categorisation.id}", { :alert => the_categorisation.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_categorisation = Categorisation.where({ :id => the_id }).at(0)
    food = the_categorisation.food

    the_categorisation.destroy

    redirect_to("/foods/" + food.id.to_s, { :notice => "Categorisation deleted successfully."} )
  end
end
