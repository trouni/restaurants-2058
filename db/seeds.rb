puts "Cleaning the DB..."
Restaurant.destroy_all
User.destroy_all
puts "... DB cleaned"

User.create!(email: "trouni@me.com", password: "123123", username: "trouni")
User.create!(email: "doug@me.com", password: "123123", username: "dmbf29")
puts "... created #{User.count} users"

CHEFS = %w[Alonzo Andrew Brady Douglas Gaëtan Harry Hyelim Joel Kaleb Kenji Louis Mandil Michael Monika Naing Paul Pedro Rafa Richard Séamus Stefan Vince Youssef Yuichi]
CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end

puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: "日本, 〒153-0063 東京都目黒区 目黒#{rand(1..3)}丁目#{rand(1..10)}番#{rand(1..3)}号",
    category: get_category(restaurant_name),
    chef_name: name,
    user: User.all.sample
  )
end
puts "... created #{Restaurant.count} restaurants"
