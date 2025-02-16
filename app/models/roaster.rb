class Roaster < ApplicationRecord
  # The Rails Way
  scope :not_from_colombia, -> { where.not(location: "Colombia") }
  # The not so Rails Way but it will still work
  def not_from_colombia
    # Returns the roasters from everywhere except Colombia
    Roaster.where.not(country: "Colombia")
  end
end
