local item_sounds = require("__base__.prototypes.item_sounds")

local basic_biochamber = table.deepcopy(data.raw["assembling-machine"]["biochamber"])
basic_biochamber.name = "basic-biochamber"
basic_biochamber.icons = {
    {
        icon = "__space-age__/graphics/icons/biochamber.png",
        icon_size = 64,
        tint = {r = 0.3, g = 0.45, b = 1, a = 1}
    }
}
basic_biochamber.energy_source =
{
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = {pollution = 1, spores = 0.25}
}
basic_biochamber.energy_usage = "50kW"
basic_biochamber.minable = {mining_time = 0.1, result = "basic-biochamber"}
basic_biochamber.crafting_speed = basic_biochamber.crafting_speed * 0.25
basic_biochamber.module_slots = 0
basic_biochamber.allowed_effects = {}
basic_biochamber.effect_receiver = {base_effect = {productivity = 0.25}}


data:extend {basic_biochamber}

data:extend({
    {
        type = "item",
        name = "basic-biochamber",
        icons = {
            {
                icon = "__space-age__/graphics/icons/biochamber.png",
                icon_size = 64,
                tint = {r = 0.3, g = 0.45, b = 1, a = 1}
            }
        },
        subgroup = "agriculture",
        order = "b[biochamber]",
        inventory_move_sound = item_sounds.fluid_inventory_move,
        pick_sound = item_sounds.fluid_inventory_pickup,
        drop_sound = item_sounds.fluid_inventory_move,
        place_result = "basic-biochamber",
        stack_size = 20,
        default_import_location = "gleba"
    },
    {
        type = "recipe",
        name = "basic-biochamber",
        category = "organic-or-assembling",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
        },
        energy_required = 20,
        ingredients =
        {
            {type = "item", name = "pentapod-egg",       amount = 1},
            {type = "item", name = "iron-plate",         amount = 20},
            {type = "item", name = "electronic-circuit", amount = 5},
            {type = "item", name = "landfill",           amount = 1}
        },
        results = {
            {type = "item", name = "basic-biochamber", amount = 1}
        },
        enabled = false
    }
})

data.raw.technology["biochamber"].effects = {
    {
        type = "unlock-recipe",
        recipe = "biochamber"
    },
    {
        type = "unlock-recipe",
        recipe = "basic-biochamber"
    },
    {
        type = "unlock-recipe",
        recipe = "nutrients-from-yumako-mash"
    },
    {
        type = "unlock-recipe",
        recipe = "burnt-spoilage"
    },
    {
        type = "unlock-recipe",
        recipe = "pentapod-egg"
    }
}

data.raw["recipe"]["biochamber"].ingredients = {
    {type = "item", name = "nutrients",          amount = 25},
    {type = "item", name = "basic-biochamber",   amount = 1},
    {type = "item", name = "iron-plate",         amount = 20},
    {type = "item", name = "electronic-circuit", amount = 5}
}

--  Stable pentapod egg  --

-- Item
local stable_pentapod_egg = table.deepcopy(data.raw["item"]["pentapod-egg"])
stable_pentapod_egg.name = "stable-pentapod-egg"
stable_pentapod_egg.spoil_ticks = 0

-- Recipe
local stable_pentapod_egg_recipe = table.deepcopy(data.raw["recipe"]["pentapod-egg"])
stable_pentapod_egg_recipe.name = "stable-pentapod-egg"
stable_pentapod_egg_recipe.category = "organic-or-hand-crafting"
stable_pentapod_egg_recipe.icons = {
    {
        icon = "__space-age__/graphics/icons/pentapod-egg-3.png",
        icon_size = 64,
        tint = {r = 0.3, g = 0.45, b = 1, a = 1}
    }
}
stable_pentapod_egg_recipe.ingredients = {
    {type = "item", name = "pentapod-egg", amount = 10},
    {type = "item", name = "nutrients",    amount = 100}
}
stable_pentapod_egg_recipe.results = {
    {type = "item", name = "stable-pentapod-egg", amount = 1}
}
stable_pentapod_egg_recipe.surface_conditions = {}

-- Technology
local stable_pentapod_technology = table.deepcopy(data.raw["technology"]["bioflux"])
stable_pentapod_technology.name = "stable-pentapod-egg"
stable_pentapod_technology.icon = "__space-age__/graphics/icons/pentapod-egg-3.png"
stable_pentapod_technology.icon_size = 64
stable_pentapod_technology.effects = {
    {
        type = "unlock-recipe",
        recipe = "stable-pentapod-egg"
    },
    {
        type = "unlock-recipe",
        recipe = "unstable-pentapod-egg"
    }
}
stable_pentapod_technology.research_trigger = {
    type = "craft-item",
    item = "pentapod-egg",
    count = 100
}

-- data extend
data:extend {stable_pentapod_egg, stable_pentapod_egg_recipe, stable_pentapod_technology}


--  Unstable pentapod egg  --

-- Recipe
local unstable_pentapod_egg_recipe = table.deepcopy(data.raw["recipe"]["pentapod-egg"])
unstable_pentapod_egg_recipe.name = "unstable-pentapod-egg"
unstable_pentapod_egg_recipe.category = "organic-or-hand-crafting"
unstable_pentapod_egg_recipe.ingredients = {
    {type = "item", name = "stable-pentapod-egg", amount = 1}
}
unstable_pentapod_egg_recipe.results = {
    {type = "item", name = "pentapod-egg", amount = 1}
}
unstable_pentapod_egg_recipe.surface_conditions = {}

-- data extend
data:extend {unstable_pentapod_egg_recipe}
