class ViewController < UIViewController
  attr_accessor :recipe_title, :recipe, :directionsView, :imageView, :prep_time
  def loadView
    views = NSBundle.mainBundle.loadNibNamed "ViewController", owner:self, options:nil
    self.view = views.first
  end
  
  def viewWillAppear(animated)
    recipe_title.text = recipe.title
    directionsView.text = recipe.directions
    prep_time.text = "#{recipe.preparation_time} minutes"
    unless recipe.image.nil?
      imageView.image = recipe.image
    end
  end

  def viewDidUnload
    directionsView = nil
    recipeTitle = nil
    imageView = nil
  end

  def dismiss(sender)
    dismissViewControllerAnimated(true, completion:nil)
  end
end
