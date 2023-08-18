local QBCore = exports['qb-core']:GetCoreObject()

onDuty = true
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
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

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("sp-MexicanCafeJob:Plate", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Grab Plate',
        icon = "fas fa-hands-bubbles",
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:grabPlate',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Grab Cup',
        icon = "fas fa-hands-bubbles",
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:grabCup',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Close',
        txt = '',
        icon = 'fas fa-x',
        params = {
            event = 'qb-menu:client:closeMenu',
            args = {
                message = ''
            }
        }
    }})

end)

RegisterNetEvent("sp-MexicanCafeJob:grabPlate", function()
    if onDuty then
        local randomNumber = math.random(1, 10)
        if randomNumber <= 5 then
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'clean_food_plate', 1)
            TriggerEvent('QBCore:Notify', "You've Got Clean Plate All Good!", 'success')
        else
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'dirty_food_plate', 1)
            TriggerEvent('QBCore:Notify', "Yakk, You've Got Dirty Plate, Wash It Before Using!", 'error')
        end
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:grabCup", function()
    if onDuty then
        local randomNumber = math.random(1, 10)
        if randomNumber <= 5 then
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'clean_cup', 1)
            TriggerEvent('QBCore:Notify', "You've Got Clean Cup All Good!", 'success')
        else
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'dirty_cup', 1)
            TriggerEvent('QBCore:Notify', "Yakk, You've Got Dirty Cup, Wash It Before Using!", 'error')
        end
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)
RegisterNetEvent("sp-MexicanCafeJob:Sink", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Wash Hands',
        icon = "fas fa-hands-bubbles",
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:washHands',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Wash Plate',
        icon = "fas fa-soap",
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:washPlates',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Wash Cup',
        icon = "fas fa-soap",
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:washCup',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Close',
        txt = '',
        icon = 'fas fa-x',
        params = {
            event = 'qb-menu:client:closeMenu',
            args = {
                message = ''
            }
        }
    }})

end)

function WashPlate()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("wash_dirty_plate", "Washing Plate", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'dirty_food_plate', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'clean_food_plate', 1)
                    TriggerEvent('QBCore:Notify', "You've Washed The Dirt Plate!", 'success')
                else
                end
            end)
        end
    end, 'dirty_food_plate')
end

RegisterNetEvent("sp-MexicanCafeJob:washPlates", function()
    if onDuty then
        WashPlate()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

function WashCup()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("wash_dirty_cup", "Washing Cup", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'dirty_cup', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'clean_cup', 1)
                    TriggerEvent('QBCore:Notify', "You've Washed The Dirt Cup!", 'success')
                else
                end
            end)
        end
    end, 'dirty_cup')
end

RegisterNetEvent("sp-MexicanCafeJob:washCup", function()
    if onDuty then
        WashCup()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent('sp-MexicanCafeJob:washHands', function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 8
    }, {}, {}, function()
        TriggerEvent('QBCore:Notify', "You've washed your hands!", 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)

function MakeDough()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("dough", "Making Dough", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'flour', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'dough', 1)
                    TriggerEvent('QBCore:Notify', "Dough Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'flour')
end

function MakeTortillas()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tortillas", "Making Tortillas", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)

                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'dough', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tortillas', 3)
                    TriggerEvent('QBCore:Notify', "Tortillas Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'dough')
end

function MakeNachos()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("nachos", "Making Nachos", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)

                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'salsa', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'nachos', 1)
                    TriggerEvent('QBCore:Notify', "Nachos Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'tortillas', 'salsa')
end

RegisterNetEvent("sp-MexicanCafeJob:ChefStation", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Dough Menu',
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:DoughMenu',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Burrito Menu',
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:Burritos',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Taco Menu',
        txt = '',
        params = {
            event = 'sp-MexicanCafeJob:Tacos',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Close',
        txt = '',
        icon = 'fas fa-x',
        params = {
            event = 'qb-menu:client:closeMenu',
            args = {
                message = ''
            }
        }
    }})

end)

RegisterNetEvent("sp-MexicanCafeJob:DoughMenu", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Make Dough | 12s',
        txt = 'Ingredients | 1 Flour',
        params = {
            event = 'sp-MexicanCafeJob:dough',
            args = {
                message = 'Ingredients | 1 Flour'
            }
        }
    }, {
        header = 'Make Tortillas | 12s',
        txt = 'Ingredients | 1 Dough',
        icon = 'fas fa-burrito',
        params = {
            event = 'sp-MexicanCafeJob:tortillas',
            args = {
                message = 'Ingredients | 1 Dough'
            }
        }
    }, {
        header = 'Make Nachos | 12s',
        txt = 'Ingredients | 1 Tortillas, 1 Salsa',
        icon = 'fas fa-burrito',
        params = {
            event = 'sp-MexicanCafeJob:nachos',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Main Menu',
        txt = '',
        icon = 'fas fa-arrow-left',
        params = {
            event = 'sp-MexicanCafeJob:ChefStation',
            args = {
                message = ''
            }
        }
    }})

