class RecipesListDataSource
  attr_accessor :recipe_count

  def [](index)
    raise "Please implement #[] in your class"
  end

  def delete(index)
    rais "Please implement #delete()"
  end
end
