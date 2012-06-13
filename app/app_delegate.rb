class AppDelegate
  attr_accessor :data_source
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    viewController = RecipeListViewController.alloc.init
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = viewController 
    viewController.data_source = RecipesSource.new
    @window.makeKeyAndVisible
    true
  end
end
