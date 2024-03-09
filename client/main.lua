print("^9Sp^9-^9DountJob ^7v^41^7.^40^7.^40 ^7- ^6Donut Job Script by ^3Sagi422^7")
local QBCore = exports["qb-core"]:GetCoreObject()
onDuty = true
local inLoggedIn = true
local PlayerJob = {}
local isPcOn = false
local isHandsClean = true
local handsDirtyTime = 0
local milsec = 60000

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
        end)
    end)
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    isLoggedIn = false
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent("QBCore:Client:SetDuty", function(duty)
    onDuty = duty
end)

RegisterNetEvent("sp-donutjob:client:ToggleDuty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("sp-donutjob:client:washHands")
AddEventHandler("sp-donutjob:client:washHands", function()
    if onDuty then
        if not isHandsClean or (isHandsClean and (GetGameTimer() - handsDirtyTime) > 10 * milsec) then
            QBCore.Functions.Progressbar("washHands", "Washing Hands", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49
            }, {}, {}, function(cancelled)
                if not cancelled then
                    isHandsClean = true
                    boilingTimer = GetGameTimer()
                    handsDirtyTime = GetGameTimer() -- Reset The Timer Every 10 min
                    QBCore.Functions.Notify("You've Washed Your Hands.", "success")
                else
                    -- Handle cancellation here
                    isHandsClean = false
                end
            end)
        else
            QBCore.Functions.Notify("Your Hands Are Already Clean.", "error")
        end
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:TurnPcOn")
AddEventHandler("sp-donutjob:client:TurnPcOn", function()
    if onDuty then
        if not isPcOn then
            QBCore.Functions.Progressbar("PcOn", "Turning On The Pc", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "anim@heists@prison_heiststation@cop_reactions",
                anim = "cop_b_idle",
                flags = 49
            }, {}, {}, function(cancelled)
                if not cancelled then
                    isPcOn = true
                    QBCore.Functions.Notify("Pc Turned On.", "success")
                else
                    -- Handle cancellation here
                    isPcOn = false
                end
            end)
        else
            QBCore.Functions.Notify("The pc is already on", "error")
        end
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

function checkIfHasItem(itemName, quantity)
    local playerData = QBCore.Functions.GetPlayerData()
    local itemAmount = 0

    for _, item in ipairs(playerData.items) do
        if item.name == itemName then
            itemAmount = itemAmount + item.amount
            if itemAmount >= quantity then
                return true
            end
        end
    end

    return false
end

function MakeItem(itemName, displayName, successMessage, progressBarName, progressBarLabel, progressBarTime,
    eventToTrigger, amount, animDict, anim)
    QBCore.Functions.Progressbar(progressBarName, progressBarLabel, progressBarTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = animDict,
        anim = anim,
        flags = 49
    }, {}, {}, function(cancelled)
        if not cancelled then
            QBCore.Functions.Notify(successMessage, "success")
            TriggerServerEvent(eventToTrigger, itemName, amount)
        else
            -- Handle cancellation here
        end
    end)
end

