# sp-MexicanCafeJob
- QBCore based Mexican Cafe Job
---
# Installation

```CSS
# QBCore & Extra stuff
ensure qb-core
ensure [qb]
ensure [standalone]
ensure [voice]
ensure [defaultmaps]
ensure sp-MexicanCafeJob
```

---
## Add The Job To Ther Server Jobs
- Naviage to `[qb] > qb-core > shared > jobs.lua`
```lua
    ['mexicancafe'] = {
        label = 'Mexican Cafe',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 100
            },
            ['1'] = {
                name = 'Waiter/Waitress',
                payment = 150
            },
            ['2'] = {
                name = 'Assistant Manager',
                payment = 200
            },
            ['3'] = {
                name = 'Manager',
                payment = 250
            },
            ['4'] = {
                name = 'Co Owner',
                payment = 250,
                isboss = true
            },
            ['5'] = {
                name = 'Owner',
                payment = 300,
                isboss = true
            }
        }
    },
```

## Items installation
- To make items in this Mexican Cafe Job you need to add an items to your server
- Naviage to `[qb] > qb-core / shared / items.lua` and add this lines
```lua
-- sp-MexicanCafeJob Items
	['water_bottle'] 				 = {['name'] = 'water_bottle', 			  	  	['label'] = 'Bottle of Water', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'water_bottle.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'For all the thirsty out there'},
	['champagne'] 			 	 	 = {['name'] = 'champagne', 			 		['label'] = 'Champagne',				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'champagne.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Glass Fill With champagne'},
	['beer'] 			 		 	 = {['name'] = 'beer', 			 			['label'] = 'Beer',						['weight'] = 200, 		['type'] = 'item', 		['image'] = 'beer.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Glass Fill With Beer'},
	['white_wine'] 			 	 	 = {['name'] = 'white_wine', 			 		['label'] = 'White Wine',				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'white_wineglass.png',		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Glass Fill With White Wine'},
	['red_wine'] 			 	 	 = {['name'] = 'red_wine', 			 		['label'] = 'Red Wine',				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'red_wine.png',		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Glass Fill With Red Wine'},
	["flour"]						= {["name"] = "flour",  	  		["label"] = "Flour",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "flour.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["dough"]						= {["name"] = "dough",  	  		["label"] = "Dough",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "dough.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tortillas"]						= {["name"] = "tortillas",  	  		["label"] = "Tortillas",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tortillas.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["salsa"]						= {["name"] = "salsa",  	  		["label"] = "Salsa Suace",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "salsa.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["chicken_burrito"]						= {["name"] = "chicken_burrito",  	  		["label"] = "Chicken Burrito",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "chicken_burrito.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["beef_burrito"]						= {["name"] = "beef_burrito",  	  		["label"] = "Beef Burrito",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "beef_burrito.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cilantro"]						= {["name"] = "cilantro",  	  		["label"] = "Cilantro",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "cilantro.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tacos_al_pastor"]						= {["name"] = "tacos_al_pastor",  	  		["label"] = "Tacos Al Pastor",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tacos_al_pastor.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tacos_de_barbacoas"]						= {["name"] = "tacos_de_barbacoa",  	  		["label"] = "Tacos De Barbacoa",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tacos_de_barbacoa.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tacos_de_birria"]						= {["name"] = "tacos_de_birria",  	  		["label"] = "Tacos De Birria",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tacos_de_birria.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tacos_de_carne_asada"]						= {["name"] = "tacos_de_carne_asada",  	  		["label"] = "Tacos De Carne Asada",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tacos_de_carne_asada.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tacos_de_chorizo"]						= {["name"] = "tacos_de_chorizo",  	  		["label"] = "Tacos De Chorizo",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tacos_de_chorizo.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tacos_de_pescado"]						= {["name"] = "tacos_de_pescado",  	  		["label"] = "Tacos De Pescado",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tacos_de_pescado.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["guacamoles"]						= {["name"] = "guacamole",  	  		["label"] = "Guacamole",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "guacamole.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["pico_de_gallo"]						= {["name"] = "pico_de_gallo",  	  		["label"] = "Pico De Gallo",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "pico_de_gallo.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cabbage"]						= {["name"] = "cabbage",  	  		["label"] = "Cabbage",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "cabbage.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["sour_cream"]						= {["name"] = "sour_cream",  	  		["label"] = "Sour Cream",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "sour_cream.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["clean_food_plate"]						= {["name"] = "clean_food_plate",  	  		["label"] = "Food Plate",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "clean_food_plate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["dirty_food_plate"]						= {["name"] = "dirty_food_plate",  	  		["label"] = "Dirty Food Plate",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "dirty_food_plate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["clean_cup"]						= {["name"] = "clean_cup",  	  		["label"] = "Cup",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "clean_cup.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["dirty_cup"]						= {["name"] = "dirty_cup",  	  		["label"] = "Dirty Cup",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "dirty_cup.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["ice"]						= {["name"] = "ice",  	  		["label"] = "Ice",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "ice.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["tea_bag"]						= {["name"] = "tea_bag",  	  		["label"] = "Tea Bag",	   		["weight"] = 50, 		["type"] = "item", 		["image"] = "tea_bag.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["ice_tea"] 						= {["name"] = "ice_tea",						["label"] = "Ice Tea",						["weight"] = 300,		["type"] = "item",		["image"] = "ice_tea.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Ice Tea", ['thirst'] = math.random(35, 54) },
	["lemon_ice_tea"] 						= {["name"] = "lemon_ice_tea",						["label"] = "Lemon Ice Tea",						["weight"] = 300,		["type"] = "item",		["image"] = "lemon_ice_tea.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Lemon Ice Tea", ['thirst'] = math.random(35, 54) },
	["green_garden"] 						= {["name"] = "green_garden",						["label"] = "Green Garden",						["weight"] = 300,		["type"] = "item",		["image"] = "green_garden.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Green Garden Drink", ['thirst'] = math.random(35, 54) },
	['sprite'] 	         	 	 = {['name'] = 'sprite', 						['label'] = 'Sprite', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sprite.png', 				['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cup Fill With Sprite'},
	["nachos"] 						= {["name"] = "nachos",  	     			["label"] = "Nachos",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "nachos.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bag of Nachos", ['hunger'] = math.random(40, 50) },
	['milk'] 	     		 		 = {['name'] = 'milk', 						['label'] = 'Milk', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'milk.png', 				['unique'] = false, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Milk'},
	['lemon'] 						 = {['name'] = 'lemon', 			 	  	  	['label'] = 'lemon Slice', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'lemon.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Nice To Add To A Drink'},
	["raw_chicken"] 						= {["name"] = "raw_chicken",  	  		["label"] = "Raw Chicken",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_chicken.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["cooked_chicken"] 						= {["name"] = "cooked_chicken",  	  		["label"] = "Cooked Chicken",	    ["weight"] = 25, 		["type"] = "item", 		["image"] = "cooked_chicken.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["raw_beef"] 						= {["name"] = "raw_beef",  	     		["label"] = "Raw Beef",	 		["weight"] = 25, 		["type"] = "item", 		["image"] = "raw_beef.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["beef"] 							= {["name"] = "beef",  	     			["label"] = "Beef",	 		    ["weight"] = 25, 		["type"] = "item", 		["image"] = "beef.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = ""},
	["onion"]                       = {["name"] = "onion",                      ["label"] = "Onion",                    ["weight"] = 500,       ["type"] = "item",      ["image"] = "burger-onion.png", ["unique"] = false,     ["useable"] = false,    ["shouldClose"] = false,    ["combinable"] = nil,    ["description"] = "An onion"},
	["melon"] 					= {["name"] = "melon",  	    		["label"] = "Melon Slice",			["weight"] = 100, 		["type"] = "item", 		["image"] = "melon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30), ['thirst'] = math.random(20, 30) },
	['pineapple'] 					 = {['name'] = 'pineapple', 			 	  	['label'] = 'Pineapple Slice',			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'rpineapple.png',			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] nil,   ['description'] = 'Nice To Add To A Drink'},
	["avocado"] 				 	 = {["name"] = "avocado", 			  	  	["label"] = "Avocado", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "avocado.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Avocado"},
	["cheese"] 					 = {["name"] = "cheese",					["label"] = "Cheese Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheese.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Slice of Cheese"},
```
---
## Add The Food
- Naviage to `[qb] > qb-smallresources > config.lua`
```lua
Config.ConsumablesEat = {
    -- sp-MexicanCafeJob
    ["chicken_burrito"] = math.random(35, 54),
    ["nachos"] = math.random(35, 54),
    ["beef_burrito"] = math.random(35, 54),
    ["tacos_al_pastor"] = math.random(35, 54),
    ["tacos_de_barbacoas"] = math.random(35, 54),
    ["tacos_de_birria"] = math.random(35, 54),
    ["tacos_de_carne_asada"] = math.random(35, 54),
    ["tacos_de_chorizo"] = math.random(35, 54),
    ["tacos_de_pescado"] = math.random(35, 54),
}

Config.ConsumablesDrink = {
    -- sp-MexicanCafeJob
    ["ice_tea"] = math.random(20, 40),
    ["lemon_ice_tea"] = math.random(20, 40),
    ["green_garden"] = math.random(20, 40),
}

Config.ConsumablesAlcohol = {
    -- sp-MexicanCafeJob
    ["beer"] = math.random(30, 40),
    ["red_wine"] = math.random(20, 40),
    ["white_wine"] = math.random(20, 40),
    ["champagne"] = math.random(20, 40),
}
```
## Add The Ped For The Vehicle Spawner
- Naviage to `[qb] > qb-target > init.lua`
```lua
Config.Peds = {{
    model = `a_m_m_fatlatin_01`,
    coords = vector4(358.06, -334.1, 46.76, 211.11),
    networked = true,
    invincible = true,
    blockevents = ture,
    scenario = "WORLD_HUMAN_CLIPBOARD_FACILITY",
    target = {
        options = {{
            type = "client",
            event = "sp-MexicanCafeJob:VehicleMenu",
            icon = 'fas fa-car',
            label = "Open Vehicle Menu",
            job = "mexicancafe"
        }},
        distance = 2.5
    }
}}
```

### Buy Me A Coffee

<a href="https://www.buymeacoffee.com/SPSCRIPTS">
    <img src="https://helloimjessa.files.wordpress.com/2021/06/bmc-button.png" alt="BuyMeACoffe"/>
</a>

