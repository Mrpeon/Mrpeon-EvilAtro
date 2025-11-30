G.joker_evil_chance = 1

-- Registrar el atlas
SMODS.Atlas{
    key = 'EvilJokersatlas',
    path = 'EvilJokersatlas.png', -- tu archivo en assets
    px = 71,  -- ancho de cada carta
    py = 95   -- alto de cada carta
}

-- jokers.lua

SMODS.Joker{
    key = 'm_evil_jimbo_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 0},  
    rarity = 1, 
    cost = 2, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 4 }, },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = -card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_jimbo_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_jimbo_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_greedy_joker_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 1},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { s_mult = 3, suit = 'Diamonds' }, },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = -card.ability.extra.s_mult
            }
        end
    end,

    -- Esto evita que aparezca naturalmente en tiendas o spawns aleatorios
    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("greedy_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_greedy_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_greedy_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_lusty_joker_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 1},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { s_mult = 3, suit = 'Hearts' }, },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = -card.ability.extra.s_mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural
    end,
}

SMODS.Joker:take_ownership("lusty_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_lusty_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_lusty_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_wrathful_joker_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 1},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { s_mult = 3, suit = 'Spades' }, },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = -card.ability.extra.s_mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural
    end,
}

SMODS.Joker:take_ownership("wrathful_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_wrathful_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_wrathful_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_gluttenous_joker_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 1},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { s_mult = 3, suit = 'Clubs' }, },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                mult = -card.ability.extra.s_mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural
    end,
}

