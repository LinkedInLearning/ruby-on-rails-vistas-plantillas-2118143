class RecipeBean < ApplicationRecord
  belongs_to :recipe
  belongs_to :bean
end