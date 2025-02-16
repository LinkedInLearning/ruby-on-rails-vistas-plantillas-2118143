class Bean < ApplicationRecord
  belongs_to :roaster
  has_many :recipe_beans, dependent: :destroy
  has_many :recipes, through: :recipe_beans

  # Creates a new bean from a similar bean
  # by cloning its attributes and creating 
  # a new instance
  def create_from_similar_bean(bean, roaster)
    b2 = b1.deep_dup
    b2.roaster_id = roaster.id
    b2.save!
  end

  def fresh?
    # Returns true if the bean was roasted in the last 20 days
    # using between? method
    roasted_at.between?(20.days.ago, Time.now)
    # using cover? method
    # (20.days.ago..Time.now).cover?(roasted_at)
  end
end
