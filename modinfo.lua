name = "Redesigned Frontend"
priority = 100



forumthread = ""

api_version = 10




--Compatibility
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false




--Require
all_clients_require_mod = false
client_only_mod = true 







--Icons
icon_atlas = "modicon.xml"
icon = "modicon.tex"





local scales = {
}

for i = 1, 20 do
	scales[i] = {description = "x"..i/10, data = i/10}
end

local pos = {
	[1] = {description = "Default", data = 0}
}

for i = 2, 15 do
	pos[i] = {description = "+"..i.."0", data = i*10}
end

local opt_Empty = {{description = "", data = 0}}
local function Title(title,hover)
	return {
		name=title,
		hover=hover,
		options=opt_Empty,
		default=0,
	}
end


local SEPARATOR = Title("")

configuration_options =
{
	Title("Main Menu"),
	
	

	{
		name    = "logod",
		label   = "Login Delay",
		hover   = "What menu do you want to use",
		options =
		
		{
			{description = "Instant", data = 0},
			{description = "1 Sec", data = 1},
			{description = "5 Sec", data = 5},
		},
		default = 1,
	},


	{
		name    = "dist",
		label   = "Login Music",
		hover   = "Want Login Screen music to have special FX ?",
		options =
		
		{
			{description = "Yes", data = 1},
			{description = "No", data = 5},
		},
		default = 1,
	},

}