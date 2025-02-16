class Recipe < ApplicationRecord
  attribute :difficulty, :integer, default: 0
  validates :difficulty, numericality: { only_integer: true, greater_than: 0, less_than: 4 }

  belongs_to :user
  has_many :recipe_beans, dependent: :destroy
  has_many :beans, through: :recipe_beans

  accepts_nested_attributes_for :recipe_beans, allow_destroy: true
  
  scope :easy, -> { where(difficulty: 1).or(Recipe.where(difficulty: 2)) }

  def pretty_print_recipes_by_user
    # includes
    recipes = Recipe.includes(:user)
    recipes.each do |recipe|
      puts "#{recipe.title} by #{recipe.user.first_name}"
    end
    
    # joins
    recipes = Recipe.joins(:user).select("recipes.*, users.first_name as author")
    recipes.each do |recipe|
      puts "#{recipe.title} by #{recipe.author}"
    end
  end

  def with_roaster_and_bean
    recipes = Recipe.joins(user: :recipes)
      .joins("INNER JOIN beans ON recipes.id = beans.roaster_id")
      .joins("INNER JOIN roasters ON beans.roaster_id = roasters.id")
      .select("recipes.*, users.first_name AS user_name, beans.name AS bean_name, roasters.name AS roaster_name")
      recipes.each do |recipe|
        puts "#{recipe.title} by #{recipe.user_name} with #{recipe.bean_name} from #{recipe.roaster_name}"
      end
  end

  # Get all recipes with a specific bean name
  def self.with_specific_bean(bean_name)
    find_by_sql("
      SELECT recipes.*
      FROM recipes
      JOIN recipe_beans ON recipes.id = recipe_beans.recipe_id
      JOIN beans ON recipe_beans.bean_id = beans.id
      WHERE beans.name LIKE \'%#{bean_name}%\'
    ")
  end

  def self.created_today
    Recipe.where("DATE(created_at) = ?", Date.today)
  end

  def to_json(options = {})
    super({
      only: [:id, :title, :description],
      methods: [:difficulty_label],
      include: {
        user: { only: [:id, :name] },
        beans: { only: [:id, :name] }
      }
    }.merge(options))
  end

  def difficulty_label
    case difficulty
    when 1
      "💡 Fácil"
    when 2
      "🌝 Intermedio"
    when 3
      "💪 Avanzado"
    else
      "Desconocido"
    end
  end
end
