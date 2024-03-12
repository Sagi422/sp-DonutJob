# sp-DonutJob
Donut Job For QBCore Framework By Sagi422

# Dependencies
**[jim-payments](https://github.com/jimathy/jim-payments)**
**[qb-menu](https://github.com/qbcore-framework/qb-menu)**
**[qb-target](https://github.com/qbcore-framework/qb-target)**

# Items Images
inside the `/images` folder drag and drop it inside `qb-invetory/html/images`

# jim-payments config

```
	CustomCashRegisters = { -- Located in the config.lua
	["donut"] = { -- Player job role restriction
	  { coords = vector4(355.73, -1018.86, 29.4, 0), prop = true, }, -- vector4 to place the till and the way it faces
	},
  },
```

# Add the job to the server inside `qb-core/shared/jobs.lua`

```
	donut = {
		label = 'Rusty Browns Donut',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Trainee', payment = 50 },
			['1'] = { name = 'Donut Maker', payment = 75 },
			['2'] = { name = 'Donut Chef', payment = 100 },
			['3'] = { name = 'Master Donut Chef', payment = 125 },
			['4'] = { name = 'Donut Manager', isboss = true, payment = 150 },
		},
	},
```

# Add the items to your server go to `qb-core/shared/items.lua` and paste that in:
```
    -- Donut Job

    coffee = {
        name = 'coffee',
        label = 'Coffee',
        weight = 200,
        type = 'item',
        image = 'coffee.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Coffee'
    },

    cappuccino = {
        name = 'cappuccino',
        label = 'Cappuccino',
        weight = 200,
        type = 'item',
        image = 'cappuccino.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Cappuccino'
    },

    hotchocolate = {
        name = 'hotchocolate',
        label = 'Hot Chocolate',
        weight = 200,
        type = 'item',
        image = 'hotchocolate.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Hot Chocolate'
    },

    coffeebeans = {
        name = 'coffeebeans',
        label = 'Coffee Beans',
        weight = 0,
        type = 'item',
        image = 'coffeebeans.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Beans For Coffee'
    },

    hotchocolatepowder = {
        name = 'hotchocolatepowder',
        label = 'Hot Chocolate Powder',
        weight = 0,
        type = 'item',
        image = 'hotchocolatepowder.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Poeder For Hot Chocolate'
    },

    tomatosauce = {
        name = 'tomatosauce',
        label = 'Tomato Sauce',
        weight = 0,
        type = 'item',
        image = 'tomatosauce.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Tomato Sauce'
    },

    cheese = {
        name = 'cheese',
        label = 'Cheese',
        weight = 0,
        type = 'item',
        image = 'cheese.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Cheese'
    },

    pepperoni = {
        name = 'pepperoni',
        label = 'Pepperoni',
        weight = 0,
        type = 'item',
        image = 'pepperoni.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Pepperoni'
    },

    milk = {
        name = 'milk',
        label = 'Milk',
        weight = 0,
        type = 'item',
        image = 'milk.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Milk'
    },

    berryslushy = {
        name = 'berryslushy',
        label = 'Berry Slushy',
        weight = 0,
        type = 'item',
        image = 'slushy.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Berry Slushy'
    },

    appleslushy = {
        name = 'appleslushy',
        label = 'Apple Slushy',
        weight = 0,
        type = 'item',
        image = 'slushy.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Apple Slushy'
    },

    orangejuice = {
        name = 'orangejuice',
        label = 'Orange Juice',
        weight = 0,
        type = 'item',
        image = 'orangejuice.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Orange Juice'
    },

    lemonade = {
        name = 'lemonade',
        label = 'Lemonade',
        weight = 0,
        type = 'item',
        image = 'lemonade.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Lemonade'
    },

    sprite = {
        name = 'sprite',
        label = 'Sprite',
        weight = 0,
        type = 'item',
        image = 'sprite.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Sprite'
    },

    cocacola = {
        name = 'cocacola',
        label = 'Coca Cola',
        weight = 0,
        type = 'item',
        image = 'cocacola.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Coca Cola'
    },

    fanta = {
        name = 'fanta',
        label = 'Fanta',
        weight = 0,
        type = 'item',
        image = 'fanta.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Fanta'
    },

    nestea = {
        name = 'nestea',
        label = 'NesTea',
        weight = 0,
        type = 'item',
        image = 'nestea.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'NesTea'
    },

    drpepper = {
        name = 'drpepper',
        label = 'Dr. Pepper',
        weight = 0,
        type = 'item',
        image = 'drpepper.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Dr. Pepper'
    },

    flour = {
        name = 'flour',
        label = 'Flour',
        weight = 0,
        type = 'item',
        image = 'flour.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Flour'
    },

    egg = {
        name = 'egg',
        label = 'Egg',
        weight = 0,
        type = 'item',
        image = 'egg.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Egg'
    },

    sugar = {
        name = 'sugar',
        label = 'Sugar',
        weight = 0,
        type = 'item',
        image = 'sugar.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Sugar'
    },

    vanilla = {
        name = 'vanilla',
        label = 'Vanilla',
        weight = 0,
        type = 'item',
        image = 'vanilla.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Vanilla'
    },

    brownsugar = {
        name = 'brownsugar',
        label = 'Brown Sugar',
        weight = 0,
        type = 'item',
        image = 'brownsugar.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Brown Sugar'
    },

    chocolatechips = {
        name = 'chocolatechips',
        label = 'Chocolate Chips',
        weight = 0,
        type = 'item',
        image = 'chocolatechips.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Chocolate Chips'
    },

    pizzadough = {
        name = 'pizzadough',
        label = 'Pizza Dough',
        weight = 0,
        type = 'item',
        image = 'pizzadough.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Pizza Dough'
    },

    donutdough = {
        name = 'donutdough',
        label = 'Donut Dough',
        weight = 0,
        type = 'item',
        image = 'donutdough.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Donut Dough'
    },

    cookiedough = {
        name = 'cookiedough',
        label = 'Cookie Dough',
        weight = 0,
        type = 'item',
        image = 'cookiedough.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Cookie Dough'
    },

    donut = {
        name = 'donut',
        label = 'Donut',
        weight = 0,
        type = 'item',
        image = 'donut.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Donut'
    },

    cookie = {
        name = 'cookie',
        label = 'Cookie',
        weight = 0,
        type = 'item',
        image = 'cookie.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Cookie'
    },

    pepperonipizza = {
        name = 'pepperonipizza',
        label = 'Pepperoni Pizza',
        weight = 0,
        type = 'item',
        image = 'pepperonipizza.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Pepperoni Pizza'
    },

    margheritapizza = {
        name = 'margheritapizza',
        label = 'Margherita Pizza',
        weight = 0,
        type = 'item',
        image = 'margheritapizza.png',
        unique = false,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'Margherita Pizza'
    }
}

```

# Add the food to your server go to `qb-smallresources/config.lua`

# Drinks search `Config.Consumables` go down to the drink = {} and paste it in

```
        ['coffee'] = math.random(40, 50),
        ['hotchocolate'] = math.random(40, 50),
        ['cappuccino'] = math.random(40, 50),
        ['berryslushy'] = math.random(40, 50),
        ['appleslushy'] = math.random(40, 50),
        ['orangejuice'] = math.random(40, 50),
        ['lemonade'] = math.random(40, 50),
        ['sprite'] = math.random(40, 50),
        ['cocacola'] = math.random(40, 50),
        ['fanta'] = math.random(40, 50),
        ['drpepper'] = math.random(40, 50),
        ['nestea'] = math.random(40, 50),
```

# Drinks search `Config.Consumables` go down to the eat = {} and paste it in

```
        ['donut'] = math.random(40, 50),
        ['cookie'] = math.random(40, 50),
        ['peperonipizza'] = math.random(40, 50),
        ['margheritapizza'] = math.random(40, 50)
```
