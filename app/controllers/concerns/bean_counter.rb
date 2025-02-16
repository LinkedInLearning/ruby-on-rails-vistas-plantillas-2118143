module BeanCounter
  extend ActiveSupport::Concern

  def count_beans(recipe)
    recipe.beans.count
  end
end