SMODS.Joker:take_ownership("gluttenous_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_gluttenous_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_gluttenous_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_jolly_joker_m', 
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 0},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Pair"]) 
            or next(context.poker_hands["Two Pair"]) 
            or next(context.poker_hands["Three of a Kind"]) 
            or next(context.poker_hands["Full House"]) 
            or next(context.poker_hands["Four of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Five of a Kind"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    mult = -8,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("jolly", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_jolly_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_jolly_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_zany_joker_m',  ---12 multi si la mano contiene tercia
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 0},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then 
            if next(context.poker_hands["Three of a Kind"]) 
            or next(context.poker_hands["Full House"]) 
            or next(context.poker_hands["Four of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Five of a Kind"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    mult = -12,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("zany", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_zany_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_zany_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_mad_joker_m',  -- -10 mult si la mano contiene doble par
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 0},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Two Pair"])  
            or next(context.poker_hands["Full House"]) 
            or next(context.poker_hands["Four of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Five of a Kind"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    mult = -10,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("mad", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_mad_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_mad_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_crazy_joker_m',  -- -12 de mult si la mano contiene una escalera
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 0},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Straight"]) 
            or next(context.poker_hands["Straight Flush"]) then
                return {
                    mult = -12,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("crazy", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_crazy_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_crazy_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_droll_joker_m',  -- -10 mult si la mano contiene un color
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 0},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Flush"]) 
            or next(context.poker_hands["Straight Flush"])
            or next(context.poker_hands["Five of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    mult = -10,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("droll", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_droll_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_droll_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_sly_joker_m',  -- -50 fichas si la mano contiene un par
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 14},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Pair"]) 
            or next(context.poker_hands["Two Pair"]) 
            or next(context.poker_hands["Three of a Kind"]) 
            or next(context.poker_hands["Full House"]) 
            or next(context.poker_hands["Four of a Kind"]) 
            or next(context.poker_hands["Five of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    chips = -50,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("sly", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_sly_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_sly_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_wily_joker_m',  -- -100 fichas si la mano contiene tercia
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 14},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Three of a Kind"]) 
            or next(context.poker_hands["Full House"]) 
            or next(context.poker_hands["Four of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Five of a Kind"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    chips = -100,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("wily", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_wily_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_wily_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_clever_joker_m',  -- -80 fichas si la mano contiene doble par
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 14},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then 
            if next(context.poker_hands["Two Pair"]) 
            or next(context.poker_hands["Three of a Kind"]) 
            or next(context.poker_hands["Full House"]) 
            or next(context.poker_hands["Four of a Kind"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Five of a Kind"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    chips = -80,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("clever", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_clever_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_clever_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_devious_joker_m',  -- -100 fichas si la mano contiene escalera
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 14},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Straight"]) 
            or next(context.poker_hands["Straight Flush"]) then
                return {
                    chips = -100,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("devious", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_devious_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_devious_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_crafty_joker_m',  -- -80 fichas si la mano contiene color
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 14},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if next(context.poker_hands["Flush"]) 
            or next(context.poker_hands["Straight Flush"])
            or next(context.poker_hands["Flush Five"]) 
            or next(context.poker_hands["Five of a Kind"]) 
            or next(context.poker_hands["Flush House"]) then
                return {
                    chips = -80,
                    colour = G.C.CHIPS
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("crafty", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_crafty_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_crafty_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_half_joker_m',  -- -20 mult si la mano jugada tiene 3 cartas o menos
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 0},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pixel_size = { h = 95 / 1.7 },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main 
        and context.cardarea == G.jokers 
        and context.full_hand 
        and #context.full_hand >= 3 then
            return {
                mult = -20,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("half", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_half_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_half_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_joker_stencil_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 5},
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)   
        card.ability.extra = card.ability.extra or { divisor = 1 }
        card.localization_key = "j_m_evil_joker_stencil_m"
    end,

    -- 🔹 update se llama cada frame
    update = function(self, card, dt)
        if not G or not G.jokers or not G.jokers.cards then return end

        local occupied = 0
        for _, j in ipairs(G.jokers.cards) do
            -- No contar a sí mismo ni a otros Jokers del mismo tipo
            if j ~= card and j.config.center.key ~= self.key then
                occupied = occupied + 1
            end
        end

        card.ability.extra.divisor = math.max(1, occupied)
    end,

    calculate = function(self, card, context)
        -- aplicar divisor en la fase principal
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                card = card,
                colour = G.C.MULT,
                remove_default_message = true
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        local ex = card.ability.extra or { divisor = 1 }
        local divisor = ex.divisor or 1

        return {
            vars = {
                divisor,
                colours = { G.C.UI.TEXT_INACTIVE }
            },
            key = self.key
        }
    end,

    -- Evita spawn natural
    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("stencil", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_joker_stencil_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_joker_stencil_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_four_fingers_m',  
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 6},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        -- este comodín siempre será eterno
        card:set_eternal(true)
    end,

    calculate = function(self, blind, context)
        -- Ignora si está deshabilitada: siempre ejecuta
        if context.debuff_hand then
            -- Solo debuffea si la mano es una Escalera (Straight)
            if context.scoring_name == "Straight" or context.scoring_name == "Flush" then
                blind.triggered = true
                return {
                    debuff = true
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("four_fingers", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_four_fingers_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_four_fingers_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_mime_m",  -- deshabilita los efectos de las cartas en la mano
    atlas = "EvilJokersatlas",
    pos = {x = 4, y = 1},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,
    -- update: detecta transformaciones en plena ciega y mantiene el debuff hasta end_of_round
    update = function(self, card, dt)
        if not card.added_to_deck then return end

        self._debuffed_cards = self._debuffed_cards or {}
        self._msg_cooldown = (self._msg_cooldown or 0) - (dt or 0)
        if self._msg_cooldown < 0 then self._msg_cooldown = 0 end

        local function is_target(v)
            if not v or not v.ability then return false end
            local a = v.ability
            local s = tostring(a.name or a.key or a.id or ""):lower()
            return (s:find("gold") ~= nil) or (s:find("steel") ~= nil)
        end

        local new_debuff_count = 0
        local areas = { G.hand, G.deck, G.discard }

        -- Recorremos todas las cartas visibles y:
        --  * si es target y NO estaba trackeada -> la debuffeamos y la trackeamos (nuevo)
        --  * si ya estaba trackeada -> re-aplicamos set_debuff(true) para impedir que la reactiven
        for _, area in ipairs(areas) do
            if area and area.cards then
                for _, v in pairs(area.cards) do
                    if self._debuffed_cards[v] then
                        -- ya la habíamos marcado: reafirmar el debuff (sin mensaje)
                        v:set_debuff(true)
                    else
                        -- si es target ahora, la marcamos y mostramos mensaje (pero solo 1 vez por aparición)
                        if is_target(v) then
                            v:set_debuff(true)
                            self._debuffed_cards[v] = true
                            new_debuff_count = new_debuff_count + 1
                        end
                    end
                end
            end
        end

        -- Si encontramos nuevas cartas para debuffear, mostramos un único mensaje sobre el JOKER
        if new_debuff_count > 0 and self._msg_cooldown == 0 then
            card_eval_status_text(card, "extra", nil, nil, nil, { message = "Deshabilitado", colour = G.C.RED })
            self._msg_cooldown = 0.4
        end
    end,

    -- calculate: aplicamos al inicio de la ciega (punto único) y reseteamos al final de ronda
    calculate = function(self, card, context)
        -- reset al final de la ronda para permitir reaplicación en la siguiente ronda
        if context and context.end_of_round then
            self._debuffed_cards = {}
            self._msg_cooldown = 0
            return
        end

        -- al inicio de la ciega, aplicamos de inmediato y marcamos las cartas para mantenerlas deshabilitadas
        if context and context.setting_blind and card.added_to_deck then
            self._debuffed_cards = self._debuffed_cards or {}
            local function is_target(v)
                if not v or not v.ability then return false end
                local a = v.ability
                local s = tostring(a.name or a.key or a.id or ""):lower()
                return (s:find("gold") ~= nil) or (s:find("steel") ~= nil)
            end
            local found = false
            local areas = { G.hand, G.deck, G.discard }
            for _, area in ipairs(areas) do
                if area and area.cards then
                    for _, v in pairs(area.cards) do
                        if is_target(v) and not self._debuffed_cards[v] then
                            v:set_debuff(true)
                            self._debuffed_cards[v] = true
                            found = true
                        end
                    end
                end
            end
            if found then
                return {
                    message = "Deshabilitado",
                    card = card,
                    colour = G.C.FILTER,
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("mime", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_mime_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_mime_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_credit_card_m',  -- +20 soles al comprarlo
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 1},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,
    -- Este evento se llama al añadirlo al mazo (cuando lo compras)
    add_to_deck = function(self, card)
        -- Dar 20 monedas
        ease_dollars(20)

        -- Mostrar un mensajito en el Joker
        card_eval_status_text(card, "extra", nil, nil, nil, {
            message = "+20",
            colour = G.C.MONEY
        })
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("credit_card", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_credit_card_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_credit_card_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_ceremonial_dagger_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 5},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = -0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.localization_key = "j_m_evil_ceremonial_dagger_m"
        -- asegurar mult inicial
        if not card.ability.extra then card.ability.extra = {} end
        card.ability.extra.mult = card.ability.extra.mult or 0
    end,

    loc_vars = function(self, info_queue, card)
        local multi = (card.ability.extra and card.ability.extra.mult) or 0
        return {
            vars = {
                multi,
                colours = { G.C.UI.TEXT_INACTIVE } -- para {V:1}
            }
        }
    end,

    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos - 1]
                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        -- See note about SMODS Scaling Manipulation on the wiki
                        card.ability.extra.mult = card.ability.extra.mult - sliced_card.sell_cost / 2
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult + sliced_card.sell_cost / 2 } },
                    colour = G.C.RED,
                    no_juice = true
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("ceremonial", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_ceremonial_dagger_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_ceremonial_dagger_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_banner_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 2},
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Solo se activa en la fase de puntaje del Joker
        if context.joker_main then
            local hands_left = math.max(0, (G.GAME.round_resets.hands or 0) - (G.GAME.hands_played or 0))
            local penalty = hands_left * 30

            if penalty > 0 then
                return {
                    chips = -penalty, -- 🔹 resta fichas en lugar de mult
                    card = card
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("banner", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_banner_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_banner_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_mystic_summit_m",
    atlas = "EvilJokersatlas",
    pos = { x = 2, y = 2 },
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = -15, d_remaining = 0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.d_remaining } }
    end,

    calculate = function(self, card, context)
        -- durante la fase principal del comodín
        if context.joker_main and G and G.GAME and G.GAME.current_round then
            if G.GAME.current_round.discards_left > (card.ability.extra.d_remaining or 0) then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("mystic_summit", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_mystic_summit_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_mystic_summit_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_marble_m",
    atlas = "EvilJokersatlas",
    pos = { x = 3, y = 2 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            if G and G.deck and #G.deck.cards > 0 then
                -- 🔹 Filtrar cartas que NO sean piedra
                local candidates = {}
                for _, c in ipairs(G.deck.cards) do
                    if not c.config or c.config.center ~= G.P_CENTERS.m_stone then
                        table.insert(candidates, c)
                    end
                end

                if #candidates > 0 then
                    local chosen = pseudorandom_element(candidates, pseudoseed("evil_marble"))
                    if chosen then
                        -- ✅ convertir de forma segura
                        chosen:set_ability(G.P_CENTERS.m_stone, nil, true)

                        return {
                            message = "Carta convertida en Piedra",
                            colour = G.C.SECONDARY_SET.Enhanced,
                            card = chosen
                        }
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("marble", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_marble_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_marble_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_loyalty_card_m",
    atlas = "EvilJokersatlas",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 4, y = 2 },
    config = { extra = { Xmult = 4, every = 5, loyalty_remaining = 5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.every + 1,
                localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.loyalty_remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                (card.ability.extra.every + 1)
            if not context.blueprint then
                if card.ability.extra.loyalty_remaining == 0 then
                    local eval = function(card) return card.ability.extra.loyalty_remaining == 0 and not G.RESET_JIGGLES end
                    juice_card_until(card, eval, true)
                end
            end
            if card.ability.extra.loyalty_remaining == card.ability.extra.every then
                return {
                    Xmult_mod = 1 / card.ability.extra.Xmult,
                    message = "÷" .. card.ability.extra.Xmult,
                    card = card, -- mostrar mensaje ligado al comodín (opcional)
                    colour = G.C.MULT,
                    remove_default_message = true
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("loyalty_card", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_loyalty_card_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_loyalty_card_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_8_ball_m",
    atlas = "EvilJokersatlas",
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 0, y = 5 },
    config = { extra = { odds = 4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'm_evil_8_ball_m')
        return { vars = { numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            -- Solo activarse si la carta es 8
            if context.other_card:get_id() == 8 and
                SMODS.pseudorandom_probability(card, 'm_evil_8_ball_m', 1, card.ability.extra.odds) then

                -- Evitar cartas con debuff
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    -- Evento para destruir un consumible aleatorio
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if not G.consumeables or #G.consumeables.cards == 0 then return true end

                            local consumables = G.consumeables.cards
                            local chosen = pseudorandom_element(consumables, 'm_evil_8_ball_m')
                            if chosen then
                                chosen:start_dissolve(nil, true) -- lo elimina visual y lógicamente
                            end
                            return true
                        end
                    }))

                    return {
                        message = "Consumible destruido",
                        colour = G.C.RED
                    }
                end
            end
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("8_ball", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_8_ball_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_8_ball_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_misprint_m",
    atlas = "EvilJokersatlas",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 6, y = 2 },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    config = { extra = { max = 23, min = 0 } },

    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
        local loc_mult = ' ' .. (localize('k_mult')) .. ' '
        main_start = {
            { n = G.UIT.T, config = { text = '  -', colour = G.C.MULT, scale = 0.32 } },
            { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = 'rand()', colour = G.C.JOKER_GREY },
                            { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)
                                .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'),
                                colour = G.C.RED },
                            loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
                            loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult
                        },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local neg_mult = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
            return {
                mult = -neg_mult
            }
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("misprint", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_misprint_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_misprint_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = 'm_evil_dusk_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 7},
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Solo activa el efecto en la última mano de la ronda
        if context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
            -- Itera todas las cartas jugadas y las debuffea
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card.set_debuff then
                    played_card:set_debuff(true)
                end
            end

            -- Opcional: texto de estado visual para indicar que se activó
            card_eval_status_text(card, "extra", nil, nil, nil, {
                message = localize("j_m_evil_dusk_m_message"),
                colour = G.C.RED
            })
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("dusk", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_dusk_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_dusk_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = 'm_evil_raised_fist_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 2},
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Solo aplica durante jugadas individuales mientras haya cartas en mano
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local highest_card = nil
            local highest_nominal = -1

            -- buscar la carta más alta
            for _, hand_card in ipairs(G.hand.cards) do
                if not SMODS.has_no_rank(hand_card) and hand_card.base.nominal > highest_nominal then
                    highest_nominal = hand_card.base.nominal
                    highest_card = hand_card
                end
            end

            -- si hay una carta válida y coincide con la carta actual
            if highest_card and context.other_card == highest_card then
                if highest_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    -- resta la mitad del valor nominal a multiplicador
                    return {
                        mult = -(math.floor(highest_nominal / 2)),
                        colour = G.C.MULT
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("raised_fist", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_raised_fist_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_raised_fist_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

-- Definir la variable global en algún lugar antes de crear el joker
G.EVIL_CHAOS_BASE_PENALTY = 5  -- valor inicial del penalty

SMODS.Joker {
    key = "m_evil_chaos_the_clown_m",
    atlas = "EvilJokersatlas",
    pos = { x = 1, y = 0 },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -- eliminamos config.extra.penalty ya que ahora usamos la global

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.penalty } }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        -- Copiamos el valor inicial de la global
        card.ability.extra = { penalty = G.EVIL_CHAOS_BASE_PENALTY }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and context.cardarea == G.jokers then
            local penalty = card.ability.extra.penalty or G.EVIL_CHAOS_BASE_PENALTY

            local ret = {
                message = "-$" .. tostring(penalty),
                colour = G.C.RED
            }

            ease_dollars(-penalty)

            -- Incrementamos para el siguiente reroll
            card.ability.extra.penalty = penalty + 1

            return ret
        end

        if context.ending_shop and context.cardarea == G.jokers then
            -- Reiniciamos al valor inicial de la global
            card.ability.extra.penalty = G.EVIL_CHAOS_BASE_PENALTY
        end
    end,

    in_pool = function(self)
        return false
    end,
}

SMODS.Joker:take_ownership("chaos", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_chaos_the_clown_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_chaos_the_clown_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

-- Tomamos ownership del voucher Reroll Surplus
SMODS.Voucher:take_ownership("reroll_surplus", {
    cost = 10,
    
    -- Mantener la tabla extra con deduction
    config = { extra = { deduction = 2 } },

    -- Función de redeem combinada
    redeem = function(self, card)
        -- Efecto original del voucher
        G.E_MANAGER:add_event(Event({
            func = function()
                local deduction = 2
                if type(card.ability.extra) == "table" and card.ability.extra.deduction then
                    deduction = card.ability.extra.deduction
                end

                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - deduction
                G.GAME.current_round.reroll_cost = math.max(0,
                    G.GAME.current_round.reroll_cost - deduction)
                return true
            end
        }))

        -- Reducimos la variable global del joker
        G.EVIL_CHAOS_BASE_PENALTY = math.max(0, (G.EVIL_CHAOS_BASE_PENALTY or 5) - 2)
    end,

    -- Mantener loc_vars como el original, pero seguro
    loc_vars = function(self, info_queue, card)
        local deduction = 2
        if type(card.ability.extra) == "table" and card.ability.extra.deduction then
            deduction = card.ability.extra.deduction
        end
        return { vars = { deduction } }
    end,

}, true)

-- Tomamos ownership del voucher Reroll Glut
SMODS.Voucher:take_ownership("reroll_glut", {
    cost = 10,
    config = { extra = { deduction = 2 } },
    unlocked = false,
    requires = { 'reroll_surplus' },

    -- Función de redeem combinada: efecto original + cambio de variable global
    redeem = function(self, card)
        local deduction = 2
        if type(card.ability.extra) == "table" and card.ability.extra.deduction then
            deduction = card.ability.extra.deduction
        end

        -- Efecto original del voucher
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - deduction
                G.GAME.current_round.reroll_cost = math.max(0,
                    G.GAME.current_round.reroll_cost - deduction)
                return true
            end
        }))

        -- Reducimos la variable global del joker en 2
        G.EVIL_CHAOS_BASE_PENALTY = math.max(0, (G.EVIL_CHAOS_BASE_PENALTY or 3) - 2)
    end,

    -- Mantener loc_vars como el original, seguro
    loc_vars = function(self, info_queue, card)
        local deduction = 2
        if type(card.ability.extra) == "table" and card.ability.extra.deduction then
            deduction = card.ability.extra.deduction
        end
        return { vars = { deduction } }
    end,

    -- Propiedades de desbloqueo
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { 100, G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'c_shop_rerolls' and G.PROFILES[G.SETTINGS.profile].career_stats.c_shop_rerolls >= 100
    end

}, true)

SMODS.Joker{
    key = 'm_evil_fibonacci_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 5},  
    rarity = 2, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = { extra = { mult = -8 } }, -- valor negativo para restar

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        -- Copiamos el valor de config a ability
        card.ability.extra = { mult = self.config.extra.mult }
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            -- Solo aplica si la carta NO es 2, 3, 5, 8 o 14
            if id ~= 2 and id ~= 3 and id ~= 5 and id ~= 8 and id ~= 14 then
                return {
                    mult = card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("fibonacci", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_fibonacci_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_fibonacci_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_steel_joker_m',  
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 2},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 0.2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel

        local steel_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_steel') then
                    steel_tally = steel_tally + 1
                end
            end
        end
        return { vars = { card.ability.extra.divisor, 1 + card.ability.extra.divisor * steel_tally } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local steel_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_steel') then
                    steel_tally = steel_tally + 1
                end
            end
            local total_mult = 1 + (card.ability.extra.divisor * steel_tally)
            return {
                Xmult_mod = 1 / total_mult,
                message = "÷" .. string.format("%.1f", total_mult),
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self)
        return false
    end,
}

SMODS.Joker:take_ownership("steel_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_steel_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_steel_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_scary_face_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 3},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = -30 } },    

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self)
        return false
    end,
}

SMODS.Joker:take_ownership("scary_face", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_scary_face_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_scary_face_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_abstract_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 3},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.jokers and #G.jokers.cards or 0) } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            -- You can also do this if you want to make sure everything in the Joker slots is a Joker (blame other mods)
            -- local joker_count = 0
            -- for i = 1, #G.jokers.cards do
            --     if G.jokers.cards[i].ability.set == 'Joker' then joker_count = joker_count + 1 end
            -- end
            return {
                mult = - (card.ability.extra.mult * #G.jokers.cards)
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("abstract", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_abstract_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_abstract_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_delayed_grat_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 3},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.ability.last_triggered_round = -1 -- para evitar repetirse en la misma ronda
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        -- Solo al final de la ronda y solo una vez por ronda
        if context.end_of_round 
        and not context.individual 
        and G.GAME.current_round.hands_left 
        and G.GAME.current_round.hands_left > 0 
        and G.GAME.round ~= card.ability.last_triggered_round then

            local loss = G.GAME.current_round.hands_left * card.ability.extra.dollars

            ease_dollars(-loss)
            card.ability.last_triggered_round = G.GAME.round -- marcar que ya se usó esta ronda

            return {
                message = "-" .. loss .. "$",
                colour = G.C.RED,
                remove_default_message = true
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("delayed_grat", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_delayed_grat_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_delayed_grat_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = 'm_evil_hack_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 2},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    update = function(self, card, dt)
        -- Se ejecuta constantemente mientras el Joker esté activo
        local to_debuff = {}

        -- Buscar cartas con ID 6, 7, 8 o 9 que no estén debuffeadas
        for _, area in pairs({G.play, G.hand, G.discard}) do
            if area and area.cards then
                for _, c in ipairs(area.cards) do
                    if type(c.get_id) == "function" and type(c.set_debuff) == "function" then
                        local id = c:get_id()
                        if (id == 14 or id == 13 or id == 12 or id == 11)
                        and not c.debuff then
                            table.insert(to_debuff, c)
                        end
                    end
                end
            end
        end

        -- Si no hay cartas a debuffear, salimos
        if #to_debuff == 0 then
            return
        end

        -- Aplicar el debuff a las cartas encontradas
        for _, pc in ipairs(to_debuff) do
            if pc.set_debuff then
                pc:set_debuff(true)
            end
        end

        -- Mostrar el mensaje solo una vez sobre el Joker
        if not card._hack_message_shown then
            card_eval_status_text(card, "extra", nil, nil, nil, {
                message = localize('j_m_evil_hack_m_disabled_message'),
                colour = G.C.RED
            })
            card._hack_message_shown = true
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("hack", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_hack_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_hack_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_pareidolia_m",
    atlas = "EvilJokersatlas",
    pos = { x = 6, y = 3 },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    update = function(self, card, dt)
        -- Evitar repetir mientras se está destruyendo
        if card._is_destroying then return end

        -- Solo si está en el área de jokers
        if card.area == G.jokers then
            local destroyed = false

            for _, v in ipairs(G.jokers.cards) do
                if v and v.config and v.config.center and v.config.center.key == "j_pareidolia" then
                    destroyed = true
                    card._is_destroying = true

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:start_dissolve()
                            SMODS.destroy_cards(v, nil, nil, true)
                            play_sound("slice1", 0.95 + math.random() * 0.05)
                            card:juice_up(0.6, 0.6)

                            -- Mostrar mensaje en el joker
                            card_eval_status_text(card, "extra", nil, nil, nil, {
                                message = localize("j_m_evil_pareidolia_m_destroy_message"),
                                colour = G.C.RED
                            })

                            return true
                        end
                    }))

                    -- Esperar antes de permitir otra destrucción
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 1.2, -- tiempo de la animación
                        func = function()
                            card._is_destroying = false
                            return true
                        end
                    }))
                    break
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

-- Guardamos la función original para restaurar después si hace falta
local original_is_face = Card.is_face

function Card:is_face(from_boss)
    -- Si existe el Joker “m_evil_pareidolia_m”, entonces ninguna carta es de cara
    if next(SMODS.find_card("j_m_evil_pareidolia_m")) then
        return false
    end
    -- Caso contrario, comportamiento normal
    return original_is_face(self, from_boss)
end

SMODS.Joker:take_ownership("pareidolia", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_pareidolia_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_pareidolia_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_gros_michel_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 6},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 6, mult = -15 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_gros_michel')
        return { vars = { card.ability.extra.mult, numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'vremade_gros_michel', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                G.GAME.pool_flags.vremade_gros_michel_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("gros_michel", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_gros_michel_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_gros_michel_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_even_steven_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 3},  
    rarity = 1, 
    cost = 2, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = -4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 14 or
                context.other_card:get_id() == 9 or
                context.other_card:get_id() == 7 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 3 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("even_steven", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_even_steven_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_even_steven_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_odd_todd_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 3},  
    rarity = 1, 
    cost = 2, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = -31 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 10 or
                context.other_card:get_id() == 8 or
                context.other_card:get_id() == 6 or
                context.other_card:get_id() == 4 or
                context.other_card:get_id() == 2 then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("odd_todd", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_odd_todd_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_odd_todd_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_scholar_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 4},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = -4, chips = -20 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("scholar", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_scholar_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_scholar_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_business_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 4},  
    rarity = 4, 
    cost = 2, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 2, dollars = -2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_evil_business_m')
        return { vars = { numerator, denominator, card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not
            context.other_card:is_face() and
            SMODS.pseudorandom_probability(card, 'm_evil_business_m', 1, card.ability.extra.odds) then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, this goes after the dollar modification
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("business", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_business_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_business_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_supernova_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 4},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = -G.GAME.hands[context.scoring_name].played
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("supernova", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_supernova_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_supernova_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_ride_the_bus_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 6},  
    rarity = 1, 
    cost = 2, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult_gain = -1, mult = -0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local faces = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if not playing_card:is_face() then
                    faces = true
                    break
                end
            end
            if faces then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_gain
            end
        end
        if context.joker_main then
            return {
                mult = -card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("ride_the_bus", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_ride_the_bus_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_ride_the_bus_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_space_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 5},  
    rarity = 2, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_evil_space_m')
        return { vars = { numerator, denominator } }
    end,
 
    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, 'm_evil_space_m', 1, card.ability.extra.odds) then
            return {
                level_up = -1,
                message = localize('j_m_evil_space_m_decrease_level_message')
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("space", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_space_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_space_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_egg_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 10},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { price = -3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.price } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            local current_price = card.ability.extra.price or -3

            -- Quita dinero
            ease_dollars(current_price)

            -- Aumenta la penalización (más negativo cada ronda)
            card.ability.extra.price = current_price - 3

            -- Mensaje localizado después con delay
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('j_m_evil_egg_m_value_down_message'),
                        colour = G.C.RED
                    })
                    return true
                end
            }))

            -- Muestra directamente cuánto dinero quitó
            return {
                message = tostring(current_price) .. "$",
                colour = G.C.RED
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("egg", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_egg_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_egg_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_burglar_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 10},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { discards = -3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_discard(card.ability.extra.discards, nil, true)
                    ease_hands_played(-G.GAME.current_round.hands_left)

                    SMODS.calculate_effect({
                        message = tostring(card.ability.extra.discards),
                        card = context.blueprint_card or card
                    })

                    return true
                end
            }))
            return nil, true
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("burglar", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_burglar_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_burglar_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_blackboard_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 10},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, localize('Hearts', 'suits_plural'), localize('Diamonds', 'suits_plural') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local has_red_suit = false
            -- Cambiado a cartas jugadas (context.scoring_hand)
            for _, played_card in ipairs(context.scoring_hand or {}) do
                if played_card:is_suit('Hearts', nil, true) or played_card:is_suit('Diamonds', nil, true) then
                    has_red_suit = true
                    break
                end
            end

            if has_red_suit then
                return {
                    card = card,
                    Xmult_mod = 1 / card.ability.extra.divisor,
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("blackboard", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_blackboard_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_blackboard_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_runner_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 10},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = -0, mult_mod = 15 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and not next(context.poker_hands['Flush']) then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("runner", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_runner_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_runner_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_ice_cream_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 10},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = -100, chip_mod = 5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,

    calculate = function(self, card, context)
        -- Aumenta el valor negativo (empeora) después de cada ronda
        if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = "+" .. card.ability.extra.chip_mod,
                colour = G.C.CHIPS
            }
        end

        -- Aplica los chips negativos durante el cálculo principal del joker
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("ice_cream", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_ice_cream_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_ice_cream_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_adn_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 10},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return {}
    end,

    calculate = function(self, card, context)
        -- Solo se ejecuta al final de la ronda
        if context.end_of_round and not context.blueprint then
            local last_hand = G.playing_cards or {}
            if #last_hand > 1 then
                -- Destruye permanentemente las cartas jugadas
                for _, c in ipairs(last_hand) do
                    SMODS.destroy_cards(c, nil, nil, true)
                    c:start_dissolve()
                end

                -- Muestra mensaje
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card_eval_status_text(card, 'extra', nil, nil, nil, {
                                    message = "Cartas destruidas",
                                    colour = G.C.RED
                                })
                                return true
                            end
                        }))
                        return true
                    end
                }))
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker{
    key = 'm_evil_splash_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 10},  
    rarity = 1, 
    cost = 3, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Se activa justo antes de puntuar la mano
        if context.before and context.cardarea == G.jokers then
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card.set_debuff then
                    played_card:set_debuff(true)
                end
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('j_m_evil_splash_m_debuff_message'),
                        colour = G.C.RED
                    })
                    return true
                end
            }))
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("splash", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_splash_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_splash_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_blue_joker_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 10},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult_penalty = -2, base_deck_size = 52 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local deck_count = (G.deck and G.deck.cards) and #G.deck.cards or 0
        local excess = math.max(deck_count - card.ability.extra.base_deck_size, 0)
        local total_penalty = card.ability.extra.mult_penalty * excess
        return { vars = { card.ability.extra.mult_penalty, excess, total_penalty } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local deck_count = (G.deck and G.deck.cards) and #G.deck.cards or 0
            local excess = math.max(deck_count - card.ability.extra.base_deck_size, 0)
            local total_penalty = card.ability.extra.mult_penalty * excess
            if excess > 0 then
                return {
                    mult = total_penalty,
                    message = tostring(total_penalty),
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("blue_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_blue_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_blue_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_sixth_sense_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 10},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Solo actuar en la primera mano jugada del round
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            local has_six = false
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card:get_id() == 6 then
                    has_six = true
                    break
                end
            end

            -- Si no hay ningún 6, destruir cartas jugadas y un consumible aleatorio
            if not has_six then
                -- Destruye todas las cartas jugadas
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _, played_card in ipairs(context.full_hand or {}) do
                            played_card:start_dissolve(nil, true)
                        end
                        return true
                    end
                }))

                -- Destruye un consumible aleatorio si existe alguno
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if #G.consumeables.cards > 0 then
                            local random_index = pseudorandom(1, #G.consumeables.cards)
                            local chosen_card = G.consumeables.cards[random_index]
                            if chosen_card then
                                chosen_card:start_dissolve(nil, true)
                            end
                        end
                        return true
                    end
                }))

                return {
                    message = localize('j_m_evil_sixth_sense_m_without_sixth_sense_message'),
                    colour = G.C.RED,
                    remove = false
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false -- no aparece de forma natural
    end,
}

SMODS.Joker:take_ownership("sixth_sense", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_sixth_sense_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_sixth_sense_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_constellation_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 10},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 1, divisor_mod = 0.1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_mod, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_mod
            return {
                message = "÷" .. card.ability.extra.divisor
            }
        end
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("constellation", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_constellation_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_constellation_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_hiker_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 11},  
    rarity = 2, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = 5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.discard then
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) -
                card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("hiker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_hiker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_hiker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_faceless_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 11},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 5, numbers = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.numbers } }
    end,

    calculate = function(self, card, context)
        if context.before then
            local number_cards = 0
            for _, played_card in ipairs(context.full_hand) do
                if not played_card:is_face() then number_cards = number_cards + 1 end
            end

            if number_cards >= card.ability.extra.numbers then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_dollars(-card.ability.extra.dollars)
                        return true
                    end
                }))

                return {
                    message = "-" .. tostring(card.ability.extra.dollars)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("faceless", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_faceless_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_faceless_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_green_joker_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 11},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = { extra = { hand_sub = 1, discard_add = 1, mult = 0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hand_sub, card.ability.extra.discard_add, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
            local prev_mult = card.ability.extra.mult
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.mult = math.max(0, card.ability.extra.mult + card.ability.extra.discard_add)
            if card.ability.extra.mult ~= prev_mult then
                return {
                    message = "+" .. card.ability.extra.discard_add,
                    colour = G.C.RED
                }
            end
        end
        if context.before and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.hand_sub
            return {
                message = "-" .. card.ability.extra.hand_sub,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("green_joker", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_green_joker_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_green_joker_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_superposition_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 11},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Si la mano es Flush, Royal Flush, Flush Five o Flush House y contiene al menos un Rey, destruye un consumible aleatorio
        if context.joker_main and (
            context.poker_hands["Flush"] or
            context.poker_hands["Royal Flush"] or
            context.poker_hands["Flush Five"] or
            context.poker_hands["Flush House"]
        ) then
            local has_king = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 13 then
                    has_king = true
                    break
                end
            end

            if has_king and G.consumeables and #G.consumeables.cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local consumables = G.consumeables.cards
                        if #consumables > 0 then
                            local chosen = pseudorandom_element(consumables, 'evil_superposition')
                            if chosen then
                                chosen:start_dissolve(nil, true) -- elimina visual y lógicamente
                                return true
                            end
                        end
                        return true
                    end
                }))

                return {
                    message = localize('j_m_evil_superposition_m_destroy_message'),
                    colour = G.C.RED
                }
            end
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("superposition", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_superposition_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_superposition_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_todo_list_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 11},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = -4, poker_hand = 'High Card' } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                localize(card.ability.extra.poker_hand, 'poker_hands')
            }
        }
    end,

    calculate = function(self, card, context)
        -- Si la jugada coincide con la mano elegida
        if context.before and context.scoring_name == card.ability.extra.poker_hand then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(card.ability.extra.dollars)
                    return true
                end
            }))
        end

        -- Al final de la ronda: elige una nueva mano objetivo
        if context.end_of_round and not context.blueprint and not context.game_over and context.main_eval then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'm_evil_todo_list_m')
            return {
                message = localize('k_reset')
            }
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'm_evil_todo_list_m')
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("todo_list", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_todo_list_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_todo_list_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_cavendish_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 11},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 1000, divisor = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_evil_cavendish_m')
        return { vars = { card.ability.extra.divisor, numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'm_evil_cavendish_m', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("cavendish", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_cavendish_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_cavendish_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_card_sharp_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 11},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.joker_main 
        and G.GAME.hands[context.scoring_name] 
        and G.GAME.hands[context.scoring_name].played_this_round <= 1 then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.RED
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("card_sharp", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_card_sharp_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_card_sharp_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_red_card_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 11},  
    rarity = 1, 
    cost = 2, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult_gain = 3, mult = 0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.open_booster and not context.blueprint then
            -- Cada vez que se abre un booster, se reduce el mult
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_gain
            return {
                message = tostring(card.ability.extra.mult), -- <- convertido a texto
                colour = G.C.RED,
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("red_card", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_red_card_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_red_card_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_madness_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 11},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { xdivisor_gain = 0.5, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xdivisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        -- Efecto al iniciar ciega jefe
        if context.setting_blind and not context.blueprint and context.blind.boss then
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.xdivisor_gain

            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Efecto visual
                    (context.blueprint_card or card):juice_up(0.8, 0.8)

                    -- Duplica un comodín aleatorio (excepto a sí mismo)
                    local jokers = {}
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] ~= card then
                            jokers[#jokers + 1] = G.jokers.cards[i]
                        end
                    end

                    if #jokers > 0 and #G.jokers.cards < G.jokers.config.card_limit then
                        local chosen_joker = pseudorandom_element(jokers, 'evil_madness_dup')
                        if chosen_joker then
                            local copied_joker = copy_card(
                                chosen_joker,
                                nil, nil, nil,
                                chosen_joker.edition and chosen_joker.edition.negative
                            )
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                        end
                    end

                    return true
                end
            }))

            return { message = "÷" .. card.ability.extra.divisor }
        end

        -- Efecto multiplicador durante la ronda
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("madness", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_madness_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_madness_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_square_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 11},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pixel_size = { h = 71 },
    config = { extra = { chips = 0, chip_mod = 4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and #context.full_hand == 5 then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("square", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_square_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_square_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_seance_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 12},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { poker_hand = 'High Card' } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local target_hand = context.poker_hands[card.ability.extra.poker_hand]

            -- ✅ solo continúa si la tabla existe y no está vacía
            if target_hand and next(target_hand) then
                local consumables = G.consumeables.cards
                if #consumables > 0 then
                    local target = pseudorandom_element(consumables, pseudoseed('m_evil_seance_m'))
                    if target and not target.getting_sliced then
                        target.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                (context.blueprint_card or card):juice_up(0.8, 0.8)
                                target:start_dissolve({ G.C.SECONDARY_SET.Spectral }, nil, 1.4)
                                return true
                            end
                        }))
                        return {
                            message = localize('k_destroy_consumable'),
                            colour = G.C.SECONDARY_SET.Spectral
                        }
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("seance", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_seance_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_seance_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_riff_raff_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 12},
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { destroys = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroys } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            -- Reúne comodines que se pueden destruir
            local destructable_jokers = {}
            for i = 1, #G.jokers.cards do
                local j = G.jokers.cards[i]
                if j ~= card and not SMODS.is_eternal(j, card) and not j.getting_sliced then
                    table.insert(destructable_jokers, j)
                end
            end

            -- Selecciona hasta 2 comodines aleatorios
            local to_destroy = math.min(card.ability.extra.destroys, #destructable_jokers)
            if to_destroy > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i = 1, to_destroy do
                            local target = pseudorandom_element(destructable_jokers, 'm_evil_riff_raff_m')
                            if target then
                                target.getting_sliced = true
                                target:start_dissolve({ G.C.RED }, nil, 1.4)

                                -- Buscar el índice manualmente (ya no existe table.index_of)
                                local remove_index = nil
                                for idx, obj in ipairs(destructable_jokers) do
                                    if obj == target then
                                        remove_index = idx
                                        break
                                    end
                                end
                                if remove_index then
                                    table.remove(destructable_jokers, remove_index)
                                end
                            end
                        end
                        (context.blueprint_card or card):juice_up(0.8, 0.8)
                        return true
                    end
                }))
                return {
                    message = localize('j_m_evil_riff_raff_m_destroy_message'),
                    colour = G.C.RED
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("riff_raff", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_riff_raff_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_riff_raff_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_vampire_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 12},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = { extra = { divisor_gain = 0.1, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        -- PRIMERA PARTE: Antes de puntuar (contar cartas sin mejora y aumentar divisor)
        if context.before and not context.blueprint then
            local normal_cards = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if not next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff then
                    table.insert(normal_cards, scored_card)
                end
            end

            if #normal_cards > 0 then
                card.ability.extra.divisor = card.ability.extra.divisor + (#normal_cards * card.ability.extra.divisor_gain)
                card.ability.extra.pending_enhance = normal_cards  -- guardamos para después
                return {
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end

        -- SEGUNDA PARTE: Después de puntuar (dar mejoras aleatorias)
        if context.after and not context.blueprint and card.ability.extra.pending_enhance then
            local possible_enhancements = {'m_gold', 'm_stone', 'm_lucky', 'm_steel', 'm_glass'}
            for _, target_card in ipairs(card.ability.extra.pending_enhance) do
                if not target_card.REMOVED then
                    local enhancement = pseudorandom_element(possible_enhancements, 'evil_vampire')
                    target_card:set_ability(enhancement, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            card.ability.extra.pending_enhance = nil -- limpiar
        end

        -- MULTIPLICADOR principal del Joker
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("vampire", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_vampire_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_vampire_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = 'm_evil_shortcut_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 12},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, blind, context)
        -- Ignora si está deshabilitada: siempre ejecuta
        if context.debuff_hand then
            -- Aplica el debuff si la mano es una Escalera (Straight) o Escalera de Color (Straight Flush)
            if context.scoring_name == "Straight" or context.scoring_name == "Straight Flush" then
                blind.triggered = true
                return {
                    debuff = true
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Joker:take_ownership("shortcut", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_shortcut_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_shortcut_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_hologram_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 12},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    soul_pos = {
        x = 2, y = 9,
        draw = function(card, scale_mod, rotate_mod)
            card.hover_tilt = card.hover_tilt * 1.5
            card.children.floating_sprite:draw_shader('hologram', nil, card.ARGS.send_to_shader, nil,
                card.children.center, 2 * scale_mod, 2 * rotate_mod)
            card.hover_tilt = card.hover_tilt / 1.5
        end
    },
    config = { extra = { divisor_gain = 0.25, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        -- 💥 Se activa cuando cartas fueron destruidas realmente
        if context.remove_playing_cards and not context.blueprint then
            local destroyed_count = #context.removed or 1
            card.ability.extra.divisor = card.ability.extra.divisor + (card.ability.extra.divisor_gain * destroyed_count)
            return {
                message = "÷" .. card.ability.extra.divisor,
            }
        end

        -- 🧮 Aplica el divisor al multiplicador
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("hologram", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_hologram_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_hologram_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_vagabond_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 12},
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        -- Activa cuando se calcula el efecto principal de comodines
        if context.joker_main then
            -- Si el jugador tiene al menos 4 dólares
            if G.GAME.dollars >= card.ability.extra.dollars and #G.consumeables.cards > 0 then
                -- Selecciona un consumible aleatorio
                local target = pseudorandom_element(G.consumeables.cards, 'm_evil_vagabond_m')

                if target then
                    -- Marca para disolverse visualmente
                    target.getting_sliced = true
                    target:start_dissolve({ G.C.RED }, nil, 1.4)

                    -- Mensaje visual
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.8, 0.8)
                            return true
                        end
                    }))

                    return {
                        message = localize('j_m_evil_vagabond_m_destroy_message'),
                        colour = G.C.RED
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("vagabond", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_vagabond_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_vagabond_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_baron_m",
    atlas = 'EvilJokersatlas',
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 6, y = 12 },
    config = { extra = { divisor = 1.5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 13 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    Xmult_mod = 1 / card.ability.extra.divisor,
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("baron", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_baron_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_baron_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_cloud_9_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 12},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 1, nine_count = 0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local nine_tally = 0
        -- contar todos los 9s en mazo, descarte, mano y cartas jugadas
        local all_areas = { G.deck, G.discard, G.hand, G.play }
        for _, area in ipairs(all_areas) do
            if area and area.cards then
                for _, c in ipairs(area.cards) do
                    if c:get_id() == 9 then
                        nine_tally = nine_tally + 1
                    end
                end
            end
        end
        card.ability.extra.nine_count = nine_tally
        return { vars = { nine_tally, card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local nine_tally = 0
            local all_areas = { G.deck, G.discard, G.hand, G.play }

            for _, area in ipairs(all_areas) do
                if area and area.cards then
                    for _, c in ipairs(area.cards) do
                        if c:get_id() == 9 then
                            nine_tally = nine_tally + 1
                        end
                    end
                end
            end

            if nine_tally > 0 then
                local loss = card.ability.extra.dollars * nine_tally
                ease_dollars(-loss)

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.8)
                        return true
                    end
                }))

                return {
                    message = "-$" .. loss,
                    colour = G.C.RED
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("cloud_9", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_cloud_9_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_cloud_9_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_rocket_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 12},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = { extra = { dollars = 1, increase = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.increase } }
    end,

    calculate = function(self, card, context)
        -- 🔹 Aumentar valor al SALIR de la tienda
        if context.ending_shop then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.increase

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(0.8, 0.8)
                    return true
                end
            }))

            return {
                message = "+$" .. card.ability.extra.increase,
                colour = G.C.MONEY
            }
        end

        -- 🔹 Cobrar dinero al final de la ronda (si quieres mantener esto)
        if context.end_of_round and context.cardarea == G.jokers then
            local loss = card.ability.extra.dollars
            if loss > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_dollars(-loss)
                        card:juice_up(0.8, 0.8)
                        return true
                    end
                }))
                return { message = "-$" .. loss, colour = G.C.RED }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("rocket", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_rocket_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_rocket_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_obelisk_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 12},
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = { extra = { divisor_gain = 0.2, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local most_played = nil
            local most_count = -1
            local any_played = false

            -- Buscar la mano más jugada y verificar si hay al menos una jugada real
            for handname, values in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) then
                    if values.played > 0 then any_played = true end
                    if values.played > most_count then
                        most_played = handname
                        most_count = values.played
                    end
                end
            end

            local current_hand_plays = G.GAME.hands[context.scoring_name].played or 0

            -- Solo aumentar si hay manos jugadas y esta es la más jugada
            if any_played and context.scoring_name == most_played and most_count > 0 then
                card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_gain

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.8)
                        return true
                    end
                }))

                return {
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("obelisk", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_obelisk_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_obelisk_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = 'm_evil_midas_mask_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 13},
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Solo se activa antes de calcular la mano
        if context.before and not context.blueprint then
            local removed_any = false

            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card.debuff then
                    local rank = scored_card.base.value or scored_card.base.nominal or scored_card.rank or ""
                    -- Solo limpia si NO es figura
                    if not scored_card:is_face() then
                        local enh = SMODS.get_enhancements(scored_card)
                        if next(enh) then
                            scored_card:set_ability('c_base', nil, true)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true
                                end
                            }))
                            removed_any = true
                        end
                    end
                end
            end

            if removed_any then
                -- Mostrar mensaje y efecto inmediatamente
                card:juice_up(0.6, 0.8)
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('j_m_evil_midas_mask_m_purified'),
                    colour = G.C.PURPLE
                })
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("midas_mask", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_midas_mask_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_midas_mask_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_luchador_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 13},  
    rarity = 2, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = -4, -- resta 4 al multiplicador
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker{
    key = 'm_evil_photograph_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 13},
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    pixel_size = { h = 95 / 1.2 },
    perishable_compat = true,
    config = { extra = { divisor = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
            local hand = context.scoring_hand
            local last_number_card = nil

            -- Buscar la última carta numérica (no figura)
            for i = #hand, 1, -1 do
                if not hand[i]:is_face() then
                    last_number_card = hand[i]
                    break
                end
            end

            -- Si esta carta es la última numérica
            if last_number_card and context.other_card == last_number_card then
                return {
                    Xmult_mod = 1 / card.ability.extra.divisor,
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end
    end,
    
    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("photograph", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_photograph_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_photograph_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_gift_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 13},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.ability._gift_triggered = false
    end,

    calculate = function(self, card, context)
        -- Solo al seleccionar la ciega, y una sola vez
        if context.setting_blind and not context.blueprint and not card.ability._gift_triggered then
            card.ability._gift_triggered = true

            local total_cost = 0

            -- Calcular costo total
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card and other_card.cost then
                        total_cost = total_cost + (other_card.cost / 2)
                    end
                end
            end

            if total_cost > 0 then
                ease_dollars(-total_cost) -- 💸 Llamada directa
                card:juice_up(0.8, 0.8)
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "-$" .. total_cost,
                    colour = G.C.RED
                })
            end
        end

        -- Reset al terminar la ronda
        if context.end_of_round then
            card.ability._gift_triggered = false
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("gift", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_gift_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_gift_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_turtle_bean_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 13},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { h_size = -5, h_mod = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.acted_on_round = nil -- flag para que solo actúe 1 vez por ronda
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size, card.ability.extra.h_mod } }
    end,

    calculate = function(self, card, context)
        -- Al final de la ronda, aumenta tamaño de mano en +h_mod UNA sola vez
        if context.end_of_round and not context.blueprint and not context.game_over then
            -- seguridad: asegurar que existe G.GAME.round
            local round = (G and G.GAME and G.GAME.round) or nil
            if round and card.acted_on_round ~= round then
                -- aplicar solo una vez por ronda
                G.hand:change_size(card.ability.extra.h_mod)
                card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.h_mod

                card.acted_on_round = round

                return {
                    message = localize{
                        type = 'variable',
                        key = 'a_handsize_plus',
                        vars = { card.ability.extra.h_mod }
                    },
                    colour = G.C.GREEN
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Al agregarse al mazo, resta el tamaño inicial
        G.hand:change_size(card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Al removerse, devuelve el tamaño perdido
        G.hand:change_size(card.ability.extra.h_size)
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("turtle_bean", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_turtle_bean_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_turtle_bean_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_erosion_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 13},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = -4, base_size = 52 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        -- Evita crash si aún no hay baraja (en menú)
        local deck_size = (G.playing_cards and #G.playing_cards) or 52
        local over = math.max(0, deck_size - card.ability.extra.base_size)
        local total_penalty = over * card.ability.extra.mult
        return { vars = { card.ability.extra.mult, over, total_penalty, card.ability.extra.base_size } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            if G.playing_cards then
                local deck_size = #G.playing_cards
                local over = math.max(0, deck_size - card.ability.extra.base_size)
                if over > 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.5, 0.8)
                            return true
                        end
                    }))
                    return {
                        mult = over * card.ability.extra.mult,
                        message = string.format("-%d", over * math.abs(card.ability.extra.mult)),
                        colour = G.C.RED
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("erosion", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_erosion_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_erosion_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_reserved_parking_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 13},
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 2, dollars = 1 } }, -- ahora quita 1 dólar

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_evil_reserved_parking_m')
        return { vars = { math.abs(card.ability.extra.dollars), numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            if not context.other_card:is_face() and
                SMODS.pseudorandom_probability(card, 'm_evil_reserved_parking_m', 1, card.ability.extra.odds) then

                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    -- Quita dinero con animación
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_dollars(-card.ability.extra.dollars)
                            return true
                        end
                    }))

                    return {
                        message = string.format("-%d$", math.abs(card.ability.extra.dollars)),
                        colour = G.C.RED,
                        card = card
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("reserved_parking", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_reserved_parking_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_reserved_parking_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_mail_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 13},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 5 } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.abs(card.ability.extra.dollars),
                localize((card.ability.extra.target_card and card.ability.extra.target_card.rank) or 'Ace', 'ranks')
            }
        }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- 🔁 Al final de cada ronda, elegimos una nueva carta objetivo
        if context.end_of_round then
            local valid_cards = {}
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(playing_card) then
                    valid_cards[#valid_cards + 1] = playing_card
                end
            end
            local target = pseudorandom_element(valid_cards, 'm_evil_mail_m' .. G.GAME.round_resets.ante)
            if target then
                card.ability.extra.target_card = {
                    id = target.base.id,
                    rank = target.base.value
                }
            end
            return
        end

        -- 💸 Durante descartes, si coincide la carta, quita dinero
        if context.discard and not context.other_card.debuff
        and card.ability.extra.target_card
        and context.other_card:get_id() == card.ability.extra.target_card.id then
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(-card.ability.extra.dollars)
                    return true
                end
            }))

            return {
                message = string.format("-%d$", math.abs(card.ability.extra.dollars)),
                colour = G.C.RED,
                card = card
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("mail", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_mail_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_mail_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_to_the_moon_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 13},  
    rarity = 2, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { interest = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.interest } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount - card.ability.extra.interest
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.interest
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("to_the_moon", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_to_the_moon_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_to_the_moon_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_hallucination_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 13},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(
            card, 1, card.ability.extra.odds, 'm_evil_hallucination_m' .. G.GAME.round_resets.ante)
        return { vars = { numerator, denominator } }
    end,

    calculate = function(self, card, context)
        -- se activa cuando abres un booster
        if context.open_booster and #G.consumeables.cards > 0 then
            if SMODS.pseudorandom_probability(card, 'm_evil_hallucination_m' .. G.GAME.round_resets.ante, 1, card.ability.extra.odds) then
                -- elegimos un consumible aleatorio
                local random_consumeable = pseudorandom_element(G.consumeables.cards, 'm_evil_hallucination_m_destroy')

                if random_consumeable then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            -- efecto visual: destruir consumible
                            random_consumeable:start_dissolve()
                            return true
                        end
                    }))

                    return {
                        message = localize('j_m_evil_hallucination_m_destroy_message'),
                        colour = G.C.PURPLE,
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("hallucination", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_hallucination_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_hallucination_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_fortune_teller_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 5},
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = { extra = {  mult = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.all or 0) } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            return {
                message = "-" .. tostring(card.ability.extra.mult),
                colour = G.C.RED,
            }
        end
        if context.joker_main then
            local idk = card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.all or 0)
            return {
                mult = -idk
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("fortune_teller", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_fortune_teller_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_fortune_teller_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_juggler_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { h_size = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("juggler", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_juggler_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_juggler_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_drunkard_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 1},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { d_size = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.d_size } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("drunkard", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_drunkard_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_drunkard_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_stone_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 0},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = 25, total_cards = 52 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone

        local stone_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then
                    stone_tally = stone_tally + 1
                end
            end
        end

        local missing = math.max(0, card.ability.extra.total_cards - stone_tally)
        local penalty = -card.ability.extra.chips * missing

        return { vars = { card.ability.extra.chips, missing, penalty } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local stone_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then
                    stone_tally = stone_tally + 1
                end
            end

            local missing = math.max(0, card.ability.extra.total_cards - stone_tally)
            local penalty = -card.ability.extra.chips * missing

            return {
                chips = penalty,
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("stone", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_stone_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_stone_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_golden_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 2},
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.end_round_done = false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        -- Resetear al inicio de una nueva ronda
        if context.setting_blind and context.cardarea == G.jokers then
            card.end_round_done = false
        end

        -- Ejecutar al final de la ronda solo una vez
        if context.end_of_round and context.cardarea == G.jokers and not card.end_round_done then
            ease_dollars(-card.ability.extra.dollars)

            card.end_round_done = true

            return {
                message = "-" .. tostring(card.ability.extra.dollars)
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("golden", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_golden_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_golden_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_lucky_cat_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 14},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor_gain = 0.25, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky

        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card.lucky_trigger and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("lucky_cat", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_lucky_cat_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_lucky_cat_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_baseball_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 14},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 1.5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("baseball", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_baseball_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_baseball_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_bull_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 14},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = -2 } }, -- negativo porque quita fichas

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local dollars = math.max(0, (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))
        return { vars = { math.abs(card.ability.extra.chips), card.ability.extra.chips * dollars } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local dollars = math.max(0, (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))
            return {
                chips = card.ability.extra.chips * dollars
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("bull", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_bull_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_bull_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = "m_evil_diet_cola_m",
    atlas = "EvilJokersatlas",
    pos = {x = 8, y = 14},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    config = { extra = { pay = 4 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.pay } }
    end,

    update = function(self, dt)
        if G.GAME and G.GAME.tags and #G.GAME.tags > 0 then
            for i = #G.GAME.tags, 1, -1 do
                local tag = G.GAME.tags[i]
                if tag and tag.remove then
                    tag:remove()
                    local pay = self.config.extra.pay or 5
                    ease_dollars(-pay)
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("diet_cola", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_diet_cola_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_diet_cola_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_trading_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 14},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.first_hand_done = false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        -- Se agita cuando la primera mano se roba
        if context.first_hand_drawn and not card.first_hand_done and not context.blueprint then
            local eval = function() 
                return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES 
            end
            juice_card_until(card, eval, true)
        end

        -- Solo la primera mano jugada de la ronda
        if context.before and not card.first_hand_done and G.GAME.current_round.hands_played == 0 then
            local hand = context.full_hand
            if #hand > 1 then
                -- Copiar todas las cartas de la mano
                for _, c in ipairs(hand) do
                    local card_copied = copy_card(c)
                    card_copied:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, card_copied)
                    G.hand:emplace(card_copied)
                    card_copied.states.visible = nil

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card_copied:start_materialize()
                            return true
                        end
                    }))
                end

                -- Perder dinero
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_dollars(-card.ability.extra.dollars)
                        return true
                    end
                }))

                -- Marcar como hecho
                card.first_hand_done = true

                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.MONEY,
                    card = card
                }
            end
        end

        -- Resetear para la siguiente ronda
        if context.setting_blind then
            card.first_hand_done = false
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("trading", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_trading_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_trading_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_flash_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 15},  
    rarity = 2, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult_gain = 2, mult = 0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_gain
            return {
                message = tostring(card.ability.extra.mult),
                colour = G.C.MULT,
            }
        end
        if context.joker_main then
            return {
                mult = -card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("flash", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_flash_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_flash_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_popcorn_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 15},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult_gain = 4, mult = -20 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,

    calculate = function(self, card, context)
        -- Cada fin de ronda pierde mult
        if context.end_of_round and not context.blueprint and not context.game_over and context.main_eval then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = "+" .. tostring(card.ability.extra.mult_gain),
                colour = G.C.MULT
            }
        end

        -- Aplica su mult negativo
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
 
    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("popcorn", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_popcorn_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_popcorn_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_trousers_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 15},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult_loss = 2, mult = 0 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_loss, localize('Straight', 'poker_hands'), card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and (next(context.poker_hands['Straight']) or next(context.poker_hands['Straight Flush'])) then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("trousers", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_trousers_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_trousers_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_ancient_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 15},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 1.5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        -- 🔹 Inicializa la tabla del palo si no existe
        G.GAME.current_round.m_evil_ancient_m_card = G.GAME.current_round.m_evil_ancient_m_card or { suit = 'Spades' }
    end,

    loc_vars = function(self, info_queue, card)
        local data = G.GAME.current_round.m_evil_ancient_m_card or { suit = 'Spades' }
        local suit = data.suit
        return { vars = { card.ability.extra.divisor, localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
    end,

    calculate = function(self, card, context)
        -- 🔸 Asegura que la tabla exista en cualquier momento
        G.GAME.current_round.m_evil_ancient_m_card = G.GAME.current_round.m_evil_ancient_m_card or { suit = 'Spades' }

        local function reset_vremade_ancient_card()
            local current = G.GAME.current_round.m_evil_ancient_m_card
            local suits = {}
            for _, s in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
                if s ~= current.suit then table.insert(suits, s) end
            end
            local new_suit = pseudorandom_element(suits, 'm_evil_ancient' .. G.GAME.round_resets.ante)
            G.GAME.current_round.m_evil_ancient_m_card.suit = new_suit
        end

        -- 🃏 Aplica el divisor si coincide el palo actual
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(G.GAME.current_round.m_evil_ancient_m_card.suit) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end

        -- 🔁 Cambia el palo al final de cada ronda
        if context.end_of_round and not context.blueprint and not context.game_over and context.main_eval then
            reset_vremade_ancient_card()
            local new_suit = G.GAME.current_round.m_evil_ancient_m_card.suit
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("ancient", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_ancient_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_ancient_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_ramen_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 15},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor_gain = 0.01, divisor = 2 } },  

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, card.ability.extra.divisor_gain } }
    end,

    calculate = function(self, card, context)
        -- 🔹 Cada carta jugada aumenta el divisor
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_gain
            return {
                message = "÷" .. string.format("%.2f", card.ability.extra.divisor),
                colour = G.C.RED
            }
        end

        -- 🔸 Aplica el multiplicador basado en el divisor actual
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. string.format("%.2f", card.ability.extra.divisor),
                colour = G.C.MULT
            }
        end

        -- 🔻 Reinicia el divisor al final de la ronda
        if context.end_of_round and not context.blueprint then
            card.ability.extra.divisor = 2
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("ramen", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_ramen_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_ramen_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_walkie_talkie_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 15},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = 4, mult = 10 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 10 or context.other_card:get_id() == 4) then
            return {
                chips = -card.ability.extra.chips,
                mult = -card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("walkie_talkie", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_walkie_talkie_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_walkie_talkie_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_selzer_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 15},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = { extra = { hands_left = 10, debuff_active = true } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands_left } }
    end,

    calculate = function(self, card, context)
        -- Aplicar debuff antes de puntuar (solo si está activo)
        if context.before and context.cardarea == G.jokers and card.ability.extra.debuff_active then
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card.set_debuff then
                    played_card:set_debuff(true)
                end
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Debuff activo ("..card.ability.extra.hands_left..")",
                        colour = G.C.RED
                    })
                    return true
                end
            }))
        end

        -- Contar los descartes
        if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
            card.ability.extra.hands_left = card.ability.extra.hands_left - 1
            if card.ability.extra.hands_left <= 0 then
                card.ability.extra.debuff_active = false
                card.ability.extra.hands_left = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = "Debuff inactivo",
                            colour = G.C.BLUE
                        })
                        return true
                    end
                }))
            end
        end

        -- Cuando termina una mano (después de puntuar)
        if context.after and not context.blueprint then
            -- Si el debuff estaba inactivo, reiniciarlo para volver al ciclo
            if not card.ability.extra.debuff_active then
                card.ability.extra.debuff_active = true
                card.ability.extra.hands_left = 10
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = "Debuff reiniciado",
                            colour = G.C.RED
                        })
                        return true
                    end
                }))
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("selzer", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_selzer_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_selzer_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_castle_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 15},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = 0, chip_mod = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)

        -- 🔹 Inicializa la tabla global de ronda
        G.GAME.current_round.vremade_castle_card = G.GAME.current_round.vremade_castle_card or { suit = 'Spades' }
    end,

    loc_vars = function(self, info_queue, card)
        local data = G.GAME.current_round.vremade_castle_card or { suit = 'Spades' }
        local suit = data.suit
        return { vars = {
            card.ability.extra.chip_mod,
            localize(suit, 'suits_singular'),
            card.ability.extra.chips,
            colours = { G.C.SUITS[suit] }
        } }
    end,

    calculate = function(self, card, context)
        -- 🔸 Asegura que la variable global exista
        G.GAME.current_round.vremade_castle_card = G.GAME.current_round.vremade_castle_card or { suit = 'Spades' }

        -- 🔹 Al descartar una carta del mismo palo
        if context.discard and not context.blueprint and not context.other_card.debuff and
            context.other_card:is_suit(G.GAME.current_round.vremade_castle_card.suit) then

            card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end

        -- 🔸 Aplica los chips al puntuar
        if context.joker_main then
            return { chips = card.ability.extra.chips }
        end

        -- 🔁 Cambia el palo al final de la ronda
        if context.end_of_round and not context.blueprint and not context.game_over and context.main_eval then
            local current = G.GAME.current_round.vremade_castle_card
            local suits = {}
            for _, s in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
                if s ~= current.suit then table.insert(suits, s) end
            end
            local new_suit = pseudorandom_element(suits, 'vremade_castle' .. G.GAME.round_resets.ante)
            G.GAME.current_round.vremade_castle_card.suit = new_suit
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("castle", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_castle_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_castle_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_smiley_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 15},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
            return {
                mult = -card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("smiley", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_smiley_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_smiley_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_campfire_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 15},  
    rarity = 3, 
    cost = 9, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor_gain = 0.25, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_gain
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if context.beat_boss and card.ability.extra.divisor > 1 then
                card.ability.extra.divisor = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("campfire", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_campfire_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_campfire_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_golden_ticket_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 3},
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 4 } }, -- pérdida de dinero

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_gold') then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.dollars
            return {
                dollars = -card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("ticket", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_golden_ticket_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_golden_ticket_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_mr_bones_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 4},
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    bones_triggered = false,

    -- Se ejecuta constantemente; dispara 1 vez por mano (flag local)
    update = function(self, card, dt)
        if self.bones_triggered then return end
        if not G.GAME.blind or not G.GAME.blind.chips then return end

        if (G.GAME.chips / G.GAME.blind.chips) >= 0.25 then
            self.bones_triggered = true

            -- Duplicar comodín (evento para que no rompa el frame)
            G.E_MANAGER:add_event(Event({
                func = function()
                    local copy = copy_card(card, nil, nil)
                    copy:add_to_deck()
                    G.jokers:emplace(copy)
                    play_sound("tarot1")
                    return true
                end
            }))

            -- Forzar derrota inmediata (evento)
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Marcar mano como jugada y llamar end_round para procesar derrota
                    G.STATE = G.STATES.HAND_PLAYED
                    G.STATE_COMPLETE = false
                    end_round()
                    return true
                end
            }))
        end
    end,

    -- calculate se usa aquí para resetear el trigger cuando se vuelve a setear el blind
    calculate = function(self, card, context)
        if context.setting_blind then
            -- reset para permitir que el comodín vuelva a activarse en la nueva mano
            self.bones_triggered = false
        end
        -- no devolvemos nada especial aquí
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("mr_bones", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_mr_bones_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_mr_bones_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_acrobat_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 1},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("acrobat", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_acrobat_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_acrobat_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_sock_and_buskin_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 1},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Se activa justo antes de puntuar la mano
        if context.before and context.cardarea == G.jokers and context.full_hand then
            for _, played_card in ipairs(context.full_hand) do
                if not played_card:is_face() and played_card.set_debuff then
                    played_card:set_debuff(true)
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("sock_and_buskin", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_sock_and_buskin_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_sock_and_buskin_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_swashbuckler_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 5},  
    rarity = 1, 
    cost = 4, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
            if joker ~= card then
                sell_cost = sell_cost + joker.sell_cost
            end
        end
        return { vars = { card.ability.extra.mult * sell_cost } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local sell_cost = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card then
                    sell_cost = sell_cost + joker.sell_cost
                end
            end
            local total_mult = card.ability.extra.mult * sell_cost
            return {
                mult = -total_mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("swashbuckler", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_swashbuckler_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_swashbuckler_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_troubadour_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 2},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { h_size = 2, h_plays = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { -card.ability.extra.h_size, card.ability.extra.h_plays } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
        G.hand:change_size(card.ability.extra.h_size)
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("troubadour", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_troubadour_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_troubadour_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_certificate_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 8},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local full_deck = {}

            -- Solo recorrer áreas válidas (para evitar boolean)
            for _, area in ipairs({G.deck, G.discard, G.hand}) do
                if type(area) == "table" and area.cards then
                    for _, c in ipairs(area.cards) do
                        table.insert(full_deck, c)
                    end
                end
            end

            if #full_deck > 0 then
                local random_card = pseudorandom_element(full_deck, pseudoseed("evil_cert_destroy"))
                if random_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            random_card:start_dissolve()
                            return true
                        end
                    }))
                    card:juice_up(0.8, 0.3)
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("certificate", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_certificate_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_certificate_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_smeared_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 6},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

