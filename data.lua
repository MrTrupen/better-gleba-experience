local item_sounds = require("__base__.prototypes.item_sounds")

local basic_biochamber = table.deepcopy(data.raw["assembling-machine"]["biochamber"])
basic_biochamber.name = "basic-biochamber"
basic_biochamber.energy_source =
{
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = {pollution = 1, spores = 1}
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
        icon = "__space-age__/graphics/icons/biochamber.png",
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
        results = {{type = "item", name = "basic-biochamber", amount = 1}},
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
