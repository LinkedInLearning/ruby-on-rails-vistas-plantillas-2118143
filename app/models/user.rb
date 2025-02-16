class User < ApplicationRecord
  # has_many :recipes, dependent: :delete_all
  has_many :recipes, dependent: :destroy

  # conditional association, only exists if the recipe is published
  has_many :published_recipes, -> { where(published: true) }, class_name: "Recipe"
  
  # Ruby method that creates getter/setter methods for the attributes
  # these methods do not persist in the database
  attr_accessor :display_name

  def display_name
    "#{first_name} #{last_name}"
  end
end
