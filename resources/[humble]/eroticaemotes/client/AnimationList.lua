DP = {}

-- EXPRESSIONS --

DP.Expressions = {
}


--- WALKSTYLES ---

DP.Walks = {
}


--- SHARED EMOTES ---

DP.Shared = {

    --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions} --
    -- You don't have to specify targetemotename; If you don't, it will just play the same animation on both.--
    -- targetemote is used for animations that have a corresponding animation to the other player, ie Carry and Be Carried --
    -- Emotes will work with either SyncOffset or Attachto. We can attach players either in front of us, to a specific bone, or either side of us. --
	
	["couple"] = {
        "genesismods@bmv_holdfacem",
        "holdfacem",
        "Holding Face",
        "couple2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.0,
            yPos = 0.40,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
        
    },
    ["couple2"] = {
        "genesismods@bmv_holdfacef",
        "holdfacef",
        "Holding Face",
        "couple",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple3"] = {
        "genesismods@bmv_holdhandsm",
        "holdhandsm",
        "Holding Face",
        "couple4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.0,
            yPos = 0.62,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
        
    },
    ["couple4"] = {
        "genesismods@bmv_holdhandsf",
        "holdhandsf",
        "Holding Face",
        "couple3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple5"] = {
        "genesismods@bmv_hugm",
        "hugm",
        "Holding Face",
        "couple6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.23,
            yPos = 0.15,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
        
    },
    ["couple6"] = {
        "genesismods@bmv_hugf",
        "hugf",
        "Holding Face",
        "couple5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple7"] = {
        "genesismods@bmv_hug2m",
        "hug2m",
        "Holding Face",
        "couple8",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.08,
            yPos = 0.35,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
        
    },
    ["couple8"] = {
        "genesismods@bmv_hug2f",
        "hug2f",
        "Holding Face",
        "couple7",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple9"] = {
        "genesismods@bmv_kissinghandm",
        "kissinghandm",
        "Holding Face",
        "couple10",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.31,
            yPos = 0.40,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
        
    },
    ["couple10"] = {
        "genesismods@bmv_kissinghandf",
        "kissinghandf",
        "Holding Face",
        "couple9",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple11"] = {
        "genesismods@bmv_layingm",
        "layingm",
        "Holding Face",
        "couple12",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = -1.43,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
        
    },
    ["couple12"] = {
        "genesismods@bmv_layingf",
        "layingf",
        "Holding Face",
        "couple11",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple13"] = {
        "genesismods@bmv_starem",
        "starem",
        "Holding Face",
        "couple14",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = -0.06,
            yPos = -0.36,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
        
    },
    ["couple14"] = {
        "genesismods@bmv_staref",
        "staref",
        "Holding Face",
        "couple13",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["couple15"] = {
        "genesismods@bmv_proposalm",
        "proposalm",
        "Holding Face",
        "couple16",
        AnimationOptions = {
            Prop = 'bagdad_alianca', --- Custom prop by ultrahacx
            PropBone = 28422,
            PropPlacement = {
                0.0980,
                0.0350,
               -0.0940,
               -130.6571,
                9.4141,
               -40.3552
            },
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.0,
            yPos = 1.20,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
        
    },
    ["couple16"] = {
        "genesismods@bmv_proposalf",
        "proposalf",
        "Holding Face",
        "couple15",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },

    ["sex"] = {
        "genesismods@erotica_missionarym",
        "missionarym",
        "Missionary Male",
        "sex2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = 0.08,
            yPos = 0.02,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex2"] = {
        "genesismods@erotica_missionaryf",
        "missionaryf",
        "Missionary Female",
        "sex",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    }, 
    ["sex3"] = {
        "genesismods@erotica_missionary2m",
        "missionary2m",
        "Missionary Male 2",
        "sex4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = 0.09,
            yPos = 0.02,
            zPos = 0.02,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex4"] = {
        "genesismods@erotica_missionary2f",
        "missionary2f",
        "Missionary Female 2",
        "sex3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sex5"] = {
        "genesismods@erotica_doggystylem",
        "doggystylem",
        "Doggystyle Male",
        "sex6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = -0.35,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex6"] = {
        "genesismods@erotica_doggystylef",
        "doggystylef",
        "Doggystyle Female",
        "sex5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sex7"] = {
        "genesismods@erotica_doggystyle2m",
        "doggystyle2m",
        "Doggystyle Male 2",
        "sex8",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = -0.39,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex8"] = {
        "genesismods@erotica_doggystyle2f",
        "doggystyle2f",
        "Doggystyle Female 2",
        "sex7",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sex9"] = {
        "genesismods@erotica_cowgirlm",
        "cowgirlm",
        "Cowgirl Male",
        "sex10",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = 0.0,
            yPos = 0.05,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex10"] = {
        "genesismods@erotica_cowgirlf",
        "cowgirlf",
        "Cowgirl Female",
        "sex9",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sex11"] = {
        "genesismods@erotica_spooningm",
        "spooningm",
        "Spooning Male",
        "sex12",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = -0.09,
            yPos = -0.20,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex12"] = {
        "genesismods@erotica_spooningf",
        "spooningf",
        "Spooning Female",
        "sex11",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sex13"] = {
        "genesismods@erotica_standingcowgirlm",
        "standingcowgirlm",
        "Standing Cowgirl Male",
        "sex14",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = -0.30,
            yPos = 0.0,
            zPos = 0.05,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex14"] = {
        "genesismods@erotica_standingcowgirlf",
        "standingcowgirlf",
        "Standing Cowgirl Female",
        "sex13",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            
        }
    },
    ["sex15"] = {
        "genesismods@erotica_standingm",
        "standingm",
        "On The Wall Male",
        "sex16",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --bone = 0,
            xPos = -0.35,
            yPos = 0.02,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["sex16"] = {
        "genesismods@erotica_standingf",
        "standingf",
        "On The Wall Female",
        "sex15",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            
        }
    },
    ["kiss"] = {
        "genesismods_kissme@kissmale",
        "kissmale",
        "Kiss(Male)",
        "kiss2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.52,
            --bone = 0,
            xPos = 0.0,
            yPos = 0.17,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["kiss2"] = {
        "genesismods_kissme@kissfemale",
        "kissfemale",
        "Kiss(Female)",
        "kiss",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.52,
            
        }
    },
    ["kiss3"] = {
        "genesismods_kissme@kissmale2",
        "kissmale2",
        "Kiss 2(Male)",
        "kiss4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.52,
            --bone = 0,
            xPos = 0.0,
            yPos = 0.28,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["kiss4"] = {
        "genesismods_kissme@kissfemale2",
        "kissfemale2",
        "Kiss 2(Female)",
        "kiss3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.52,
            
        }
    },
    ["kiss5"] = {
        "genesismods_kissme@kissmale3",
        "kissmale3",
        "Kiss 2(Male)",
        "kiss6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            bone = 0,
            xPos = 0.0,
            yPos = 0.31,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
    },
    ["kiss6"] = {
        "genesismods_kissme@kissfemale3",
        "kissfemale3",
        "Kiss 3(Female)",
        "kiss5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["kiss7"] = {
        "genesismods_kissme@kissmale4",
        "kissmale4",
        "Kiss 4(Male)",
        "kiss8",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.0,
            bone = 0,
            xPos = 0.0,
            yPos = 0.26,
            zPos = 0.10,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0, 
            
        }
    },
    ["kiss8"] = {
        "genesismods_kissme@kissfemale4",
        "kissfemale4",
        "Kiss 4(Female)",
        "kiss7",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.0,
            
        }
    },
    ["kiss9"] = {
        "genesismods_kissme@kissmale5",
        "kissmale5",
        "Kiss 5(Male)",
        "kiss10",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            bone = 0,
            xPos = 0.0,
            yPos = 0.27,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
    },
    ["kiss10"] = {
        "genesismods_kissme@kissfemale5",
        "kissfemale5",
        "Kiss 5(Female)",
        "kiss9",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["kiss11"] = {
        "genesismods_kissme@kissmale6",
        "kissmale6",
        "Kiss 6(Male)",
        "kiss12",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            bone = 0,
            xPos = 0.0,
            yPos = 0.40,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
            
        }
    },
    ["kiss12"] = {
        "genesismods_kissme@kissfemale6",
        "kissfemale6",
        "Kiss 6(Female)",
        "kiss11",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["kiss13"] = {
        "genesismods_kissme@kissmale7",
        "kissmale7",
        "Kiss 7(Male)",
        "kiss14",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            bone = 0,
            xPos = 0.02,
            yPos = -0.27,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["kiss14"] = {
        "genesismods_kissme@kissfemale7",
        "kissfemale7",
        "Kiss 7(Female)",
        "kiss13",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["kiss15"] = {
        "genesismods_kissme@kissmale8",
        "kissmale8",
        "Kiss 8(Male)",
        "kiss16",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = -0.56,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["kiss16"] = {
        "genesismods_kissme@kissfemale8",
        "kissfemale8",
        "Kiss 8(Female)",
        "kiss15",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["kiss17"] = {
        "genesismods_kissme@kissmale9",
        "kissmale9",
        "Kiss 9(Male)",
        "kiss18",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.35,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["kiss18"] = {
        "genesismods_kissme@kissfemale9",
        "kissfemale9",
        "Kiss 9(Female)",
        "kiss17",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
    ["kiss19"] = {
        "genesismods_kissme@kissmale10",
        "kissmale10",
        "Kiss 10(Male)",
        "kiss20",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            --SyncOffsetFront = 0.05,
            --bone = 0,
            xPos = 0.38,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
            
        }
    },
    ["kiss20"] = {
        "genesismods_kissme@kissfemale10",
        "kissfemale10",
        "Kiss 10(Female)",
        "kiss19",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            --SyncOffsetFront = 0.05,
            
        }
    },
}

--- DANCING EMOTES, SOME WITH PROPS ---

DP.Dances = {
    
}


---- ANIMAL EMOTES ----
----    BIG DOG    ----

DP.AnimalEmotes = {

}


--- EMOTES NO PROPS ---

DP.Emotes = {

}

--- EMOTES WITH 1 OR 2 PROPS ---
DP.PropEmotes = {

}

-- Remove emotes if needed
if Config.AdultEmotesDisabled then
    for _, array in ipairs({
        "Shared",
        "Dances",
        "AnimalEmotes",
        "Emotes",
        "PropEmotes",
    }) do
        for emoteName, emoteData in pairs(DP[array]) do
            if emoteData.AdultAnimation then
                DP[array][emoteName] = nil
            end
        end
    end
end
