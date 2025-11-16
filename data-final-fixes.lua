local item_sounds = require("__base__.prototypes.item_sounds")

local simple_biochamber = table.deepcopy(data.raw["assembling-machine"]["biochamber"])
simple_biochamber.name = "simple-biochamber"
simple_biochamber.energy_source = {
    type = "void",
    emissions_per_minute = {pollution = -1}
}
simple_biochamber.minable = {mining_time = 0.1, result = "simple-biochamber"}
simple_biochamber.crafting_speed = simple_biochamber.crafting_speed * 0.25

data:extend {simple_biochamber}

data:extend({
    {
        type = "item",
        name = "simple-biochamber",
        icon = "__space-age__/graphics/icons/biochamber.png",
        subgroup = "agriculture",
        order = "b[biochamber]",
        inventory_move_sound = item_sounds.fluid_inventory_move,
        pick_sound = item_sounds.fluid_inventory_pickup,
        drop_sound = item_sounds.fluid_inventory_move,
        place_result = "simple-biochamber",
        stack_size = 20,
        default_import_location = "gleba"
    },
    {
        type = "recipe",
        name = "simple-biochamber",
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
        results = {{type = "item", name = "simple-biochamber", amount = 1}},
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
        recipe = "simple-biochamber"
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
    {type = "item", name = "simple-biochamber",  amount = 1},
    {type = "item", name = "iron-plate",         amount = 20},
    {type = "item", name = "electronic-circuit", amount = 5}
}