-- Guardamos la referencia original del método is_suit
local old_is_suit = Card.is_suit

-- Reescribimos el método
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local result = old_is_suit(self, suit, bypass_debuff, flush_calc)

    -- Si no coincide normalmente, aplicamos el efecto del Joker
    if not result and next(SMODS.find_card("j_m_evil_smeared_m")) then
        local my_suit = self.base.suit or self.base.suit_override

        -- Intercambio de palos:
        -- ♥ ↔ ♠  y  ♦ ↔ ♣
        if (my_suit == "Hearts" and suit == "Spades")
        or (my_suit == "Spades" and suit == "Hearts")
        or (my_suit == "Diamonds" and suit == "Clubs")
        or (my_suit == "Clubs" and suit == "Diamonds") then
            return true
        end
    end

    return result
end

SMODS.Joker:take_ownership("smeared", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_smeared_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_smeared_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_throwback_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 7},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = { extra = { divisor_gain = 0.25, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            -- Cada vez que entras a una nueva ciega, aumenta el divisor
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_gain
            return {
                message = tostring(card.ability.extra.divisor),
                colour = G.C.RED
            }
        end

        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("throwback", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_throwback_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_throwback_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_hanging_chad_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 6},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = { extra = { first_cards = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.first_cards } }
    end,

    calculate = function(self, card, context)
        -- Justo antes de puntuar la mano
        if context.before and context.cardarea == G.jokers then
            local num_to_disable = card.ability.extra.first_cards
            local count = 0

            for i, played_card in ipairs(context.full_hand or {}) do
                if count < num_to_disable then
                    if played_card.set_debuff then
                        played_card:set_debuff(true)
                        count = count + 1
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("hanging_chad", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_hanging_chad_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_hanging_chad_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_rough_gem_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 7},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.dollars
            return {
                dollars = -card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("rough_gem", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_rough_gem_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_rough_gem_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_bloodstone_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 8},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { odds = 2, divisor = 1.5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_m_evil_bloodstone_m')
        return { vars = { numerator, denominator, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and
            SMODS.pseudorandom_probability(card, 'm_m_evil_bloodstone_m', 1, card.ability.extra.odds) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("bloodstone", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_bloodstone_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_bloodstone_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_arrowhead_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 8},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { chips = 50 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
            return {
                chips = -card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("arrowhead", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_arrowhead_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_arrowhead_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_onyx_agate_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 8},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 7 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
            return {
                mult = -card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("onyx_agate", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_onyx_agate_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_onyx_agate_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_glass_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 3},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor_gain = 0.75, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                -- See note about SMODS Scaling Manipulation on the wiki
                                card.ability.extra.divisor = card.ability.extra.divisor +
                                    card.ability.extra.divisor_gain * glass_cards
                                return true
                            end
                        }))
                        SMODS.calculate_effect(
                            {
                                message = "÷" .. tostring(card.ability.extra.divisor + card.ability.extra.divisor_gain * glass_cards), -- <- convertido a texto
                                colour = G.C.RED,
                            }, card)
                        return true
                    end
                }))
                return nil, true -- This is for Joker retrigger purposes
            end
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == 'c_hanged_man' then
            -- Glass Joker updates on Hanged Man and no other destroy consumable
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.divisor = card.ability.extra.divisor +
                    card.ability.extra.divisor_gain * glass_cards
                return {
                    message = "÷" .. tostring(card.ability.extra.divisor), -- <- convertido a texto
                    colour = G.C.RED,
                }
            end
        end
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("glass", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_glass_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_glass_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_showman_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 5},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    add_to_deck = function(self, card)
        G.joker_evil_chance = 2
    end,

    calculate = function(self, card, context)
        if context.selling_card and cardarea == G.joker and context.card == card then
            G.joker_evil_chance = 1
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("ring_master", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_showman_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_showman_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_flower_pot_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 6},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            -- Contar los palos presentes en la mano
            local suits = {
                ['Hearts'] = false,
                ['Diamonds'] = false,
                ['Spades'] = false,
                ['Clubs'] = false
            }

            for i = 1, #context.scoring_hand do
                local c = context.scoring_hand[i]
                if c:is_suit('Hearts', true) then suits["Hearts"] = true end
                if c:is_suit('Diamonds', true) then suits["Diamonds"] = true end
                if c:is_suit('Spades', true) then suits["Spades"] = true end
                if c:is_suit('Clubs', true) then suits["Clubs"] = true end
            end

            -- Revisar si falta al menos un palo
            if not (suits["Hearts"] and suits["Diamonds"] and suits["Spades"] and suits["Clubs"]) then
                return {
                    Xmult_mod = 1 / card.ability.extra.divisor,
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("flower_pot", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_flower_pot_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_flower_pot_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_blueprint_m",
    atlas = "EvilJokersatlas",
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    discovered = false,
    pos = { x = 0, y = 3 },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card._last_disabled = nil
    end,

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            -- Buscar el joker a la derecha
            local right_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    right_joker = G.jokers.cards[i + 1]
                    break
                end
            end

            -- Determinar compatibilidad
            local compatible = false
            if right_joker
                and right_joker.config.center
                and right_joker.config.center.key ~= "j_m_evil_blueprint_m"
                and right_joker.config.center.key ~= "m_evil_blueprint_m"
                and right_joker.config.center.key ~= "j_m_evil_brainstorm_m"
                and right_joker.config.center.key ~= "m_evil_brainstorm_m"
            then
                compatible = true
            end

            return {
                main_end = {
                    {
                        n = G.UIT.C,
                        config = { align = "bm", minh = 0.4 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {
                                    ref_table = card,
                                    align = "m",
                                    colour = compatible
                                        and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
                                        or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                                    r = 0.05,
                                    padding = 0.06
                                },
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ',
                                            colour = G.C.UI.TEXT_LIGHT,
                                            scale = 0.32 * 0.8
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        end
    end,

    update = function(self, card, dt)
        if not (card.area == G.jokers) then return end
        if not (G and G.jokers and G.jokers.cards) then return end

        local jokers = G.jokers.cards
        local index = nil
        for i, v in ipairs(jokers) do
            if v == card then
                index = i
                break
            end
        end

        if not index then return end
        local right_joker = jokers[index + 1]
        if not right_joker then
            -- No hay joker a la derecha, limpia si había uno antes
            if card._last_disabled and not card._last_disabled.destroyed then
                card._last_disabled:set_debuff(false)
            end
            card._last_disabled = nil
            return
        end

        local key = right_joker.config.center and right_joker.config.center.key or ""

        -- Solo deshabilita si no es blueprint ni brainstorm
        if key ~= "j_m_evil_blueprint_m"
            and key ~= "m_evil_blueprint_m"
            and key ~= "j_m_evil_brainstorm_m"
            and key ~= "m_evil_brainstorm_m"
        then
            if card._last_disabled ~= right_joker then
                -- Limpia el anterior si había
                if card._last_disabled and not card._last_disabled.destroyed then
                    card._last_disabled:set_debuff(false)
                end

                -- Deshabilita el nuevo
                right_joker:set_debuff(true)
                card._last_disabled = right_joker

                -- Mensaje solo una vez
                card_eval_status_text(card, "extra", nil, nil, nil, {
                    message = "Deshabilitado",
                    colour = G.C.RED
                })
            else
                -- Si es el mismo, mantener debuff sin spamear
                if not right_joker.debuff then
                    right_joker:set_debuff(true)
                end
            end
        else
            -- Si es otro blueprint o brainstorm, limpia
            if card._last_disabled and not card._last_disabled.destroyed then
                card._last_disabled:set_debuff(false)
            end
            card._last_disabled = nil
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("blueprint", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_blueprint_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_blueprint_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_wee_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 0},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    config = { extra = { chips = 0, chip_mod = 8 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() ~= 2 and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = -card.ability.extra.chips
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("wee", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_wee_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_wee_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_merry_andy_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 0},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { d_size = 3, h_size = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,
   
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.d_size, card.ability.extra.h_size } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("merry_andy", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_merry_andy_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_merry_andy_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_oops_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 6},
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            if next(find_joker('oops')) then
                if context.numerator == 0 then
                    return {
                        numerator = 1
                    }
                end
            else
                if context.numerator == 1 then
                    return {
                        numerator = 0
                    }
                else
                    return {
                        numerator = context.numerator / 2
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("oops", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_oops_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_oops_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_idol_m",
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 7},
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        -- Si no hay carta ídolo guardada, usa una por defecto
        local idol_card = card.ability.idol_card or { rank = 'Ace', suit = 'Spades' }
        return {
            vars = {
                card.ability.extra.divisor,
                localize(idol_card.rank, 'ranks'),
                localize(idol_card.suit, 'suits_plural'),
                colours = { G.C.SUITS[idol_card.suit] }
            }
        }
    end,

    calculate = function(self, card, context)
        -- Se ejecuta al final de la ronda → elige nueva carta ídolo
        if context.end_of_round then
            local valid_idol_cards = {}
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
                    table.insert(valid_idol_cards, playing_card)
                end
            end
            -- Seleccionar una carta al azar
            local idol_card = pseudorandom_element(valid_idol_cards, 'm_m_evil_idol_m' .. G.GAME.round_resets.ante)
            if idol_card then
                card.ability.idol_card = {
                    rank = idol_card.base.value,
                    suit = idol_card.base.suit,
                    id = idol_card.base.id
                }
            else
                card.ability.idol_card = { rank = 'Ace', suit = 'Spades' }
            end
        end

        -- Cuando se juega una carta individual, verifica si coincide con el ídolo
        if context.individual and context.cardarea == G.play and card.ability.idol_card then
            if context.other_card:get_id() == card.ability.idol_card.id and
               context.other_card:is_suit(card.ability.idol_card.suit) then
                return {
                    Xmult_mod = 1 / card.ability.extra.divisor,
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("idol", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_idol_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_idol_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_seeing_double_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 4},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and not SMODS.seeing_double_check(context.scoring_hand, 'Clubs') then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("seeing_double", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_seeing_double_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_seeing_double_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_matador_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 5},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 8 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.debuffed_hand or context.joker_main then
            if not G.GAME.blind.triggered then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.dollars
                return {
                    dollars = -card.ability.extra.dollars,
                    func = function() -- This is for timing purposes, it runs after the dollar manipulation
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("matador", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_matador_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_matador_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_hit_the_road_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 5},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor_gain = 0.5, divisor = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and
            not context.other_card.debuff and
            context.other_card:get_id() == 11 then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.divisor = card.ability.extra.divisor + card.ability.extra.divisor_gain
            return {
                message_card = card,
                message = "÷" .. tostring(card.ability.extra.divisor),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("hit_the_road", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_hit_the_road_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_hit_the_road_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_duo_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 4},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 2, type = 'Pair' } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, localize(card.ability.extra.type, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("duo", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_duo_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_duo_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_trio_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 4},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3, type = 'Three of a Kind' } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, localize(card.ability.extra.type, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("trio", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_trio_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_trio_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_family_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 4},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 4, type = 'Four of a Kind' } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, localize(card.ability.extra.type, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("family", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_family_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_family_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_order_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 4},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3, type = 'Straight' } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, localize(card.ability.extra.type, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("order", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_order_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_order_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_tribe_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 4},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 2, type = 'Flush' } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor, localize(card.ability.extra.type, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("tribe", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_tribe_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_tribe_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_stuntman_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 6},  
    rarity = 3, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { h_size = 2, chip_mod = 250 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_mod, card.ability.extra.h_size } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = -card.ability.extra.chip_mod
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("stuntman", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_stuntman_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_stuntman_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_invisible_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 1, y = 7},  
    rarity = 3, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end,

    config = { extra = { invis_rounds = 0, total_rounds = 2 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    -- ⬇ loc_vars queda igual como pediste
    loc_vars = function(self, info_queue, card)
        local main_end
        if G.jokers and G.jokers.cards then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.edition and joker.edition.negative then
                    main_end = {}
                    localize { type = 'other', key = 'remove_negative', nodes = main_end, vars = {} }
                    break
                end
            end
        end
        return { vars = { card.ability.extra.total_rounds, card.ability.extra.invis_rounds }, main_end = main_end }
    end,

    calculate = function(self, card, context)
        -- Solo ejecutar al final de la ronda principal
        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
            -- Sumar una ronda
            card.ability.extra.invis_rounds = card.ability.extra.invis_rounds + 1

            -- Si llega al máximo, destruir un comodín y reiniciar
            if card.ability.extra.invis_rounds >= card.ability.extra.total_rounds then
                card.ability.extra.invis_rounds = 0

                -- Buscar comodines válidos (no a sí mismo)
                local jokers = {}
                for _, j in ipairs(G.jokers.cards) do
                    if j ~= card and not j.REMOVED then
                        table.insert(jokers, j)
                    end
                end

                if #jokers > 0 then
                    local chosen = pseudorandom_element(jokers, 'm_evil_invisible_m')

                    -- Animación de disolución y remoción
                    if chosen.start_dissolve then
                        chosen:start_dissolve()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if not chosen.REMOVED then chosen:remove() end
                                return true
                            end
                        }))
                    else
                        if not chosen.REMOVED then chosen:remove() end
                    end

                    return { message = localize('j_m_evil_invisible_m_destroy_message'), colour = G.C.RED }
                else
                    return { message = localize('j_m_evil_invisible_m_destroy_message'), colour = G.C.UI.TEXT_DARK }
                end
            else
                -- Mostrar progreso
                return {
                    message = (card.ability.extra.invis_rounds .. '/' .. card.ability.extra.total_rounds),
                    colour = G.C.FILTER
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- no aparece naturalmente en el pool
    end,
}

SMODS.Joker:take_ownership("invisible", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_invisible_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_invisible_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker {
    key = "m_evil_brainstorm_m",
    atlas = "EvilJokersatlas",
    pos = { x = 7, y = 7 },
    rarity = 3,
    cost = 10,
    discovered = false,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        -- Guarda qué joker deshabilitó la última vez (para no repetir mensaje)
        card._last_disabled = nil
    end,

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local leftmost = G.jokers.cards[1]
            local compatible = false

            if leftmost
                and leftmost.config.center
                and leftmost.config.center.key ~= "j_m_evil_blueprint_m"
                and leftmost.config.center.key ~= "m_evil_blueprint_m"
                and leftmost.config.center.key ~= "j_m_evil_brainstorm_m"
                and leftmost.config.center.key ~= "m_evil_brainstorm_m"
            then
                compatible = true
            end

            return {
                main_end = {
                    {
                        n = G.UIT.C,
                        config = { align = "bm", minh = 0.4 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {
                                    ref_table = card,
                                    align = "m",
                                    colour = compatible
                                        and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
                                        or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                                    r = 0.05,
                                    padding = 0.06
                                },
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ',
                                            colour = G.C.UI.TEXT_LIGHT,
                                            scale = 0.32 * 0.8
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        end
    end,

    update = function(self, card, dt)
        if not (card.area == G.jokers) then return end
        if not (G and G.jokers and G.jokers.cards) then return end

        local jokers = G.jokers.cards
        local leftmost = jokers[1]
        if not leftmost or #jokers < 2 then return end

        local key = leftmost.config.center and leftmost.config.center.key or ""

        -- Solo deshabilitar si no es blueprint ni brainstorm
        if key ~= "j_m_evil_blueprint_m"
            and key ~= "m_evil_blueprint_m"
            and key ~= "j_m_evil_brainstorm_m"
            and key ~= "m_evil_brainstorm_m"
        then
            -- Si cambió el joker deshabilitado
            if card._last_disabled ~= leftmost then
                -- Limpia el anterior si había
                if card._last_disabled and not card._last_disabled.destroyed then
                    card._last_disabled:set_debuff(false)
                end

                -- Deshabilita el nuevo
                leftmost:set_debuff(true)
                card._last_disabled = leftmost

                -- Solo muestra mensaje una vez
                card_eval_status_text(card, "extra", nil, nil, nil, {
                    message = "Deshabilitado",
                    colour = G.C.RED
                })
            else
                -- Si es el mismo, solo asegura que siga deshabilitado sin spamear
                if not leftmost.debuff then
                    leftmost:set_debuff(true)
                end
            end
        else
            -- Si el más a la izquierda es otro brainstorm/blueprint, limpia el anterior
            if card._last_disabled and not card._last_disabled.destroyed then
                card._last_disabled:set_debuff(false)
            end
            card._last_disabled = nil
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("brainstorm", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_brainstorm_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_brainstorm_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_satellite_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 8, y = 7},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { dollars = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do if v.set == 'Planet' then planets_used = planets_used + 1 end end
        return { vars = { card.ability.extra.dollars, planets_used * card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local planets_used = 0
            for k, v in pairs(G.GAME.consumeable_usage) do
                if v.set == 'Planet' then planets_used = planets_used + 1 end
            end
            if planets_used > 0 then
                local amount = planets_used * card.ability.extra.dollars
                ease_dollars(-amount) -- suma visual del dinero
                return {
                    message = "-" .. amount .. "$",
                    colour = G.C.MONEY,
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("satellite", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_satellite_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_satellite_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_shoot_the_moon_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 6},  
    rarity = 1, 
    cost = 5, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 13 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 12 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = -card.ability.extra.mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("shoot_the_moon", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_shoot_the_moon_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_shoot_the_moon_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_drivers_license_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 0, y = 7},  
    rarity = 3, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { divisor = 3, driver_amount = 16 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local driver_tally = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then driver_tally = driver_tally + 1 end
        end
        return { vars = { card.ability.extra.divisor, card.ability.extra.driver_amount, driver_tally } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local driver_tally = 0
            for _, playing_card in pairs(G.playing_cards) do
                if next(SMODS.get_enhancements(playing_card)) then driver_tally = driver_tally + 1 end
            end
            if driver_tally <= card.ability.extra.driver_amount then
                return {
                    Xmult_mod = 1 / card.ability.extra.divisor,
                    message = "÷" .. card.ability.extra.divisor,
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

SMODS.Joker:take_ownership("drivers_license", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_drivers_license_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_drivers_license_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_cartomancer_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 3},  
    rarity = 2, 
    cost = 6, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local consumables = G.consumeables and G.consumeables.cards or {}
            if #consumables > 0 then
                local random_card = pseudorandom_element(consumables, pseudoseed('m_evil_cartomancer_m'))
                if random_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            random_card:start_dissolve()
                            return true
                        end
                    }))
                    return {
                        message = "Consumible destruido",
                        colour = G.C.RED,
                        card = card
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("cartomancer", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_cartomancer_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_cartomancer_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_astronomer_m',  -- nombre único
    atlas = 'EvilJokersatlas',
    pos = {x = 2, y = 7},  
    rarity = 2, 
    cost = 8, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,

    in_pool = function(self, args)
        return false  -- nunca aparecerá de forma natural en pools
    end,
}

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    -- primero ejecuta el cálculo original del costo
    card_set_cost_ref(self)

    -- si tienes el comodín "m_evil_astronomer_m" activo
    if next(SMODS.find_card("j_m_evil_astronomer_m")) then

        -- si la carta es un Planeta o un Booster Celestial
        if (self.ability.set == 'Planet' or 
            (self.ability.set == 'Booster' and self.config.center.kind == 'Celestial')) then
            
            -- duplica su costo
            self.cost = math.floor(self.cost * 2)
        end

        -- recalcula el valor de venta
        self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
        self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
    end
end

SMODS.Joker:take_ownership("astronomer", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_astronomer_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_astronomer_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_burnt_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 7},  
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        -- Solo actúa antes del puntaje y cuando la jugada proviene de la mesa (G.play)
        if context.before and context.cardarea == G.jokers then
            if G.GAME.current_round and G.GAME.current_round.hands_left > 0 then
                return {
                    level_up = -1,
                    message = localize('j_m_evil_space_m_decrease_level_message') or "↓ Nivel"
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("burnt", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_burnt_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_burnt_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_bootstraps_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 9, y = 8},  
    rarity = 2, 
    cost = 7, 
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 2, dollars = 5 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        local money = (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)
        local less_mult = card.ability.extra.mult * math.floor(money / card.ability.extra.dollars)
        return { vars = { card.ability.extra.mult, card.ability.extra.dollars, less_mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local money = (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)
            local less_mult = card.ability.extra.mult * math.floor(money / card.ability.extra.dollars)
            return {
                mult = -less_mult,
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,
}

SMODS.Joker:take_ownership("bootstraps", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_bootstraps_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_bootstraps_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

-- =======================
-- LEGENDARIES
-- =======================

SMODS.Joker{
    key = 'm_evil_canio_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 3, y = 8},
    soul_pos = {x = 3, y = 9},
    rarity = 4,
    cost = 15,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = { divisor = 1, divisor_gain = 1 } },

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.divisor_gain, card.ability.extra.divisor } }
    end,

    calculate = function(self, card, context)
        -- Aumenta divisor según cuántas cartas numéricas hay en juego
        if context.playing_card_added and not context.blueprint then
            local num_cards = 0
            for _, c in ipairs(context.cards or {}) do
                if not c:is_face() then
                    num_cards = num_cards + 1
                end
            end

            if num_cards > 0 then
                card.ability.extra.divisor = card.ability.extra.divisor + num_cards * card.ability.extra.divisor_gain
                return { message = "÷" .. card.ability.extra.divisor }
            end
        end

        -- Aplica el divisor en el multiplicador principal
        if context.joker_main then
            return {
                Xmult_mod = 1 / card.ability.extra.divisor,
                message = "÷" .. card.ability.extra.divisor,
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("caino", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_canio_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_canio_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_triboulet_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 4, y = 8},
    soul_pos = {x = 4, y = 9},
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local c = context.other_card
            if not c then return end

            local id = c.get_id and c:get_id() or nil
            if id == 12 or id == 13 then
                return {
                    Xmult_mod = 0.5,
                    message = "÷2",
                    colour = G.C.MULT
                }
            end
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("triboulet", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_triboulet_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_triboulet_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_yorick_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 5, y = 8},
    soul_pos = {x = 5, y = 9},
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
        card.ability.extra = card.ability.extra or {
            divisor = 1,   -- comienza en ÷1
            counter = 0,   -- cartas jugadas desde la última mejora
            step = 23      -- cada 23 cartas sube divisor
        }
        card.localization_key = "j_m_evil_yorick_m"
    end,

    calculate = function(self, card, context)
        -- Contamos cartas jugadas (se ejecuta por cada carta que se evalúa)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.counter = (card.ability.extra.counter or 0) + 1

            -- Si alcanzamos el umbral (step), aumentamos divisor y reiniciamos contador
            if card.ability.extra.counter >= card.ability.extra.step then
                local gained = math.floor(card.ability.extra.counter / card.ability.extra.step)
                card.ability.extra.divisor = (card.ability.extra.divisor or 1) + gained
                card.ability.extra.counter = card.ability.extra.counter % card.ability.extra.step

                -- Mostrar el aviso en EL COMODÍN (card = card) y evitar mensajes por defecto
                return {
                    message = "÷" .. card.ability.extra.divisor,
                    card = card, -- asegura que el mensaje salga en el comodín
                    colour = G.C.UI.TEXT_INACTIVE,
                    remove_default_message = true,
                    repetition = 1
                }
            end
        end

        -- En la fase principal del joker aplicamos el modificador Xmult al puntuar
        if context.joker_main then
            return {
                Xmult_mod = 1 / (card.ability.extra.divisor or 1),
                message = "÷" .. (card.ability.extra.divisor or 1),
                card = card, -- mostrar mensaje ligado al comodín (opcional)
                colour = G.C.MULT,
                remove_default_message = true
            }
        end
    end,

    -- loc_vars: variables para reemplazar #1#, #2#, #3# y la tabla colours para {V:1}
    loc_vars = function(self, info_queue, card)
        local ex = card.ability.extra or { divisor = 1, counter = 0, step = 23 }
        local divisor = ex.divisor or 1
        local step = ex.step or 23
        local counter = ex.counter or 0
        local remaining = step - (counter % step)

        return {
            vars = {
                divisor,               -- #1# -> divisor actual (÷1, ÷2, ...)
                step,                  -- #2# -> umbral fijo (23)
                remaining,             -- #3# -> cartas que faltan para siguiente mejora
                colours = { G.C.UI.TEXT_INACTIVE } -- necesario para {V:1}
            },
            key = self.key
        }
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("yorick", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_yorick_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_yorick_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)

SMODS.Joker{
    key = 'm_evil_chicot_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 6, y = 8},
    soul_pos = {x = 6, y = 9},
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = -0, -- resta 4 al multiplicador
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker{
    key = 'm_evil_perkeo_m',
    atlas = 'EvilJokersatlas',
    pos = {x = 7, y = 8},
    soul_pos = {x = 7, y = 9},
    rarity = 4,
    cost = 15,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.ending_shop and G.consumeables and #G.consumeables.cards > 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local consumables = G.consumeables.cards
                    if #consumables > 0 then
                        local chosen = pseudorandom_element(consumables, 'evil_perkeo')
                        if chosen then
                            chosen:start_dissolve(nil, true) -- lo elimina visual y lógicamente
                            return true
                        end
                    end
                    return true
                end
            }))
            return {
                message = "Consumible destruido",
                colour = G.C.RED
            }
        end
    end,

    in_pool = function(self)
        return false
    end
}

SMODS.Joker:take_ownership("perkeo", {
    add_to_deck = function(self, card)
        -- Evita ejecución al mover o duplicar
        if card._checked_evil or card.key == "j_m_evil_perkeo_m" then return end
        card._checked_evil = true

        -- Tiramos el dado solo una vez
        if math.random(1, 2) <= G.joker_evil_chance then
            card:start_dissolve(nil, true)

            G.E_MANAGER:add_event(Event({
                func = function()
                    local evil = SMODS.add_card{
                        set = 'Joker',
                        area = G.jokers,
                        key = 'j_m_evil_perkeo_m',
                        no_edition = true
                    }
                    -- Marcamos el evil para que no se reactive su propio add_to_deck
                    evil._checked_evil = true
                    return true
                end
            }))
        end
    end
}, true)
