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
      @recipes = []
      6.times do |i|
        recipe = Recipe.new
        recipe.directions = "#{i} - Put some stuff in, and the other stuff, then stir"
        recipe.title = "#{i} - One Fine Food"
        recipe.image = UIImage.imageNamed "IMG_1948.jpg"
        @recipes << recipe
      end
    end
    @recipes
  end
end
