module RecipesHelper
  def format_difficulty(difficulty)
    case difficulty
    when 1
      content_tag(:span, "💡 Fácil", class: "difficulty easy")
    when 2
      content_tag(:span, "🌝 Intermedio", class: "difficulty medium")
    when 3
      content_tag(:span, "💪 Avanzado", class: "difficulty hard")
    else
      "Desconocido"
    end
  end
end