end)

RegisterNetEvent("sp-MexicanCafeJob:dough", function()
    if onDuty then
        MakeDough()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:tortillas", function()
    MakeTortillas()
end)

RegisterNetEvent("sp-MexicanCafeJob:nachos", function()
    if onDuty then
        MakeNachos()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

function CookChicken()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("chicken", "Cooking Chicken", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "amb@prop_human_bbq@male@enter",
                anim = "enter",    
                flags = 8
            }, {}, {}, function(cancelled)

                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'raw_chicken', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'cooked_chicken', 1)
                    TriggerEvent('QBCore:Notify', "Chicken Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'raw_chicken')
end

function CookSteak()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("steak", "Cooking Steak", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "amb@prop_human_bbq@male@enter",
                anim = "enter",                
                flags = 8
            }, {}, {}, function(cancelled)

                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'raw_beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'beef', 1)
                    TriggerEvent('QBCore:Notify', "Your Steak Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'raw_beef')
end

RegisterNetEvent("sp-MexicanCafeJob:chicken", function()
    if onDuty then
        CookChicken()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:steak", function()
    if onDuty then
        CookSteak()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:CookingStation", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Cook Chicken',
        txt = 'Ingredients | 1 Raw Chicken',
        icon = 'fas fa-drumstick-bite',
        params = {
            event = 'sp-MexicanCafeJob:chicken',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Cook Steak',
        txt = 'Ingredients | 1 Raw Beef',
        icon = 'fas fa-cow',
        params = {
            event = 'sp-MexicanCafeJob:steak',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Close',
        txt = '',
        icon = 'fas fa-x',
        params = {
            event = 'qb-menu:client:closeMenu',
            args = {
                message = ''
            }
        }
    }})

end)

RegisterNetEvent("sp-MexicanCafeJob:Burritos", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Beef Burrito',
        txt = 'Ingredients | 1 Beef, 1 Tortillas',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:beefBurrito',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Chicken Burrito',
        txt = 'Ingredients | 1 Cooked Chicken, 1 Tortillas',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:chickenBurrito',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Main Menu',
        txt = '',
        icon = 'fas fa-arrow-left',
        params = {
            event = 'sp-MexicanCafeJob:ChefStation',
            args = {
                message = ''
            }
        }
    }})

end)

