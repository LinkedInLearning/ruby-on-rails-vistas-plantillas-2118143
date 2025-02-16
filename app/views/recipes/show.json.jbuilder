json.id @recipe.id
json.title @recipe.title
json.description @recipe.description
json.difficulty @recipe.difficulty
json.difficulty_label @recipe.difficulty_label

json.user do
  json.id @recipe.user.id
  json.name @recipe.user.email
end

json.beans @recipe.beans do |bean|
  json.id bean.id
  json.name bean.name
end
