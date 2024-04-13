-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
	["Instahum"] = {
		["Parent"] = {
			["Instahum"] = true
		},
		["Hierarchy"] = { "Verify" },
		["Service"] = {}
	},
	["HeliPriv"] = {
		["Parent"] = {
			["HeliPriv"] = true
		},
		["Hierarchy"] = { "Piloto" },
		["Service"] = {}
	},
	["Creators"] = {
		["Parent"] = {
			["Creators"] = true
		},
		["Hierarchy"] = { "Staff","Creator" },
		["Salary"] = { 1,1500 },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Groups
    ["Emergency"] = {
		["Parent"] = {
			["Police"] = true,
			["Comanf"] = true,
			["Paramedic"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
	["Restaurants"] = {
		["Parent"] = {
			["Pearls"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
    -- Framework
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { "Administrador","Moderador","Suporte" },
		["Service"] = {}
	},
	["Premium"] = {
		["Parent"] = {
			["Premium"] = true
		},
		["Hierarchy"] = { "Ouro","Prata","Bronze" },
		["Salary"] = { 5000,3500,2000 },
		["Service"] = {}
	},
	["Spotify"] = {
		["Parent"] = {
			["Spotify"] = true
		},
		["Hierarchy"] = { "Ouvinte" },
		["Salary"] = {},
		["Service"] = {}
	},
    -- Public
	["OAB"] = {
		["Parent"] = {
			["OAB"] = true
		},
		["Hierarchy"] = { "Juridico" },
		["Salary"] = { 1750 },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Paramedic"] = {
		["Parent"] = {
			["Paramedic"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 4500,4250,4000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Police"] = {
		["Parent"] = {
			["Police"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 4500,4250,4000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Comanf"] = {
		["Parent"] = {
			["Comanf"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 4500,4250,4000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["APH"] = {
		["Parent"] = {
			["APH"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	------------------------------
	["Harmony"] = {
		["Parent"] = {
			["Harmony"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Ottos"] = {
		["Parent"] = {
			["Ottos"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Dk"] = {
		["Parent"] = {
			["Dk"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Restaurants
	["Pearls"] = {
		["Parent"] = {
			["Pearls"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Contraband Sul
	["BackpackSell"] = {
		["Parent"] = {
			["BackpackSell"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Chiliad"] = {
		["Parent"] = {
			["Chiliad"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Families"] = {
		["Parent"] = {
			["Families"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Highways"] = {
		["Parent"] = {
			["Highways"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Vagos"] = {
		["Parent"] = {
			["Vagos"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	-- Contraband North
	["GasStation"] = {
		["Parent"] = {
			["GasStation"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Hookies"] = {
		["Parent"] = {
			["Hookies"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["RoadKill"] = {
		["Parent"] = {
			["RoadKill"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Union"] = {
		["Parent"] = {
			["Union"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Fishing"] = {
		["Parent"] = {
			["Fishing"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Resort"] = {
		["Parent"] = {
			["Resort"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["YellowJack"] = {
		["Parent"] = {
			["YellowJack"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Blarneys"] = {
		["Parent"] = {
			["Blarneys"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Training"] = {
		["Parent"] = {
			["Training"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Favelas
    ["Favela1"] = {
		["Parent"] = {
			["Favela1"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Favela2"] = {
		["Parent"] = {
			["Favela2"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Favela3"] = {
		["Parent"] = {
			["Favela3"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Favela4"] = {
		["Parent"] = {
			["Favela4"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Favela5"] = {
		["Parent"] = {
			["Favela5"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- ["Sandy"] = {
	-- 	["Parent"] = {
	-- 		["Sandy"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Petroleo"] = {
	-- 	["Parent"] = {
	-- 		["Petroleo"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Praia-1"] = {
	-- 	["Parent"] = {
	-- 		["Praia-1"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Praia-2"] = {
	-- 	["Parent"] = {
	-- 		["Praia-2"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- ["Zancudo"] = {
	-- 	["Parent"] = {
	-- 		["Zancudo"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    -- Mafias
	["Bahamas"] = {
		["Parent"] = {
			["Bahamas"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	-- ["FuriousRecords"] = {
	-- 	["Parent"] = {
	-- 		["FuriousRecords"] = true
	-- 	},
	-- 	["Hierarchy"] = { "Chefe","Gerente","Membro" },
	-- 	["Service"] = {},
	-- 	["Type"] = "Work"
	-- },
    ["Madrazzo"] = {
		["Parent"] = {
			["Madrazzo"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Lake"] = {
		["Parent"] = {
			["Lake"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Route68"] = {
		["Parent"] = {
			["Route68"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Scuba"] = {
		["Parent"] = {
			["Scuba"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Beacon"] = {
		["Parent"] = {
			["Beacon"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Vineyard"] = {
		["Parent"] = {
			["Vineyard"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	}
}