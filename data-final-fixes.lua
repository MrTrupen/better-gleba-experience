local simple_biochamber = table.deepcopy(data.raw["assembling-machine"]["biochamber"])
simple_biochamber.name = "simple-biochamber"
simple_biochamber.energy_source = {
    type = "void",
    emissions_per_minute = {pollution = -1}
}

data:extend {simple_biochamber}