function MakeBeefBurrito()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("beef_burrito", "Making BeefBurrito", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'beef_burrito', 1)
                    TriggerEvent('QBCore:Notify', "Beef Burrito Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'beef', 'tortillas')
end

function MakeChickenBurrito()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("beef_burrito", "Making BeefBurrito", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cooked_chicken', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'chicken_burrito', 1)
                    TriggerEvent('QBCore:Notify', "Chicken Burrito Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'cooked_chicken', 'tortillas')
end

RegisterNetEvent("sp-MexicanCafeJob:beefBurrito", function()
    if onDuty then
        MakeBeefBurrito()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:chickenBurrito", function()
    if onDuty then
        MakeChickenBurrito()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:Tacos", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Tacos Al Pastor',
        txt = 'Ingredients | 1 Beef, 1 Pineapple, 1 Onion, 1 Cilantro',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:tacosAlPastor',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Tacos De Barbacoa',
        txt = 'Ingredients | 1 Beef, 1 Onion, 1 Cilantro',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:TacosDeBarbacoa',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Tacos De Birria',
        txt = 'Ingredients | 1 Beef, 1 Cheese, 1 Onion, 1 Cilantro',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:TacosDeBirria',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Tacos De Carne Asada',
        txt = 'Ingredients | 1 Beef, 1 Onion, 1 Cilantro, 1 Guacamole',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:tacosDeCarneAsada',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Tacos De Chorizo',
        txt = 'Ingredients | 1 Beef, 1 Onion, 1 Cilantro, 1 Potato',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:TacosDeChorizo',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Tacos De Pescado',
        txt = 'Ingredients | 1 Beef, 1 Cabbage, 1 Pico de gallo, 1 Sour Cream, 1 Avocado',
        icon = '',
        params = {
            event = 'sp-MexicanCafeJob:tacosDePescado',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Main Menu',
        txt = '',
        icon = 'fas fa-arrow-left',
        params = {
            event = 'sp-MexicanCafeJob:ChefStation',
            args = {
                message = ''
            }
        }
    }})

end)

function MakeTacosAlPastor()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tacos_al_pastor", "Making Tacos Al Pastor", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'pineapple', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'onion', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cilantro', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tacos_al_pastor', 1)
                    TriggerEvent('QBCore:Notify', "Tacos Al Pastor!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'tortillas', 'beef', 'pineapple', 'onion', 'cilantro')
end

function MakeTacosDeBarbacoa()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tacos_de_barbacoa", "Making Tacos De Barbacoa", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'onion', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cilantro', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tacos_de_barbacoa', 1)
                    TriggerEvent('QBCore:Notify', "Tacos De Barbacoa Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'tortillas', 'beef', 'onion', 'cilantro')
end

function MakeTacosDeBirria()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tacos_de_birria", "Making Tacos De Birria", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'onion', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cheese', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cilantro', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tacos_de_birria', 1)
                    TriggerEvent('QBCore:Notify', "Tacos De Birria Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'tortillas', 'beef', 'onion', 'cilantro', 'cheese')
end

function MakeTacosDeCarneAsada()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tacos_de_carne_asada", "Making Tacos De Carne Asada", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'onion', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'guacamole', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cilantro', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tacos_de_carne_asada', 1)
                    TriggerEvent('QBCore:Notify', "Tacos De Carne Asada Is Ready!, Please Check Your Inventory!",
                        'success')
                else
                end
            end)
        end
    end, 'tortillas', 'beef', 'onion', 'cilantro', 'guacamole')
end

function MakeTacosDeChorizo()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tacos_de_chorizo", "Making Tacos De Chorizo", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'onion', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'potato', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cilantro', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tacos_de_chorizo', 1)
                    TriggerEvent('QBCore:Notify', "Tacos De Chorizo Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'tortillas', 'beef', 'onion', 'cilantro', 'potato')
end

function MakeTacosDePescado()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("tacos_de_pescado", "Making Tacos De Pescado", 12000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 8
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tortillas', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'beef', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'avocado', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'pico_de_gallo', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'cabbage', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'sour_cream', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'tacos_de_pescado', 1)
                    TriggerEvent('QBCore:Notify', "Tacos De Pescado Is Ready!, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'tortillas', 'beef', 'avocado', 'cabbage', 'sour_cream', 'pico_de_gallo')
end

RegisterNetEvent("sp-MexicanCafeJob:tacosAlPastor", function()
    if onDuty then
        MakeTacosAlPastor()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:TacosDeBarbacoa", function()
    if onDuty then
        MakeTacosDeBarbacoa()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:TacosDeBirria", function()
    if onDuty then
        MakeTacosDeBirria()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:tacosDeCarneAsada", function()
    if onDuty then
        MakeTacosDeCarneAsada()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:TacosDeChorizo", function()
    if onDuty then
        MakeTacosDeCarneAsada()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:tacosDePescado", function()
    if onDuty then
        MakeTacosDePescado()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:Ice", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Grab Ice',
        icon = "fas fa-cubes",
        txt = 'Ingredients | Bottle Of Water',
        params = {
            event = 'sp-MexicanCafeJob:grabIce',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Close',
        txt = '',
        icon = 'fas fa-x',
        params = {
            event = 'qb-menu:client:closeMenu',
            args = {
                message = ''
            }
        }
    }})

end)

function GrabIce()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("grab_ice", "Grabbing Ice", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'water_bottle', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'ice', 5)
                    TriggerEvent('QBCore:Notify', "You've Grabbed Ice, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'water_bottle')
end

RegisterNetEvent("sp-MexicanCafeJob:grabIce", function()
    if onDuty then
        GrabIce()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:DrinksMenu", function()

    exports['qb-menu']:openMenu({{
        header = 'Mexican Café',
        icon = 'fas fa-hat-cowboy-side',
        isMenuHeader = true
    }, {
        header = 'Beer | 5s',
        icon = "fas fa-beer-mug-empty",
        txt = 'Ingredients | None',
        params = {
            event = 'sp-MexicanCafeJob:beer',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Red Wine | 5s',
        icon = "fas fa-wine-glass",
        txt = 'Ingredients | None',
        params = {
            event = 'sp-MexicanCafeJob:redwine',
            args = {
                message = ''
            }
        }
    }, {
        header = 'White Wine | 5s',
        icon = "fas fa-wine-glass",
        txt = 'Ingredients | None',
        params = {
            event = 'sp-MexicanCafeJob:whitewine',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Champange | 5s',
        icon = "fas fa-champagne-glasses",
        txt = 'Ingredients | None',
        params = {
            event = 'sp-MexicanCafeJob:champange',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Ice Tea | 5s',
        icon = "fas fa-mug-saucer",
        txt = 'Ingredients | 1 Ice, 1 Tea Bag',
        params = {
            event = 'sp-MexicanCafeJob:iceTea',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Lemon Ice Tea | 5s',
        icon = "fas fa-lemon",
        txt = 'Ingredients | 1 Lemon, 1 Ice, 1 Tea Bag',
        params = {
            event = 'sp-MexicanCafeJob:lemonIceTea',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Green Garden | 5s',
        icon = "fas fa-circle",
        txt = 'Ingredients | 1 Ice, 1 Milk, 1 Lemon, 1 Sprite',
        params = {
            event = 'sp-MexicanCafeJob:greenGarden',
            args = {
                message = ''
            }
        }
    }, {
        header = 'Close',
        txt = '',
        icon = 'fas fa-x',
        params = {
            event = 'qb-menu:client:closeMenu',
            args = {
                message = ''
            }
        }
    }})

end)

function MakeBeer()
    QBCore.Functions.Progressbar("Beer", "Pouring Beer", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_ped_interaction",
        anim = "handshake_guy_a",
        flags = 49
    }, {}, {}, function(cancelled)
        if not cancelled then
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'beer', 1)
            TriggerEvent('QBCore:Notify', "You've Poured Beer, Please Check Your Inventory!", 'success')
        else
        end
    end)
end

function MakeRedWine()
    QBCore.Functions.Progressbar("red_wine", "Pouring Red Wine", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_ped_interaction",
        anim = "handshake_guy_a",
        flags = 49
    }, {}, {}, function(cancelled)
        if not cancelled then
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'red_wine', 1)
            TriggerEvent('QBCore:Notify', "You've Poured Red Wine, Please Check Your Inventory!", 'success')
        else
        end
    end)
end

function MakeWhiteWine()
    QBCore.Functions.Progressbar("white_wine", "Pouring White Wine", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_ped_interaction",
        anim = "handshake_guy_a",
        flags = 49
    }, {}, {}, function(cancelled)
        if not cancelled then
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'white_wine', 1)
            TriggerEvent('QBCore:Notify', "You've Poured White Wine, Please Check Your Inventory!", 'success')
        else
        end
    end)
end

function MakeChampange()
    QBCore.Functions.Progressbar("champange", "Pouring Champange", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_ped_interaction",
        anim = "handshake_guy_a",
        flags = 49
    }, {}, {}, function(cancelled)
        if not cancelled then
            TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'champagne', 1)
            TriggerEvent('QBCore:Notify', "You've Poured Champagne, Please Check Your Inventory!", 'success')
        else
        end
    end)
end

function MakeIceTea()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("ice_tea", "Making Ice Tea", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'ice', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tea_bag', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'ice_tea', 1)
                    TriggerEvent('QBCore:Notify', "You've Maked Ice Tea, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'ice', 'tea_bag')
end

function makeLemonIceTea()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("lemon_ice_tea", "Making Lemon Ice Tea", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'ice', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'lemon', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'tea_bag', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'lemon_ice_tea', 1)
                    TriggerEvent('QBCore:Notify', "You've Maked Lemon Ice Tea, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'ice', 'tea_bag', 'lemon')
end

function makeGreenGarden()
    QBCore.Functions.TriggerCallback('sp-MexicanCafeJob:checkitem', function(hasItem)
        if hasItem then
            QBCore.Functions.Progressbar("green_garden", "Making Green Garden", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mp_ped_interaction",
                anim = "handshake_guy_a",
                flags = 49
            }, {}, {}, function(cancelled)
                if not cancelled then
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'ice', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'sprite', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'melon', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'leamon', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:deleteitem', 'milk', 1)
                    TriggerServerEvent('sp-MexicanCafeJob:giveitem', 'green_garden', 1)
                    TriggerEvent('QBCore:Notify', "You've Maked Leamon Ice Tea, Please Check Your Inventory!", 'success')
                else
                end
            end)
        end
    end, 'ice', 'sprite', 'leamon', 'milk', 'melon')
end

RegisterNetEvent("sp-MexicanCafeJob:beer", function()
    if onDuty then
        MakeBeer()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:whitewine", function()
    if onDuty then
        MakeWhiteWine()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:redwine", function()
    if onDuty then
        MakeRedWine()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:champange", function()
    if onDuty then
        MakeChampange()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:iceTea", function()
    if onDuty then
        MakeIceTea()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:lemonIceTea", function()
    if onDuty then
        makeLemonIceTea()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:greenGarden", function()
    if onDuty then
        makeGreenGarden()
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

exports['qb-target']:AddBoxZone("WashHands", vector3(360.26, -344.62, 46.78), 1.4, 0.8, {
    name = "WashHands",
    heading = 11.0,
    debugPoly = false,
    minZ = 42.78,
    maxZ = 46.98
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:Sink",
        icon = "fas fa-sink",
        label = "Sink",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Fridge", vector3(360.83, -342.71, 46.78), 1.6, 1, {
    name = "Fridge",
    heading = 340,
    debugPoly = false,
    minZ = 44.18,
    maxZ = 48.18
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:fridge",
        icon = "fas fa-box",
        label = "Open Fridge",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("ChefStation", vector3(365.39, -345.04, 46.78), 1.0, 1, {
    name = "ChefStation",
    heading = 340,
    debugPoly = false,
    minZ = 46.73,
    maxZ = 46.93
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:ChefStation",
        icon = "fas fa-kitchen-set",
        label = "Chef Station",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Shop", vector3(366.77, -334.17, 46.78), 0.8, 2.6, {
    name = "Shop",
    heading = 340,
    debugPoly = false,
    minZ = 44.18,
    maxZ = 48.18
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:Shop",
        icon = "fas fa-shopping-cart",
        label = "Open Shop",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Cooking Station", vector3(363.14, -344.95, 46.78), 0.8, 0.8, {
    name = "Cooking Station",
    heading = 340,
    debugPoly = false,
    minZ = 42.78,
    maxZ = 46.78
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:CookingStation",
        icon = "fas fa-utensils",
        label = "Cooking Station",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Plate", vector3(359.81, -345.81, 46.78), 0.8, 0.8, {
    name = "Plate",
    heading = 221,
    debugPoly = false,
    minZ = 46.78,
    maxZ = 47.58
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:Plate",
        icon = "fas fa-house-tsunami",
        label = "Dish Drying",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Duty", vector3(364.35, -336.69, 46.78), 0.2, 1.2, {
    name = "Duty",
    heading = 340,
    debugPoly = false,
    minZ = 46.33,
    maxZ = 47.13
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:ToggleDuty",
        icon = "fas fa-clock",
        label = "Duty",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Ice", vector3(367.87, -345.21, 46.78), 0.6, 1.0, {
    name = "Ice",
    heading = 340,
    debugPoly = false,
    minZ = 42.58,
    maxZ = 46.58
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:Ice",
        icon = "fas fa-cubes",
        label = "Ice",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Drinks", vector3(367.82, -345.28, 46.78), 0.6, 0.2, {
    name = "Drinks",
    heading = 340,
    debugPoly = false,
    minZ = 46.78,
    maxZ = 47.58
}, {
    options = {{
        type = "client",
        event = "sp-MexicanCafeJob:DrinksMenu",
        icon = "fas fa-whiskey-glass",
        label = "Drinks Menu",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Cash Register", vector3(367.2, -347.2, 46.78), 0.4, 0.4, {
    name = "Cash Register",
    heading = 340,
    debugPoly = false,
    minZ = 46.83,
    maxZ = 47.23
}, {
    options = {{
        type = "client",
        event = "jim-payments:client:Charge",
        icon = "fas fa-cash-register",
        label = "Charge Customer",
        job = "mexicancafe"
    }},
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Boss Menu", vector3(372.08, -335.61, 48.11), 3.0, 1.2, {
    name = "Boss Menu",
    heading = 340,
    debugPoly = false,
    minZ = 44.91,
    maxZ = 48.71
}, {
    options = {{
        type = "client",
        event = "qb-bossmenu:client:OpenMenu",
        icon = "fas fa-user",
        label = "Open Boss Menu",
        job = "mexicancafe"
    }},
    distance = 2.5
})

RegisterNetEvent('sp-MexicanCafeJob:ToggleDuty', function()
    onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("sp-MexicanCafeJob:fridge", function()
    if onDuty then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Ingredient Storage")
        TriggerEvent("inventory:client:SetCurrentStash", "Ingredient Storage")
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:Shop", function()
    if onDuty then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "MexicanCafe", Config.Items)
    else
        TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
    end
end)

RegisterNetEvent("sp-MexicanCafeJob:VehicleMenu", function()
    if onDuty then
    exports['qb-menu']:openMenu({
        {
            header = 'Mexican Café',
            icon = 'fas fa-hat-cowboy-side',
            isMenuHeader = true
        },
        {
            header = 'Emperor',
            icon = "fas fa-car",
            txt = '',
            params = {
                event = 'sp-MexicanCafeJob:spawnVehicle',
                args = {
                    vehicleName = 'Emperor'
                }
            }
        },
        {
            header = 'Taco Van',
            icon = "fas fa-car",
            txt = '',
            params = {
                event = 'sp-MexicanCafeJob:spawnVehicle',
                args = {
                    vehicleName = 'Taco Van'
                }
            }
        },
        {
            header = 'Return Vehicle',
            icon = "fas fa-rotate-left",
            txt = '',
            params = {
                event = 'sp-MexicanCafeJob:ReturnVehicle',
                args = {
                    message = ''
                }
            }
        },
        {
            header = 'Close',
            txt = '',
            icon = 'fas fa-x',
            params = {
                event = 'qb-menu:client:closeMenu',
                args = {
                    message = ''
                }
            }
        }
    })
else
    TriggerEvent('QBCore:Notify', "You are Not On Duty", 'error')
end
end)

RegisterNetEvent("sp-MexicanCafeJob:spawnVehicle", function(data)
    local vehicleName = data.vehicleName
    if onDuty then
        local coords = Config.Locations['vehicleSpawn']
        local selectedVehicle = Config.Vehicles[vehicleName]
        if selectedVehicle then
            QBCore.Functions.SpawnVehicle(selectedVehicle, function(veh)
                SetVehicleNumberPlateText(veh, 'MCafe69')
                SetEntityHeading(veh, coords.w)
                exports['LegacyFuel']:SetFuel(veh, 100.0)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                SetVehicleEngineOn(veh, true, true)
            end, coords, true)
        else
            print("Invalid vehicle selected.")
        end
    end
end)



RegisterNetEvent("sp-MexicanCafeJob:ReturnVehicle", function()
    if onDuty then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        if veh ~= 0 then
            SetEntityAsMissionEntity(veh, true, true)
            DeleteVehicle(veh)
            TriggerEvent('QBCore:Notify', "Vehicle Returned!", 'success')
        else
            local pcoords = GetEntityCoords(ped)
            local vehicles = GetGamePool('CVehicle')
            for k, v in pairs(vehicles) do
                if #(pcoords - GetEntityCoords(v)) <= 25.0 then
                    SetEntityAsMissionEntity(v, true, true)
                    DeleteVehicle(v)
                    TriggerEvent('QBCore:Notify', "Vehicle Returned!", 'success')
                end
            end
        end
    end
end)

-- Blip

local blips = {{
    title = "Mexican Café",
    colour = 2,
    id = 463,
    x = 363.09,
    y = -357.91,
    z = 46.44
}}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 1.0)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

