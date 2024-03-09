# sp-DonutJob
Donut Job For QBCore Framework By Sagi422

# Dependencies
**[jim-payments](https://github.com/jimathy/jim-payments)**
**[qb-menu](https://github.com/qbcore-framework/qb-menu)**
**[qb-target](https://github.com/qbcore-framework/qb-target)**

# Items Images
![cookiedough](https://github.com/Sagi422/sp-DonutJob/assets/103905109/07523541-caa1-49a7-b1ef-2eac80d33510)
![flour](https://github.com/Sagi422/sp-DonutJob/assets/103905109/f7cf947b-606e-46e7-8342-4fee8517ee1d)
![sugar](https://github.com/Sagi422/sp-DonutJob/assets/103905109/d99f9643-3916-48d1-82bb-d3aaf47ebf74)
![coffeebeans](https://github.com/Sagi422/sp-DonutJob/assets/103905109/35c9f314-8ab5-470c-942a-c674191ad303)
![egg](https://github.com/Sagi422/sp-DonutJob/assets/103905109/a0f71795-673b-49e9-bbe3-8b917495d3fe)
![brownsugar](https://github.com/Sagi422/sp-DonutJob/assets/103905109/9b1efd10-d1dc-40fe-a304-23ef10b4f99d)
![pizzadough](https://github.com/Sagi422/sp-DonutJob/assets/103905109/d1a15ec8-0f0b-4fdc-9f22-a4a663fda89e)
![donutdough](https://github.com/Sagi422/sp-DonutJob/assets/103905109/e828e7e0-1327-4c53-9120-a3c35b90b34a)
![chocolatechips](https://github.com/Sagi422/sp-DonutJob/assets/103905109/08de2b0a-e030-490f-863f-96d147b935e6)
![hotchocolatepowder](https://github.com/Sagi422/sp-DonutJob/assets/103905109/020f5818-485a-4089-a6b0-f26718c4f07c)
![hotchocolate](https://github.com/Sagi422/sp-DonutJob/assets/103905109/4f34372c-d350-457f-94e6-c67363bb68d3)
![cappuccino](https://github.com/Sagi422/sp-DonutJob/assets/103905109/7d52d9b5-7331-4d56-88f3-7da86f619134)
![orangejuice](https://github.com/Sagi422/sp-DonutJob/assets/103905109/603338d4-7704-4a4a-9eb5-4951885dcce3)
![fanta](https://github.com/Sagi422/sp-DonutJob/assets/103905109/c116c28b-593f-4511-a5f8-9870a8b2dbb4)
![nestea](https://github.com/Sagi422/sp-DonutJob/assets/103905109/6d7f9eef-4a7f-451e-b877-6b3732e29263)
![tomatosauce](https://github.com/Sagi422/sp-DonutJob/assets/103905109/9ed3e9f3-14e2-4b1d-a2f7-1e1709b8d3fd)
![slushy](https://github.com/Sagi422/sp-DonutJob/assets/103905109/b1016c1c-b42f-4e2e-b551-a1872289b269)
![pepperoni](https://github.com/Sagi422/sp-DonutJob/assets/103905109/45f23dce-b6f4-4296-b640-5a0e906038d8)
![pepperonipizza](https://github.com/Sagi422/sp-DonutJob/assets/103905109/bc3d73be-06bc-43a9-a7e2-5ba90c591a08)
![margheritapizza](https://github.com/Sagi422/sp-DonutJob/assets/103905109/435853a7-9716-4301-b3e5-6aaafd2e6fd6)
![vanilla](https://github.com/Sagi422/sp-DonutJob/assets/103905109/aee5899e-e172-41b3-8b4a-e43445897f12)
![sprite](https://github.com/Sagi422/sp-DonutJob/assets/103905109/584cd26a-d595-4e5b-a64a-81d9c3033b0b)
![cocacola](https://github.com/Sagi422/sp-DonutJob/assets/103905109/a8605d34-3018-481f-af11-2087632d20bd)
![coffee](https://github.com/Sagi422/sp-DonutJob/assets/103905109/8a5ca87e-96ef-4dd9-8ffe-fdd9209cf987)


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
