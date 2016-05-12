task seed_rewrds: :environment do
  fixed_points = [200, 300, 150, 500, 100, 1000]
  reward_brands = [
    {
      name: "Flipkart",
      background_color: "#fdd922",
      font_color: "#157ed2"
    },
    {
      name: "redBus",
      background_color: "#d84e55",
      font_color: "#ffffff"
    },
    {
      name: "Nestaway",
      background_color: "#E0EFEB",
      font_color: "#4b5359"
    },
    {
      name: "SHOPCLUES",
      background_color: "#d7d7d7",
      font_color: "#2F2E2E"
    },
    {
      name: "Snapdeal",
      background_color: "#0087E6",
      font_color: "#FB0128"
    },
    {
      name: "MakeMy Trip",
      background_color: "#F3EB04",
      font_color: "#F11133"
    },
    {
      name: "Freecharge",
      background_color: "#E3714C",
      font_color: "#ffffff"
    },
    {
      name: "JABONG",
      background_color: "#F78C24",
      font_color: "#1E1E1E"
    },
    {
      name: "foodpanda",
      background_color: "#EA5B32",
      font_color: "#ffffff"
    }
  ]
  1000.times.each do |i|
    brand = reward_brands.sample
    brand[:points] = fixed_points.sample
    puts brand[:name]
    Reward.create brand
  end
end
