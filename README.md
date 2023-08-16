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
- Naviage to `[qb] > qb-smallresources > config.lua` and add this image
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

### Buy Me A Coffee

[![Foo](data:image/png;base64,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)](https://www.buymeacoffee.com/SPSCRIPTS)
