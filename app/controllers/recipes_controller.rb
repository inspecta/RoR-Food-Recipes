class RecipesController < ApplicationController
  # Load recipe authorization
  load_and_authorize_resource

  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(user_id: current_user.id, **recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html do
          redirect_to recipe_url(@recipe),
                      notice: 'Recipe was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html do
        redirect_to recipes_url,
                    notice: 'Recipe was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    # params.fetch(:recipe, {})
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time,
                                   :description, :public)
  end
end
