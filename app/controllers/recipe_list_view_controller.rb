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
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, 
                                                 reuseIdentifier:cell_identifier)
      cell.textLabel.text = @data_source[indexPath.row].title
      cell
    end
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    if editingStyle == UITableViewCellEditingStyleDelete
      @data_source.delete(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], 
                                       withRowAnimation:UITableViewRowAnimationFade)
    elsif editingStyle == UITableViewCellEditingStyleInsert
    end
  end
end


