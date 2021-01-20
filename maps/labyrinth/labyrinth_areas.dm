/area/exoplanet/volcanic/labyrinth
	name       = "\improper Labyrinth Exterior"

/area/labyrinth
	name       = "\improper Labyrinth Facility"
	icon_state = "labyrinth"
	icon       = 'maps/labyrinth/media/areas.dmi'
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

//Engineering

/area/labyrinth/engineering
	name       = "Engineering"
	req_access = list(access_engine)

/area/labyrinth/engineering/reactor
	name = "Reactor Bay"

/area/labyrinth/engineering/power
	name = "Power Supply"

/area/labyrinth/engineering/atmospherics
	name = "Life Support"

/area/labyrinth/engineering/communications
	name = "Communications"

//Maintenance

/area/labyrinth/maintenance
	req_access = list(access_maint_tunnels)

/area/labyrinth/maintenance/shaft
	name = "Maintenance Shaft"

//Routing

/area/labyrinth/hallway/lower
	name = "Lower Hallway"

/area/labyrinth/hallway/upper
	name = "Surface Hallway"

/area/labyrinth/hallway/tower
	name = "Upper Hallway"

/area/labyrinth/eva
	name       = "Exterior Access"
	req_access = list(access_eva)

//Civilian

/area/labyrinth/civilian
	name = "Recreation Area"

/area/labyrinth/civilian/dorm
	name = "Dormitory"

/area/labyrinth/civilian/hygiene
	name = "Hygiene"

/area/labyrinth/civilian/lounge
	name = "Lounge"

/area/labyrinth/civilian/library
	name = "Library"

/area/labyrinth/civilian/cryo
	name = "Cryogenic Storage"

//Medical

/area/labyrinth/medical
	name = "Medical Bay"
	req_access = list(access_medical)

/area/labyrinth/medical/lobby
	name = "Medical Lobby"
	req_access = list()

//Science

/area/labyrinth/science
	name       = "Science Lab"
	req_access = list(access_research)

/area/labyrinth/science/fabrication
	name = "Fabrication Bay"

/area/labyrinth/science/workshop
	name = "Workshop"

/area/labyrinth/science/testing
	name = "Secure Testing Site"

//Cargo

/area/labyrinth/cargo
	name = "Cargo Bay"
	req_access = list(access_cargo)

/area/labyrinth/cargo/storage
	name = "Cargo Storage"

/area/labyrinth/cargo/lift
	name = "Cargo Lift"
	requires_power = FALSE
	dynamic_lighting = TRUE

/area/labyrinth/cargo/smelter
	name = "Mining Smelter"
	req_access = list(list(access_cargo, access_research, access_engine))

//Sec+com

/area/labyrinth/bridge
	name       = "Bridge"
	req_access = list(access_bridge)

/area/labyrinth/security
	name       = "Security"
	req_access = list(access_security)
