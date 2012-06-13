class RecipesSource < RecipesListDataSource

  def initialize
    @recipes = recipes
  end

  def recipe_count
    @recipes.count
  end

  def [](index)
    recipes[index]
  end

  def delete(index)
    recipes.delete_at(index)
  end

  def recipes
    if @recipes.nil?
      @recipes = (1..5).map do |i|
        recipe = Recipe.new
        recipe.directions = "#{i} - Put some stuff in, and the other stuff, then stir"
        recipe.title = "#{i} - One Fine Food"
        recipe.image = UIImage.imageNamed "IMG_1948.jpg"
        recipe.preparation_time = 100
        recipe
      end
    else
      @recipes
    end
  end
end
