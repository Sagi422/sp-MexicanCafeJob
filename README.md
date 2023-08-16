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

<a href="https://www.buymeacoffee.com/SPSCRIPTS">
    <img src="hdata:image/png;base64,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" alt="BuyMeACoffe"/>
</a>
