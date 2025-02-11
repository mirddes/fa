-------------------------------------------------------------------------------
--
--  File     :  /data/projectiles/SBOOtheTacticalBomb01/SBOOtheTacticalBomb01_script.lua
--  Author(s):  Gordon Duclos, Aaron Lundquist
--
--  Summary  :  Othe Tactical Bomb script, XSA0103
--
--  Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
-------------------------------------------------------------------------------

local SOtheTacticalBomb = import('/lua/seraphimprojectiles.lua').SOtheTacticalBomb

SBOOtheTacticalBomb01 = Class(SOtheTacticalBomb) {
    OnImpact = function(self, targetType, targetEntity)
        local pos = self:GetPosition()
        local radius = self.DamageData.DamageRadius
        local FriendlyFire = self.DamageData.DamageFriendly and radius ~=0
        
        DamageArea( self, pos, radius, 1, 'Force', FriendlyFire )
        DamageArea( self, pos, radius, 1, 'Force', FriendlyFire )

        self.DamageData.DamageAmount = self.DamageData.DamageAmount - 2
        
        if targetType ~= 'Shield' and targetType ~= 'Water' and targetType ~= 'Air' and targetType ~= 'UnitAir' and targetType ~= 'Projectile' then
            local army = self.Army
            local RandomFloat = import('/lua/utilities.lua').GetRandomFloat
            local rotation = RandomFloat(0,2*math.pi)

            CreateDecal(pos, rotation, 'crater_radial01_albedo', '', 'Albedo', radius+1, radius+1, 150, 30, army)
            end
        
		SOtheTacticalBomb.OnImpact(self, targetType, targetEntity) 
    end,
}
TypeClass = SBOOtheTacticalBomb01