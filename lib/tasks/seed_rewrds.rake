task seed_rewrds: :environment do
  fixed_points = [200, 300, 150, 500, 100, 1000]
  reward_brands = [
    {
      name: "Flipkart",
      background_color: "#fdd922",
      font_color: "#157ed2",
      description: "Shop the Online Megastore with the free Flipkart Android app. Choose from the massive selection of original products in Fashion, Electronics, Books, Mobiles and other categories. Get timely alerts on great deals with substantial discounts, every day!"
    },
    {
      name: "redBus",
      background_color: "#d84e55",
      font_color: "#ffffff",
      description: "Quickest and safest way to book bus tickets & hotel rooms is through redBus! Use redBus android app to book bus & Volvo tickets in the easiest & fastest way. The app allows you to search and book bus tickets for over 70,000 routes worldwide and also choose from over 2,300 operators. Choose from seater, sleeper, semi-sleeper, A/C, non A/C buses. You can now transact on the redBus app using Netbanking, credit cards, debit cards & phone booking options."
    },
    {
      name: "Nestaway",
      background_color: "#E0EFEB",
      font_color: "#4b5359",
      description: "Looking for a family home or a flat for bachelors? NestAway has housing for everyone. Furnished houses, no brokerage, no maintenance hassles, a better alternative to PG."
    },
    {
      name: "SHOPCLUES",
      background_color: "#d7d7d7",
      font_color: "#2F2E2E",
      description: "Experience the new era of online shopping with Free ShopClues Android App. ShopClues Android App allows you to shop online at wholesale rate, anytime and anywhere with just a tap of your finger. You can search for desired products from more than 9 million products across 3000 categories, sold by 35,000+ merchants. The App allows the user to view order details, track orders, save multiple addresses in address book, and check product ratings and reviews by other buyers. Now you can shop for your favorite products & pay at your convenience with our secure payment options - Cash on Delivery, Credit/Debit Card, EMI and Net Banking."
    },
    {
      name: "Snapdeal",
      background_color: "#0087E6",
      font_color: "#FB0128",
      description: "SThe Snapdeal Android App is your gateway to a fast, easy and secure mobile shopping experience on-the-go. Snapdeal has the widest assortment of over 23 million products in categories like mobile phones, electronics, fashion, footwear, watches, jewellery and more making it India's largest online marketplace! Shop anywhere anytime with this free App."
    },
    {
      name: "MakeMy Trip",
      background_color: "#F3EB04",
      font_color: "#F11133",
      description: "Join for over 5 million happy travellers on MakeMyTrip app to enjoy exclusive app discounts on hotel bookings, IRCTC authorised railway ticket booking and an overall seamless booking experience."
    },
    {
      name: "Freecharge",
      background_color: "#E3714C",
      font_color: "#ffffff",
      description: "Welcome to FreeCharge Wallet - the fastest mobile app for online recharge & bill payments. Not just easy, safe and secure, it is quick. Pay for your prepaid mobile recharges, postpaid mobile bill, electricity bill payment, dth recharge, landline bills, datacard, and utility bill payments in under 10 seconds"
    },
    {
      name: "JABONG",
      background_color: "#F78C24",
      font_color: "#1E1E1E",
      description: "Fashion is a beautiful feeling capable of taking people places. This is why we bring you the Jabong shopping app, which you can take with you wherever you go and get fabulous fashion on-the-go. Download the free Jabong app from the Google Play apps store and shop for dresses, shoes, t-shirts, watches, bags, sunglasses, jewellery, etc. and avail discounts on brands such as Nike, Adidas, Biba, W, Catwalk, Titan, Ray Ban, and more. Chosen as India’s most loved online shopping website for the latest fashion, lifestyle and beauty products, now you can experience the same level of satisfaction on your android phone with the Jabong fashion app. Jabong offers fast shipping, cash on delivery and 15-days easy returns coupled with exclusive app deals, coupons and offers."
    },
    {
      name: "foodpanda",
      background_color: "#EA5B32",
      font_color: "#ffffff",
      description: "Thank you for using the foodpanda app! We regularly bring updates to the App Store to make sure you have access to the best menus in your neighborhood."
    }
  ]
  1000.times.each do |i|
    brand = reward_brands.sample
    brand[:points] = fixed_points.sample
    puts brand[:name]
    Reward.create brand
  end
end
