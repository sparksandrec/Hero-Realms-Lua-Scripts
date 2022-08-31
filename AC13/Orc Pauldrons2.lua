require 'herorealms'
require 'decks'
require 'stdlib'
require 'stdcards'
require 'hardai'
require 'mediumai'
require 'easyai'

-- Custom magic armor "Orc Pauldrons" This version activates when you have a weapon in hand or in play.
function orc_pauldrons_carddef()
    local cardLayout = createLayout({
        name = "Orc Pauldrons",
        art = "icons/battle_cry",
        frame = "frames/Warrior_CardFrame",
        text = (
            "<size=300%><line-height=0%><voffset=-.8em> <pos=-75%><sprite name=\"requiresHealth_25\"></size><line-height=80%> \n <voffset=1.8em><size=80%> If you have played a weapon this turn \n Draw 1 \n or \n Gain 2 <sprite name=\"health\"> </size>"
            ),
    })

    return createMagicArmorDef({
        id = "orc_pauldrons",
        name = "Orc Pauldrons",
        layout = cardLayout,
        layoutPath = "icons/battle_cry",
        abilities = {
            createAbility({
                id = "orc_pauldrons",
                layout = cardLayout,
                effect = pushChoiceEffect({
                    choices = {
                        {
                            effect = drawCardsEffect(1),
                            layout = layoutCard({
                                title = "Orc Pauldrons",
                                art = "icons/battle_cry",
                                text = ("Draw 1 then discard 1. "),
                            }),
                            tags = { draw1Tag }

                        },
                        {
                            effect = gainHealthEffect(2),
                            layout = layoutCard({
                                title = "Orc Pauldrons",
                                art = "icons/battle_cry",
                                text = ("{2 health}"),
                            }),
                            tags = { gainHealth2Tag }
                        }
                    }
                }),
                trigger = uiTrigger,
                check = selectLoc(currentCastLoc).where(isCardType(weaponType)).count()
                    .gte(1),
                cost = expendCost,
                tags = { draw1Tag, gainHealthTag, gainHealth2Tag },
            })
        }
    })
end

function setupGame(g)
    -- register newly created cards for further use (cards you made like "Orc Pauldrons")
    -- no need to register overridden cards (cards you have modified, but were already in game)
    registerCards(g, {
        orc_pauldrons_carddef()
    })

    standardSetup(g, {
        description = "Orc Pauldrons Armor test", -- script description - displayed in in-game menu
        playerOrder = { plid1, plid2 }, -- order in which players take turns
        ai = createHardAi(), -- sets AI for ai players
        randomOrder = true, -- if true, randomizes players order
        opponents = { { plid1, plid2 } }, -- pairs of opponents
        players = { -- array of players
            {
                id = plid1, -- sets up id for the player. options are plid1, plid2, plid3, plid4
                startDraw = 3, -- sets how many cards player draws at the start of the game. If not set, first player will draw 3, second player - 5
                init = { -- sets how hero get initialized
                    fromEnv = plid1 -- takes hero data from the selection (VS AI or Online)
                },
                cards = { -- cards allows to add any cards to any of hero location at the start of the game
                    buffs = {
                        drawCardsAtTurnEndDef(),
                        discardCardsAtTurnStartDef(),
                        fatigueCount(40, 1, "FatigueP1"),
                    },
                    skills = {
                        orc_pauldrons_carddef(),
                    }
                }
            },
            {
                id = plid2,
                isAi = true,
                startDraw = 5,
                name = "Sackforce",
                avatar = "tentacles",
                health = 50,
                cards = {
                    deck = {
                        { qty = 2, card = tentacle_carddef() },
                        { qty = 2, card = tentacle_whip_carddef() },
                        { qty = 1, card = ruby_carddef() },
                        { qty = 5, card = gold_carddef() },
                    },
                    buffs = {
                        drawCardsAtTurnEndDef(),
                        discardCardsAtTurnStartDef(),
                        fatigueCount(40, 1, "FatigueP2")
                    }
                }
            }
        }
    })
end

function endGame(g) -- more info on this later
end

function setupMeta(meta)
    meta.name = "Orc Pauldrons2"
    meta.minLevel = 0
    meta.maxLevel = 0
    meta.introbackground = ""
    meta.introheader = ""
    meta.introdescription = ""
    meta.path = "C:/Users/timot/HR scripts/Orc Pauldrons2.lua"
    meta.features = {
    }

end
