class MainViewController < UIViewController
  attr_accessor :recipe_title, :recipe, :directionsView, :imageView
  def loadView
    views = NSBundle.mainBundle.loadNibNamed "MainViewController", owner:self, options:nil
    self.view = views.first
  end
  
  def viewWillAppear(animated)
    recipe_title.text = @recipe.title
    directionsView.text = @recipe.directions
    unless recipe.image.nil?
      imageView.image = recipe.image
    end
  end

  def viewDidUnload
    directionsView = nil
    recipeTitle = nil
    imageView = nil
  end
end
