-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Humble = {}
Tunnel.bindInterface("doors",Humble)
vTASKBAR = Tunnel.getInterface("taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Doors"] = {
	-- Police-1
	[1] = { x = 537.57, y = -31.79, z = 70.65, hash = -190780785, lock = true, text = true, distance = 5, press = 2, perm = "Police" },
	[2] = { x = 533.15, y = -34.52, z = 70.63, hash = -190780785, lock = true, text = true, distance = 5, press = 2, perm = "Police" },
	[3] = { x = 626.11, y = 7.59, z = 82.63, hash = -1821777087, lock = true, text = true, distance = 5, press = 2, perm = "Police" },
	[4] = { x = 625.72, y = 6.4, z = 82.63, hash = -1821777087, lock = true, text = true, distance = 5, press = 2, perm = "Police" },
	[5] = { x = -925.98, y = -2035.20, z = 9.6, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police", other = 32 },
	[6] = { x = -926.82, y = -2034.42, z = 9.6, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police", other = 31 },
	[7] = { x = -953.81, y = -2044.32, z = 9.7, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police" },
	[8] = { x = -954.02, y = -2058.36, z = 9.6, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police", other = 35 },
	[9] = { x = -954.78, y = -2057.61, z = 9.6, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police", other = 34 },
	[10] = { x = -912.94, y = -2033.33, z = 9.6, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police", other = 37 },
	[11] = { x = -913.69, y = -2032.55, z = 9.6, hash = 1307986194, lock = true, text = true, distance = 5, press = 2, perm = "Police", other = 36 },
	-- Police-2
	[12] = { x = 399.02, y = -1608.85, z = 29.28, hash = 1286535678, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[13] = { x = 392.55, y = -1635.4, z = 29.28, hash = -1156020871, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[14] = { x = 370.83, y = -1615.45, z = 30.04, hash = 1670919150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[15] = { x = 369.97, y = -1614.67, z = 30.04, hash = 618295057, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[16] = { x = 380.35, y = -1593.23, z = 30.04, hash = 1670919150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[17] = { x = 381.12, y = -1593.89, z = 30.04, hash = 618295057, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[18] = { x = 375.01, y = -1613.16, z = 30.04, hash = -1335406364, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[19] = { x = 383.97, y = -1602.44, z = 30.04, hash = -1335406364, lock = true, text = true, distance = 10, press = 2, perm = "Police" },

	[20] = { x = 369.62, y = -1606.16, z = 30.04, hash = -674638964, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[21] = { x = 367.69, y = -1604.51, z = 30.04, hash = -674638964, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[22] = { x = 374.52, y = -1597.89, z = 25.44, hash = -674638964, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[23] = { x = 376.48, y = -1599.46, z = 25.44, hash = -674638964, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	-- Police-3
	[24] = { x = 1846.049, y = 2604.733, z = 45.579, hash = 741314661, lock = true, text = true, distance = 30, press = 10, perm = "Emergency" },
	[25] = { x = 1819.475, y = 2604.743, z = 45.577, hash = 741314661, lock = true, text = true, distance = 30, press = 10, perm = "Emergency" },
	[26] = { x = 1836.71, y = 2590.32, z = 46.20, hash = 539686410, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[27] = { x = 1769.52, y = 2498.92, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[28] = { x = 1766.34, y = 2497.09, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[29] = { x = 1763.20, y = 2495.26, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[30] = { x = 1756.89, y = 2491.66, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[31] = { x = 1753.75, y = 2489.85, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[32] = { x = 1750.61, y = 2488.02, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[33] = { x = 1757.14, y = 2474.87, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[34] = { x = 1760.26, y = 2476.71, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[35] = { x = 1763.44, y = 2478.50, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[36] = { x = 1766.54, y = 2480.33, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[37] = { x = 1769.73, y = 2482.13, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[38] = { x = 1772.83, y = 2483.97, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[39] = { x = 1776.00, y = 2485.77, z = 46.00, hash = 913760512, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	-- Police-4
	[40] = { x = 1849.02, y = 3693.30, z = 34.37, hash = -1491332605, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[41] = { x = 1851.94, y = 3694.98, z = 34.37, hash = -1491332605, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[42] = { x = 1856.33, y = 3696.54, z = 34.37, hash = -1491332605, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[43] = { x = 1853.76, y = 3699.85, z = 34.37, hash = -2002725619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[44] = { x = 1847.24, y = 3688.46, z = 34.37, hash = -2002725619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	-- Police-5
	[45] = { x = -444.45, y = 6007.71, z = 27.75, hash = -594854737, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[46] = { x = -442.98, y = 6011.80, z = 27.75, hash = -594854737, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[47] = { x = -445.12, y = 6012.14, z = 27.75, hash = -594854737, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[48] = { x = -448.08, y = 6015.12, z = 27.75, hash = -594854737, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[49] = { x = -445.60, y = 6017.56, z = 27.75, hash = -594854737, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[50] = { x = -442.63, y = 6014.60, z = 27.75, hash = -594854737, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[51] = { x = 828.11, y = -1290.69, z = 28.24, hash = -34368499, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[52] = { x = 828.15, y = -1289.53, z = 28.24, hash = 277920071, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	-- Ottos
	[53] = { x = 823.63, y = -993.07, z = 26.47, hash = -1858735571, lock = true, text = true, distance = 10, press = 2, perm = "Ottos" },
	[54] = { x = 803.87, y = -988.24, z = 26.35, hash = 1833539318, lock = true, text = true, distance = 10, press = 2, perm = "Ottos" },
	-- Dk
	[55] = { x = -347.22, y = -142.6, z = 39.06, hash = -626684119, lock = true, text = true, distance = 10, press = 2, perm = "Dk" },
	[56] = { x = -334.37, y = -146.22, z = 39.06, hash = -626684119, lock = true, text = true, distance = 10, press = 2, perm = "Dk" },
	[57] = { x = -345.81, y = -142.94, z = 45.8, hash = -2051651622, lock = true, text = true, distance = 10, press = 2, perm = "Dk" },
	[58] = { x = -334.53, y = -146.25, z = 45.8, hash = -2051651622, lock = true, text = true, distance = 10, press = 2, perm = "Dk" },
	-- Chiliad
	[59] = { x = 2196.82, y = 5570.79, z = 53.9, hash = 819505495, lock = true, text = true, distance = 10, press = 2, perm = "Chiliad" },
	-- Families
	[60] = { x = -151.55, y = -1622.2, z = 33.65, hash = 1381046002, lock = true, text = true, distance = 10, press = 2, perm = "Families" },
	-- Highways
	[61] = { x = 1431.64, y = 6338.15, z = 23.86, hash = 1471868433, lock = true, text = true, distance = 10, press = 2, perm = "Highways" },
	-- Vagos
	[62] = { x = 325.11, y = -1990.69, z = 24.2, hash = 2118614536, lock = true, text = true, distance = 10, press = 2, perm = "Vagos" },
	[63] = { x = 336.45, y = -1992.27, z = 24.2, hash = 2118614536, lock = true, text = true, distance = 10, press = 2, perm = "Vagos" },
	-- Madrazzo
	[64] = { x = 1390.46, y = 1162.32, z = 114.33, hash = -52575179, lock = true, text = true, distance = 10, press = 2, perm = "Madrazzo", other = 55 },
	[65] = { x = 1390.46, y = 1162.32, z = 114.33, hash = -1032171637, lock = true, text = true, distance = 10, press = 2, perm = "Madrazzo", other = 54 },
	[66] = { x = 1406.95, y = 1128.27, z = 114.33, hash = 262671971, lock = true, text = true, distance = 10, press = 2, perm = "Madrazzo" },
	-- Playboy¹
	[67] = { x = -1470.84, y = 68.46, z = 53.3, hash = -2125423493, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	-- TheSouth
	[68] = { x = 982.29, y = -125.23, z = 74.05, hash = -930593859, lock = true, text = true, distance = 10, press = 2, perm = "TheSouth" },
	[69] = { x = 959.98, y = -140.16, z = 74.49, hash = -197537718, lock = true, text = true, distance = 10, press = 2, perm = "TheSouth" },
	[70] = { x = 981.62, y = -102.6, z = 74.85, hash = 190770132, lock = true, text = true, distance = 10, press = 2, perm = "TheSouth" },
	-- Vineyard
	[71] = { x = -1864.15, y = 2060.52, z = 141.13, hash = -1141522158, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 62 },
	[72] = { x = 1390.46, y = 1162.32, z = 114.33, hash = 988364535, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	-- GasStation
	[73] = { x = -2564.84, y = 2307.22, z = 33.21, hash = 1742849246, lock = true, text = true, distance = 10, press = 2, perm = "GasStation", other = 61 },
	-- Hookies
	[74] = { x = -2174.47, y = 4282.57, z = 49.29, hash = 1742849246, lock = true, text = true, distance = 10, press = 2, perm = "Hookies", other = 61 },
	-- RoadKill
	[75] = { x = 149.58, y = 6362.87, z = 31.54, hash = 1742849246, lock = true, text = true, distance = 10, press = 2, perm = "RoadKill", other = 61 },
	-- Union
	[76] = { x = 2898.37, y = 4422.02, z = 48.61, hash = 1742849246, lock = true, text = true, distance = 10, press = 2, perm = "Union", other = 61 },
	-- Fishing
	[77] = { x = 1534.48, y = 3789.53, z = 34.44, hash = 768328516, lock = true, text = true, distance = 10, press = 2, perm = "Fishing", other = 61 },
	-- Resort
	[78] = { x = -3031.79, y = 91.89, z = 12.35, hash = 1742849246, lock = true, text = true, distance = 10, press = 2, perm = "Resort", other = 61 },
	-- YellowJack
	[79] = { x = 1980.84, y = 3050.14, z = 50.52, hash = -547305886, lock = true, text = true, distance = 10, press = 2, perm = "YellowJack", other = 61 },
	[80] = { x = 1996.95, y = 3044.97, z = 47.21, hash = -1875254669, lock = true, text = true, distance = 10, press = 2, perm = "YellowJack", other = 61 },
	-- Blarneys
	[81] = { x = 1942.07, y = 3842.48, z = 35.52, hash = -1590213865, lock = true, text = true, distance = 10, press = 2, perm = "Blarneys", other = 61 },
	[82] = { x = 1951.68, y = 3825.2, z = 32.22, hash = 2052948894, lock = true, text = true, distance = 10, press = 2, perm = "Blarneys", other = 61 },
	[83] = { x = 1953.64, y = 3829.2, z = 32.08, hash = 1271523342, lock = true, text = true, distance = 10, press = 2, perm = "Blarneys", other = 61 },
	-- Training
	[84] = { x = 2704.04, y = 3457.77, z = 55.52, hash = -963469101, lock = true, text = true, distance = 10, press = 2, perm = "Training", other = 61 },
	[85] = { x = 2718.56, y = 3491.0, z = 55.62, hash = -583307789, lock = true, text = true, distance = 10, press = 2, perm = "Training", other = 61 },
	[86] = { x = 2573.35, y = 3903.14, z = 40.94, hash = -1799173151, lock = true, text = true, distance = 10, press = 2, perm = "Training", other = 61 },
	-- Humble¹
	[87] = { x = -1378.27, y = -621.81, z = 30.31, hash = -2102541881, lock = true, text = true, distance = 10, press = 2, perm = "Humble", other = 61 },
	[88] = { x = 1378.2, y = -625.38, z = 30.31, hash = -2102541881, lock = true, text = true, distance = 10, press = 2, perm = "Humble", other = 61 },
	-- BackpackSell
	[89] = { x = 718.62, y = -975.41, z = 24.9, hash = -681066206, lock = true, text = true, distance = 10, press = 2, perm = "BackpackSell", other = 61 },
	[90] = { x = 717.51, y = -975.29, z = 24.9, hash = 245182344, lock = true, text = true, distance = 10, press = 2, perm = "BackpackSell", other = 61 },
	-- Humble²
	[91] = { x = -1388.53, y = -587.61, z = 30.33, hash = 666905606, lock = true, text = true, distance = 10, press = 2, perm = "Humble", other = 61 },
	[92] = { x = -1387.59, y = -586.98, z = 30.31, hash = -224738884, lock = true, text = true, distance = 10, press = 2, perm = "Humble", other = 61 },
	[93] = { x = -1391.45, y = -593.15, z = 30.31, hash = 134859901, lock = true, text = true, distance = 10, press = 2, perm = "Humble", other = 61 },
	[94] = { x = -1390.87, y = -594.25, z = 30.31, hash = 134859901, lock = true, text = true, distance = 10, press = 2, perm = "Humble", other = 61 },
	-- FuriousRecords
	[95] = { x = -1015.85, y = -266.53, z = 39.04, hash = 662746527, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[96] = { x = -1015.35, y = -265.66, z = 39.04, hash = 10590885, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[97] = { x = -977.82, y = -264.19, z = 38.47, hash = 363383944, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[98] = { x = -992.67, y = -280.95, z = 38.2, hash = -1719935594, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[99] = { x = -998.88, y = -268.91, z = 39.04, hash = -1693304723, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[100] = { x = -999.61, y = -269.68, z = 39.04, hash = -1930160225, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[101] = { x = -1004.9, y = -263.05, z = 39.04, hash = -1650276170, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[102] = { x = -1005.7, y = -262.32, z = 39.04, hash = -1650276170, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[103] = { x = -996.22, y = -261.99, z = 39.04, hash = -1650276170, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	[104] = { x = -996.81, y = -262.73, z = 39.04, hash = -1650276170, lock = true, text = true, distance = 10, press = 2, perm = "FuriousRecords", other = 61 },
	-- Vineyard²
	[105] = { x = -1874.4, y = 2069.65, z = 141.0, hash = 1077118233, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[106] = { x = -1886.14, y = 2073.82, z = 141.0, hash = 1077118233, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[107] = { x = -1893.83, y = 2075.07, z = 141.0, hash = 1077118233, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[108] = { x = -1899.53, y = 2083.55, z = 140.41, hash = 1843224684, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[109] = { x = -1901.94, y = 2085.67, z = 140.39, hash = 1843224684, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[110] = { x = -1906.7, y = 2084.6, z = 140.41, hash = 1843224684, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[111] = { x = -1910.9, y = 2079.67, z = 140.39, hash = 1843224684, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[112] = { x = -1911.09, y = 2074.83, z = 140.41, hash = 1843224684, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[113] = { x = -1908.61, y = 2072.8, z = 140.41, hash = 1843224684, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[114] = { x = -1889.09, y = 2051.89, z = 141.0, hash = 1077118233, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	[115] = { x = -1886.43, y = 2050.87, z = 141.0, hash = 1077118233, lock = true, text = true, distance = 10, press = 2, perm = "Vineyard", other = 61 },
	-- Paramedic
	[116] = { x = -1845.65, y = -347.93, z = 49.44, hash = 2047627247, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 61 },
	[117] = { x = -1846.35, y = -348.77, z = 49.44, hash = 667560812, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 61 },
	-- Comanf
	[118] = { x = 3722.4, y = 1765.94, z = 6.15, hash = 725274945, lock = true, text = true, distance = 10, press = 2, perm = "Comanf", other = 61 },
	[119] = { x = 3722.27, y = 1773.37, z = 6.15, hash = 725274945, lock = true, text = true, distance = 10, press = 2, perm = "Comanf", other = 61 },
	-- OAB
	[120] = { x = 535.04, y = -189.34, z = 43.35, hash = 1762042010, lock = true, text = true, distance = 10, press = 2, perm = "Comanf", other = 61 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.doorsStatistics(doorNumber,doorStatus)
	local Doors = GlobalState["Doors"]

	Doors[doorNumber]["lock"] = doorStatus

	if Doors[doorNumber]["other"] ~= nil then
		local doorSecond = Doors[doorNumber]["other"]
		Doors[doorSecond]["lock"] = doorStatus
	end

	GlobalState["Doors"] = Doors
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.doorsPermission(doorNumber)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if GlobalState["Doors"][doorNumber]["perm"] ~= nil then
			if vRP.HasGroup(Passport,GlobalState["Doors"][doorNumber]["perm"]) then
				return true
			else
				local consultItem = vRP.InventoryItemAmount(Passport,"lockpick")
				if consultItem[1] >= 1 then
					Brokenpick = 900
					if math.random(1000) >= Brokenpick then
							if vRP.TakeItem(Passport,consultItem[2],1,false) then
								vRP.GiveItem(Passport,"lockpick2-0",1,false)
								TriggerClientEvent("itensNotify", source, { "quebrou", "lockpick", 1, "Lockpick de Alumínio" })
							end
						end

					local taskResult = vTASKBAR.TaskDoors(source,3,20000)
					if taskResult then
						return true
					end
				end
			end
		end
	end
	return false
end