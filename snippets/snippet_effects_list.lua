--Game State Effects
sacrificeTarget() -- sacrifices targets
acquireForFreeTarget(loc) -- acquires targets for free to location
acquireTarget(int discount, loc) -- acquires targets to location with a discount
addSlotToTarget(slot) -- adds a slot to targets
damageTarget(intExpression) -- deals damage to targets
discardTarget() -- discards targets
expendTarget() -- expends targets
grantHealthToTarget(intExpression) -- grants +X defense to target champions
moveTarget(locExr) -- moves targets to location
moveToTopDeckTarget() -- moves targets to top of current player’s deck
nullTarget() -- does nothing
playTarget() -- plays targets
prepareTarget() --prepares targets
stunTarget() -- stuns target
transformTarget(cardStringId) -- transforms target to a card with the given id
modifyCardDefTarget(healthDelta, ability) --- gives an existing card a modified health value and/or a new ability

--Random Effects
probabilityTarget({ chance, onSuccessTarget, onFailureTarget}) -- executes onSuccess target effect with chance probability, otherwise executes onFailureTarget effect.
randomTarget(cardEffect, intExpression) 

--Animation Effects
showTextTarget(text) -- show the provided text above the target card

-- Control Flow Effects
ifElseTarget(boolCardExpression, yesCardEffect, noCardEffect) -- same as ifElseEffect

--Targeted Effects
pushTargetedEffect()

-- Choice Effects
pushChoiceEffect()

-- Target Player Effects
pushTargetPlayerEffect()