RegisterNetEvent("sp-donutjob:client:funDrinksMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Fun Drinks Menu",
            icon = "fas fa-glass-water",
            isMenuHeader = true
        }, {
            header = "Sprite",
            txt = "ingredients | None | 5s",
            icon = "sprite",
            params = {
                event = "sp-donutjob:client:MakeSprite"
            }
        }, {
            header = "Coca Cola",
            txt = "ingredients | None | 5s",
            icon = "cocacola",
            params = {
                event = "sp-donutjob:client:MakeCocalCola"
            }
        }, {
            header = "Fanta",
            txt = "ingredients | None | 5s",
            icon = "fanta",
            params = {
                event = "sp-donutjob:client:MakeFanta"
            }
        }, {
            header = "NesTea",
            txt = "ingredients | None | 5s",
            icon = "nestea",
            params = {
                event = "sp-donutjob:client:MakeNesTea"
            }
        }, {
            header = "Dr. Pepper",
            txt = "ingredients | None | 5s",
            icon = "drpepper",
            params = {
                event = "sp-donutjob:client:MakeDrPepper"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeSprite")
AddEventHandler("sp-donutjob:client:MakeSprite", function()
    if isHandsClean then
        MakeItem("sprite", "Pouring Sprite", "You've poured sprite.", "makeSprite", "Pouring Sprite", 5000,
            "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeCocalCola")
AddEventHandler("sp-donutjob:client:MakeCocalCola", function()
    if isHandsClean then
        MakeItem("cocacola", "Pouring Coca Cola", "You've poured coca cola.", "makeCocaCola", "Pouring Coca Cola", 5000,
            "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeFanta")
AddEventHandler("sp-donutjob:client:MakeFanta", function()
    if isHandsClean then
        MakeItem("fanta", "Pouring Fanta", "You've poured fanta.", "makeFanta", "Pouring Fanta", 5000,
            "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeNesTea")
AddEventHandler("sp-donutjob:client:MakeNesTea", function()
    if isHandsClean then
        MakeItem("nestea", "Pouring NesTea", "You've poured nestea.", "makeNesTea", "Pouring NesTea", 5000,
            "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeDrPepper")
AddEventHandler("sp-donutjob:client:MakeDrPepper", function()
    if isHandsClean then
        MakeItem("drpepper", "Pouring Dr. Pepper", "You've poured dr. pepper.", "makeDrPepper", "Pouring Dr. Pepper", 5000,
            "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)


RegisterNetEvent("sp-donutjob:client:coffeMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Coffee Menu",
            icon = "fas fa-coffee",
            isMenuHeader = true
        }, {
            header = "Coffee",
            txt = "ingredients | 1 Milk, 1 Coffe Beans | 5s",
            icon = "coffee",
            params = {
                event = "sp-donutjob:client:MakeCoffee"
            }
        }, {
            header = "Cappuccino",
            txt = "ingredients | 1 Milk, 1 Coffe Beans | 5s",
            icon = "cappuccino",
            params = {
                event = "sp-donutjob:client:MakeCappuccino"
            }
        }, {
            header = "Hot Chocolate",
            txt = "ingredients | 1 Milk, 1 Hot Chocolate Powder | 5s",
            icon = "hotchocolate",
            params = {
                event = "sp-donutjob:client:MakeHotChocolate"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeCoffee")
AddEventHandler("sp-donutjob:client:MakeCoffee", function()
    if isHandsClean then
        if checkIfHasItem("milk", 1) and checkIfHasItem("coffeebeans", 1) then
            MakeItem("coffee", "Making Coffee", "You've made a coffee.", "makecoffee", "Making Coffee", 5000,
                "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "milk", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "coffeebeans", 1)
        else
            QBCore.Functions.Notify("You need both milk and coffee beans to make coffee.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeCappuccino")
AddEventHandler("sp-donutjob:client:MakeCappuccino", function()
    if isWaterHot and isHandsClean then
        if checkIfHasItem("milk", 1) and checkIfHasItem("coffeebeans", 1) then
            MakeItem("cappuccino", "Making Cappuccino", "You've made a cappuccino.", "makecappuccino",
                "Making Cappuccino", 5000, "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "milk", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "coffeebeans", 1)
        else
            QBCore.Functions.Notify("You need both milk and coffee beans to make cappuccino.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeHotChocolate")
AddEventHandler("sp-donutjob:client:MakeHotChocolate", function()
    if isWaterHot and isHandsClean then
        if checkIfHasItem("milk", 1) and checkIfHasItem("hotchocolatepowder", 1) then
            MakeItem("hotchocolate", "Making Hot Chocolate", "You've made a Hot Chocolate.", "makechocolate",
                "Making Hot Chocolate", 5000, "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "milk", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "hotchocolatepowder", 1)
        else
            QBCore.Functions.Notify("You need both milk and hot chocolate powder to make cappuccino.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:slushyMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Slushy Menu",
            isMenuHeader = true
        }, {
            header = "Berry Slushy",
            txt = "ingredients | None | 5s",
            icon = "berryslushy",
            params = {
                event = "sp-donutjob:client:MakeBerrySlushy"
            }
        }, {
            header = "Apple Slsuhy",
            txt = "ingredients | None | 5s",
            icon = "berryslushy",
            params = {
                event = "sp-donutjob:client:MakeAppleSlushy"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeBerrySlushy")
AddEventHandler("sp-donutjob:client:MakeBerrySlushy", function()
    if isHandsClean then
        MakeItem("berryslushy", "Pouring Berry Slushy", "You've poured a slushy.", "makeBerrySlushy",
            "Pouring Berry Slushy", 5000, "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeAppleSlushy")
AddEventHandler("sp-donutjob:client:MakeAppleSlushy", function()
    MakeItem("appleslushy", "Pouring Apple Slushy", "You've poured a slushy.", "makeAppleSlushy",
        "Pouring Apple Slushy", 5000, "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
end)

RegisterNetEvent("sp-donutjob:client:drinksMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Drinks Menu",
            isMenuHeader = true
        }, {
            header = "Lemonade",
            txt = "ingredients | None | 5s",
            icon = "lemonade",
            params = {
                event = "sp-donutjob:client:MakeLemonade"
            }
        }, {
            header = "Orange Juice",
            txt = "ingredients | None | 5s",
            icon = "orangejuice",
            params = {
                event = "sp-donutjob:client:MakeOrangeJuice"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeLemonade")
AddEventHandler("sp-donutjob:client:MakeLemonade", function()
    if isHandsClean then
        MakeItem("lemonade", "Pouring Lemonade", "You've poured lemonade.", "makeLemonade", "Pouring Lemonade", 5000,
            "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeOrangeJuice")
AddEventHandler("sp-donutjob:client:MakeOrangeJuice", function()
    if isHandsClean then
        MakeItem("orangejuice", "Pouring Orange Juice", "You've poured orange juice.", "makeOrangeJuice",
            "Pouring Orange Juice", 5000, "sp-donutjob:server:giveitem", 1, "mp_ped_interaction", "handshake_guy_a")
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:doughMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Dough Menu",
            isMenuHeader = true
        },
        {
            header = "Pizza Dough",
            txt = "ingredients | 1 Flour, 2 Egg, 1 Sugar| 5s",
            icon = "pizzadough",
            params = {
                event = "sp-donutjob:client:MakePizzaDough"
            }
        }, 
        {
            header = "Dount Dough",
            txt = "ingredients | 1 Flour, 2 Egg, 1 Sugar, 1 Milk, 1 Vanilla | 5s",
            icon = "donutdough",
            params = {
                event = "sp-donutjob:client:MakeDonutDough"
            }
        },
        {
            header = "Cookie Dough",
            txt = "ingredients | 1 Flour, 1 Brown Sugar, 1 Vanilla, 1 Milk, 1 Chocolate Chips  | 5s",
            icon = "cookiedough",
            params = {
                event = "sp-donutjob:client:MakeCookieDough"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeDonutDough")
AddEventHandler("sp-donutjob:client:MakeDonutDough", function()
    if isHandsClean then
        if checkIfHasItem("flour", 1) and checkIfHasItem("egg", 2) and checkIfHasItem("sugar", 1) and
            checkIfHasItem("milk", 1) and checkIfHasItem("vanilla", 1) then
            MakeItem("donutdough", "Making Donut Dough", "You've made donut dough.", "makedonutdough",
                "Making Donut Dough", 5000, "sp-donutjob:server:giveitem", 1,
                "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "flour", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "egg", 2)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "sugar", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "milk", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "vanilla", 1)
        else
            QBCore.Functions.Notify("You are missing certain ingredients!.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakePizzaDough")
AddEventHandler("sp-donutjob:client:MakePizzaDough", function()
    if isHandsClean then
        if checkIfHasItem("flour", 1) and checkIfHasItem("egg", 2) and checkIfHasItem("sugar", 1) then
            MakeItem("pizzadough", "Making Pizza Dough", "You've made pizza dough.", "makepizzadough",
                "Making Pizza Dough", 5000, "sp-donutjob:server:giveitem", 1,
                "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "flour", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "egg", 2)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "sugar", 1)
        else
            QBCore.Functions.Notify("You are missing certain ingredients!.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)


RegisterNetEvent("sp-donutjob:client:pizzaOvenMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Pizza Oven Menu",
            isMenuHeader = true,
            
        },
        {
            header = "Pepperoni Pizza",
            txt = "ingredients | 1 Pizza Dough, 1 Tomato Sauce, 1 Cheese, 1 Pepperoni| 5s",
            icon = "pepperonipizza",
            params = {
                event = "sp-donutjob:client:MakePepperoniPizza"
            }
        },
        {
            header = "Margherita Pizza",
            txt = "ingredients | 1 Pizza Dough, 1 Tomato Sauce, 1 Cheese| 5s",
            icon = "margheritapizza",
            params = {
                event = "sp-donutjob:client:MakeMargheritaPizza"
            }
        },
    })
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakePepperoniPizza")
AddEventHandler("sp-donutjob:client:MakePepperoniPizza", function()
    if isHandsClean then
        if checkIfHasItem("pizzadough", 1) and checkIfHasItem("tomatosauce", 1) and checkIfHasItem("cheese", 1) and checkIfHasItem("pepperoni", 1) then
            MakeItem("pepperonipizza", "Making Pepperoni Pizza", "You've made pepperoni pizza.", "makepepperonipizza",
                "Making Pepperoni Pizza", 5000, "sp-donutjob:server:giveitem", 1,
                "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "pizzadough", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "tomatosauce", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "cheese", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "pepperoni", 1)
        else
            QBCore.Functions.Notify("You are missing certain ingredients!.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeMargheritaPizza")
AddEventHandler("sp-donutjob:client:MakeMargheritaPizza", function()
    if isHandsClean then
        if checkIfHasItem("pizzadough", 1) and checkIfHasItem("cheese", 1) and checkIfHasItem("tomatosauce", 1) then
            MakeItem("margheritapizza", "Making Margherita Pizza", "You've made margherita pizza.", "makemargheritapizza",
                "Making Margherita Pizza", 5000, "sp-donutjob:server:giveitem", 1,
                "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "pizzadough", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "tomatosauce", 1)
            TriggerServerEvent("sp-donutjob:server:deleteitem", "cheese", 1)
        else
            QBCore.Functions.Notify("You are missing certain ingredients!", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)


RegisterNetEvent("sp-donutjob:client:fryMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Frying Menu",
            isMenuHeader = true
        }, {
            header = "Dount",
            txt = "ingredients | 1 Dount Dough| 5s",
            icon = "donut",
            params = {
                event = "sp-donutjob:client:MakeDonut"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeDonut")
AddEventHandler("sp-donutjob:client:MakeDonut", function()
    if isHandsClean then
        if checkIfHasItem("donutdough", 1) then
            MakeItem("donut", "Making Donut", "You've made a donut.", "makedonut", "Making Donut", 5000,
                "sp-donutjob:server:giveitem", 5, "mp_ped_interaction", "handshake_guy_a")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "donutdough", 1)
        else
            QBCore.Functions.Notify("You are missing certain ingredients!.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:ovenMenu", function()
    if onDuty then
        exports["qb-menu"]:openMenu({{
            header = "Oven Menu",
            isMenuHeader = true
        }, {
            header = "Cookie",
            txt = "ingredients | 1 Cookie Dough| 5s",
            icon = "cookie",
            params = {
                event = "sp-donutjob:client:MakeCookie"
            }
        }})
    else
        QBCore.Functions.Notify("You are not on duty.", "error")
    end
end)

RegisterNetEvent("sp-donutjob:client:MakeCookie")
AddEventHandler("sp-donutjob:client:MakeCookie", function()
    if isHandsClean then
        if checkIfHasItem("cookiedough", 1) then
            MakeItem("cookie", "Making Cookie", "You've made a cookie.", "makecookie", "Making Cookie", 5000,
                "sp-donutjob:server:giveitem", 10, "mp_ped_interaction", "handshake_guy_a")
            TriggerServerEvent("sp-donutjob:server:deleteitem", "cookiedough", 1)
        else
            QBCore.Functions.Notify("You are missing certain ingredients!.", "error")
        end
    else
        QBCore.Functions.Notify("You need to wash your hands first.", "error")
    end
end)

--- Storage

RegisterNetEvent("sp-donutjob:client:fridge", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Fridge #1")
    TriggerEvent("inventory:client:SetCurrentStash", "Fridge #1")
end)

RegisterNetEvent("sp-donutjob:client:fridge2", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Fridge #2")
    TriggerEvent("inventory:client:SetCurrentStash", "Fridge #2")
end)

RegisterNetEvent("sp-donutjob:client:fridge3", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Fridge #3")
    TriggerEvent("inventory:client:SetCurrentStash", "Fridge #3")
end)

RegisterNetEvent("sp-donutjob:client:fridge4", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Fridge #3")
    TriggerEvent("inventory:client:SetCurrentStash", "Fridge #3")
end)

RegisterNetEvent("sp-donutjob:client:donutStash", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Donut Storage")
    TriggerEvent("inventory:client:SetCurrentStash", "Donut Storage")
end)

RegisterNetEvent("sp-donutjob:client:donutBin", function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Bin")
    TriggerEvent("inventory:client:SetCurrentTrash", "Bin")
end)


--- qb-management
RegisterNetEvent('sp-donutjob:client:bossMenu')
AddEventHandler('sp-donutjob:client:bossMenu',function()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    if not PlayerJob.name or not PlayerJob.isboss then QBCore.Functions.Notify("You are not allowed to use the boss menu.", "error") end
    TriggerEvent("qb-bossmenu:client:OpenMenu")
end)

--- qb-target

exports["qb-target"]:AddBoxZone("toggleDuty", vector3(360.08, -1006.31, 29.34), 3.2, 1, {
    name = "toggleDuty",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:ToggleDuty",
        icon = "fas fa-clipboard",
        label = "Toggle Duty",
        job = "donut"
    }},

    distance = 1.5
})

exports["qb-target"]:AddBoxZone("washHands", vector3(359.65, -1010.0, 29.34), 0.8, 1, {
    name = "washHands",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:washHands",
        icon = "fas fa-soap",
        label = "Wash Hands",
        job = "donut"
    }},

    distance = 1.5
})

exports["qb-target"]:AddBoxZone("coffeeMenu", vector3(357.87, -1018.78, 29.34), 0.7, 0.5, {
    name = "coffeeMenu",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:coffeMenu",
        icon = "fas fa-list",
        label = "Coffee Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("funDrinksMenu", vector3(358.57, -1018.87, 29.34), 0.7, 0.5, {
    name = "funDrinksMenu",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:funDrinksMenu",
        icon = "fas fa-list",
        label = "Fun Drinks Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("slushyMenu", vector3(359.51, -1013.18, 29.34), 0.6, 0.6, {
    name = "slushyMenu",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:slushyMenu",
        icon = "fas fa-list",
        label = "Slushy Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("drinksMenu", vector3(359.46, -1013.74, 29.34), 0.5, 0.5, {
    name = "drinksMenu",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:drinksMenu",
        icon = "fas fa-list",
        label = "Drinks Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("donut", vector3(353.1, -1018.65, 29.34), 2.4, 1, {
    name = "donut",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:donutStash",
        icon = "fas fa-layer-group",
        label = "Donut Storage",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("fridge", vector3(355.19, -1010.4, 29.34), 0.8, 1, {
    name = "fridge",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:fridge",
        icon = "fas fa-snowflake",
        label = "Open Up The Fridge",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("fridge2", vector3(352.8, -1010, 29.34), 0.8, 1, {
    name = "fridge2",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:fridge2",
        icon = "fas fa-snowflake",
        label = "Open Up The Fridge",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("fridge3", vector3(352.8, -1008.75, 29.34), 0.8, 1, {
    name = "fridge3",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:fridge3",
        icon = "fas fa-snowflake",
        label = "Open Up The Fridge",
        job = "donut"
    }},
    distance = 1
})

exports["qb-target"]:AddBoxZone("fridge4", vector3(352.8, -1008, 29.34), 0.8, 1, {
    name = "fridge4",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:fridge4",
        icon = "fas fa-snowflake",
        label = "Open Up The Fridge",
        job = "donut"
    }},
    distance = 1
})

exports["qb-target"]:AddBoxZone("bin", vector3(352.59, -1026.88, 29.34), 0.9, 0.5, {
    name = "bin",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:donutBin",
        icon = "fas fa-trash",
        label = "Bin"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("dough", vector3(356.87, -1012.97, 29.34), 0.6, 1, {
    name = "dough",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:doughMenu",
        icon = "fas fa-cookie",
        label = "Dough Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("fry", vector3(352.15, -1011.38, 29.34), 1.8, 1, {
    name = "fry",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:fryMenu",
        icon = "fas fa-fire-flame-curved",
        label = "Frying Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("pizzaoven", vector3(352.98, -1014.52, 29.34), 2.2, 1, {
    name = "pizzaoven",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:pizzaOvenMenu",
        icon = "fas fa-fire-flame-curved",
        label = "Pizza Oven Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("oven", vector3(356.33, -1009.95, 29.34), 1.4, 1, {
    name = "oven",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:ovenMenu",
        icon = "fas fa-fire-flame-curved",
        label = "Oven Menu",
        job = "donut"
    }},

    distance = 1
})

exports["qb-target"]:AddBoxZone("orderItems", vector3(358.82, -1008.59, 29.34), 1.2, 1, {
    name = "orderItems",
    debugPoly = false,
    useZ = true
}, {
    options = {{
        event = "sp-donutjob:client:openShop",
        icon = "fas fa-cart-shopping",
        label = "Order Items",
        job = "donut"
    },
    {
        event = "sp-donutjob:client:bossMenu",
        icon = "fas fa-user",
        label = "Boss Menu",
        job = "donut"
    },
    {
        event = "sp-donutjob:client:TurnPcOn",
        icon = "fas fa-desktop",
        label = "Turn On The Pc",
        job = "donut"
    }},

    distance = 1
})

--- Shop System

local ShopItems = {{
    name = "coffeebeans",
    price = 0,
    placeholder = "Coffe Beans",
    icon = "coffeebeans",
    amount = 1
}, {
    name = "milk",
    price = 0,
    placeholder = "Milk",
    icon = "milk",
    amount = 1
}, {
    name = "flour",
    price = 0,
    placeholder = "Flour",
    icon = "flour",
    amount = 1
}, {
    name = "egg",
    price = 0,
    placeholder = "Eggs",
    icon = "egg",
    amount = 2
}, {
    name = "sugar",
    price = 0,
    placeholder = "Sugar",
    icon = "sugar",
    amount = 1
}, {
    name = "vanilla",
    price = 0,
    placeholder = "Vanilla",
    icon = "vanilla",
    amount = 1
}, {
    name = "brownsugar",
    price = 0,
    placeholder = "Brown Sugar",
    icon = "brownsugar",
    amount = 1
}, {
    name = "chocolatechips",
    price = 0,
    placeholder = "Chocolate Chips",
    icon = "chocolatechips",
    amount = 1
}, {
    name = "hotchocolatepowder",
    price = 0,
    placeholder = "Hot Chocolate Powder",
    icon = "hotchocolatepowder",
    amount = 1
}, {
    name = "tomatosauce",
    price = 0,
    placeholder = "Tomato Sauce",
    icon = "tomatosauce",
    amount = 1
}, {
    name = "cheee",
    price = 0,
    placeholder = "Cheese",
    icon = "cheese",
    amount = 1
}, {
    name = "pepperoni",
    price = 0,
    placeholder = "Pepperoni",
    icon = "pepperoni",
    amount = 1
},
 --- Add As Many Items You Need
}

-- Create Shop Menu
RegisterNetEvent("sp-donutjob:client:openShop")
AddEventHandler("sp-donutjob:client:openShop", function()
    if isPcOn then
        local player = source
        local shopMenu = {}

        for _, item in ipairs(ShopItems) do
            table.insert(shopMenu, {
                header = item.placeholder,
                txt = "Price: " .. (item.price > 0 and item.price or "Free") .. ", Amount: " .. item.amount,
                icon = item.icon,
                params = {
                    event = "sp-donutjob:client:purchaseItem",
                    args = {
                        item = item.name,
                        price = item.price,
                        amount = item.amount
                    }
                }
            })
        end

        exports["qb-menu"]:openMenu(shopMenu)
    else
        QBCore.Functions.Notify("The PC is not turned on.", "error")
    end
end)

-- Handle Purchases
RegisterNetEvent("sp-donutjob:client:purchaseItem")
AddEventHandler("sp-donutjob:client:purchaseItem", function(data)
    local player = source
    local item = data.item
    local price = data.price
    local amount = data.amount
    local playerData = QBCore.Functions.GetPlayerData()

    if playerData.money.cash >= price then
        -- Deduct money from player
        TriggerServerEvent("sp-donutjob:server:deductMoney", price)

        QBCore.Functions.Notify("You purchased " .. item .. " for $" .. price, "success")

        TriggerServerEvent("sp-donutjob:server:giveitem", item, amount)
    else
        -- Send notification to the player
        QBCore.Functions.Notify("You don't have enough money to buy " .. item, "error")
    end
end)
