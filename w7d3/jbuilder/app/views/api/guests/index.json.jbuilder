# json.array! @guests, :name, :age, :favorite_color

json.array! @guests, partial: 'api/guests/guest', as: :guest

# json.array! @guests do |guest|
#   next if guest.age < 40 || guest.age > 50
#   json.partial! 'api/guests/guest', guest: guest
# end
