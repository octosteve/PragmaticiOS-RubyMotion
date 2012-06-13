class RecipeListViewController < UITableViewController
  attr_accessor :data_source
  def loadView
    views = NSBundle.mainBundle.loadNibNamed "RecipeViewController", owner:self, options:nil
    self.view = views.first
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tv, numberOfRowsInSection:section)
    @data_source.recipe_count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_identifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, 
                                                 reuseIdentifier:cell_identifier)
      recipe = @data_source[indexPath.row]
      cell.textLabel.text = recipe.title
      cell.imageView.image = recipe.image
      cell.detailTextLabel.text = "#{recipe.preparation_time} minutes"
      cell
    end
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    if editingStyle == UITableViewCellEditingStyleDelete
      @data_source.delete(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], 
                                       withRowAnimation:UITableViewRowAnimationMiddle)
    elsif editingStyle == UITableViewCellEditingStyleInsert
    end
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    detailVC = ViewController.alloc.initWithNibName("ViewController", bundle:nil)
    detailVC.recipe = @data_source[indexPath.row]
    presentViewController(detailVC, animated:true, completion:nil)
  end
end


