class AppDelegate
  attr_accessor :recipes
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    viewController = RecipeListViewController.alloc.init
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = viewController 
    viewController.recipes = recipes
    @window.makeKeyAndVisible
    true
  end

  def recipes
    if @recipes.nil?
      @recipes = []
      10.times do |i|
        recipe = PRPRecipe.alloc.init
        recipe.directions = "#{i} - Put some stuff in, and the other stuff, then stir"
        recipe.title = "#{i} - One Fine Food"
        recipe.image = UIImage.imageNamed "IMG_1948.jpg"
        @recipes << recipe
      end
    end
    @recipes
  end
end
