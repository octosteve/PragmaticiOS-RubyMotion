class RecipeListViewController < UITableViewController
  attr_accessor :recipes
  def loadView
    views = NSBundle.mainBundle.loadNibNamed "RecipeViewController", owner:self, options:nil
    self.view = views.first
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tv, numberOfRowsInSection:section)
    if @recipes
      @recipes.count
    else
      0
    end
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_identifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, 
                                                 reuseIdentifier:cell_identifier)
      cell.textLabel.text = @recipes.objectAtIndex(indexPath.row).title
      cell
    end
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    if editingStyle == UITableViewCellEditingStyleDelete
    tableView.deleteRowsAtIndexPaths(NSArray.arrayWithObject(indexPath), 
                                     withRowAnimation:UITableViewRowAnimationFade)
    elsif editingStyle == UITableViewCellEditingStyleInsert
    end
  end
end


