#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create statuses
Status.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE statuses RESTART IDENTITY;")
%w{sellable not_sellable clearanced sold}.each do |status|
  Status.create({name: status})
end

# create colors
Color.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE colors RESTART IDENTITY;")
%w{red orange yellow green blue purple black white pattern}.each do |color|
  Color.create({name: color})
end

# create sizes
Size.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE sizes RESTART IDENTITY;")
%w{extra_small small medium large extra_large}.each do |size|
  Size.create({name: size})
end

# create types
Type.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE types RESTART IDENTITY;")
%w{pants shirt dress skirt other}.each do |type|
  Type.create({name: type})
end

# create styles
Style.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE styles RESTART IDENTITY;")
Style.create({wholesale_price: 60.00,   retail_price: 80.00,    type_id: Type.find_by_name("pants").id, name: "ok pants"})
Style.create({wholesale_price: 20.00,   retail_price: 40.00,    type_id: Type.find_by_name("pants").id, name: "cheap pants"})
Style.create({wholesale_price: 300.00,  retail_price: 300.00,   type_id: Type.find_by_name("pants").id, name: "fancy pants"})
Style.create({wholesale_price: 10.00,   retail_price: 30.00,    type_id: Type.find_by_name("shirt").id, name: "cheap shirt"})
Style.create({wholesale_price: 77.00,   retail_price: 90.00,    type_id: Type.find_by_name("shirt").id, name: "nice shirt"})
Style.create({wholesale_price: 62.00,   retail_price: 100.00,   type_id: Type.find_by_name("shirt").id, name: "overpriced shirt"})
Style.create({wholesale_price: 33.00,   retail_price: 70.00,    type_id: Type.find_by_name("dress").id, name: "cheap dress"})
Style.create({wholesale_price: 57.00,   retail_price: 80.00,    type_id: Type.find_by_name("dress").id, name: "ok dress"})
Style.create({wholesale_price: 4650.00, retail_price: 6000.00,  type_id: Type.find_by_name("dress").id, name: "red carpet dress"})
Style.create({wholesale_price: 86.00,   retail_price: 100.00,   type_id: Type.find_by_name("skirt").id, name: "nice skirt"})
Style.create({wholesale_price: 654.00,  retail_price: 800.00,   type_id: Type.find_by_name("skirt").id, name: "fancy skirt"})
Style.create({wholesale_price: 40.00,   retail_price: 80.00,    type_id: Type.find_by_name("other").id, name: "other"})

# create items
Item.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE items RESTART IDENTITY;")
Item.create({style_id: 3,  size_id: Size.find_by_name("small").id,        color_id: Color.find_by_name("blue").id,    status_id: Status.find_by_name("sellable").id,      price_sold: nil,   date_sold: nil})
Item.create({style_id: 2,  size_id: Size.find_by_name("small").id,        color_id: Color.find_by_name("red").id,     status_id: Status.find_by_name("not_sellable").id,  price_sold: nil,   date_sold: nil})
Item.create({style_id: 1,  size_id: Size.find_by_name("small").id,        color_id: Color.find_by_name("green").id,   status_id: Status.find_by_name("sold").id,          price_sold: nil,   date_sold: nil})
Item.create({style_id: 10, size_id: Size.find_by_name("medium").id,       color_id: Color.find_by_name("orange").id,  status_id: Status.find_by_name("sellable").id,      price_sold: nil,   date_sold: nil})
Item.create({style_id: 2,  size_id: Size.find_by_name("medium").id,       color_id: Color.find_by_name("yellow").id,  status_id: Status.find_by_name("not_sellable").id,  price_sold: nil,   date_sold: nil})
Item.create({style_id: 7,  size_id: Size.find_by_name("medium").id,       color_id: Color.find_by_name("purple").id,  status_id: Status.find_by_name("sold").id,          price_sold: nil,   date_sold: nil})
Item.create({style_id: 6,  size_id: Size.find_by_name("large").id,        color_id: Color.find_by_name("black").id,   status_id: Status.find_by_name("clearanced").id,     price_sold: 50.00, date_sold: Time.now})
Item.create({style_id: 5,  size_id: Size.find_by_name("large").id,        color_id: Color.find_by_name("white").id,   status_id: Status.find_by_name("not_sellable").id,  price_sold: nil,   date_sold: nil})
Item.create({style_id: 4,  size_id: Size.find_by_name("large").id,        color_id: Color.find_by_name("blue").id,    status_id: Status.find_by_name("sellable").id,      price_sold: nil,   date_sold: nil})
Item.create({style_id: 5,  size_id: Size.find_by_name("extra_small").id,  color_id: Color.find_by_name("purple").id,  status_id: Status.find_by_name("sold").id,          price_sold: nil,   date_sold: nil})
Item.create({style_id: 3,  size_id: Size.find_by_name("extra_large").id,  color_id: Color.find_by_name("green").id,   status_id: Status.find_by_name("clearanced").id,     price_sold: 5.00,  date_sold: Time.now})