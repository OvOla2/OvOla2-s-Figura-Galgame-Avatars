skirtPhysics = {}

function skirtPhysics.new(root, flare, angleAdd, legMultiplier, crouchOffset, XsittingOffset, YsittingOffset)
    -- ========================================
    -- properties
    -- ========================================
    local _ = {}
    local g = 0.79
    local ar = 1.5
   
    _.root = root
    _.flare = flare
    _.angleAdd = angleAdd
    _.legMultiplier = legMultiplier
    _.crouchOffset = crouchOffset
    _.sittingXOffset = XsittingOffset
    _.sittingYOffset = YsittingOffset

    local parts = {
        _.root.SkirtFrontLeft,
        _.root.SkirtFrontRight,
        _.root.SkirtBackLeft,
        _.root.SkirtBackRight
    }

    local ct = nil
    local pt = nil
    local dt = nil
    -- ========================================
    -- events
    -- ========================================
    function events.render(delta)
        _.setDelta(delta)
        if dt == 0 then
            return -- been 0 frames since last render, skip
        end
        local leftLegRot = _.getLegRot(vanilla_model.LEFT_LEG)
        local rightLegRot = _.getLegRot(vanilla_model.RIGHT_LEG)
        -- ---------------------
        -- forces
        -- ---------------------
        _.applyGravity()
        _.applyVelocity()
        -- ---------------------
        -- Leg Avoidance
        -- ---------------------
        _.handleLegAvoidance(leftLegRot, _.root.SkirtFrontLeft, _.root.SkirtBackLeft)
        _.handleLegAvoidance(rightLegRot, _.root.SkirtFrontRight, _.root.SkirtBackRight)
        -- ---------------------
        -- point averaging
        -- ---------------------
        _.averageCenterPointsX(_.root.SkirtFront, _.root.SkirtFrontLeft, _.root.SkirtFrontRight)
        _.averageCenterPointsX(_.root.SkirtBack, _.root.SkirtBackLeft, _.root.SkirtBackRight)

        _.averageCenterPointsZ(_.root.SkirtRight, _.root.SkirtFrontRight, _.root.SkirtBackRight)
        _.averageCenterPointsZ(_.root.SkirtLeft, _.root.SkirtFrontLeft, _.root.SkirtBackLeft)
        -- ---------------------
        -- Crouch Offset
        -- ---------------------
        _.handleCrouching()
        -- ---------------------
        -- Sitting Offset
        -- ---------------------
        _.sittingOffset()
    end

    -- ========================================
    -- methods
    -- ========================================
    function _.setDelta(delta)
        ct = world:getTime() + delta
        if pt then
            dt = ct - pt
        else
            dt = 0
        end
        pt = ct
    end

    function _.getLegRot(leg)
        return _.cutoffPrecision(leg:getOriginRot().x * _.legMultiplier)
    end

    function _.sittingOffset()
        if player:getVehicle() ~= nil then
            _.root.SkirtFrontLeft:setOffsetRot(XsittingOffset,YsittingOffset,0)
            _.root.SkirtFrontRight:setOffsetRot(XsittingOffset,-YsittingOffset,0)
            _.root.SkirtFront:setOffsetRot(XsittingOffset,0,0)
            _.root.SkirtRight:setOffsetRot((XsittingOffset*0.4),0,(YsittingOffset*0.75))
            _.root.SkirtLeft:setOffsetRot((XsittingOffset*0.4),0,(-YsittingOffset*0.75))
        end
    end

    function _.applyGravity()
        for key, value in pairs(parts) do
            value:setOffsetRot(
                _.cutoffPrecision(math.lerp(value:getOffsetRot().x, value:getOffsetRot().x * g, dt)),
                _.cutoffPrecision(math.lerp(value:getOffsetRot().y, value:getOffsetRot().y * g, dt)),
                _.cutoffPrecision(math.lerp(value:getOffsetRot().z, value:getOffsetRot().z * g, dt))
            )
        end 
    end

    function _.applyVelocity()
        local v = player:getVelocity().y * ar
 
        for key, value in pairs(parts) do
            value:setOffsetRot(
                math.lerp(value:getOffsetRot().x, value:getOffsetRot().x + (value:getPivot().z * v), dt),
                value:getOffsetRot().y,
                math.lerp(value:getOffsetRot().z, value:getOffsetRot().z + (value:getPivot().x * -v), dt)
            )
        end
    end

    function _.cutoffPrecision(v)
        if math.abs(v) < 0.01 then 
            return 0
        end
        return v
    end

    function _.handleLegAvoidance(legRot, skirtFront, skirtBack)
        if legRot == 0 then
            return 
        end
        if legRot > skirtFront:getTrueRot().x - _.angleAdd then
            skirtFront:setOffsetRot(
                legRot - skirtFront:getRot().x + _.angleAdd,
                skirtFront:getOffsetRot().y,
                skirtFront:getOffsetRot().z
            )
        elseif legRot < skirtBack:getTrueRot().x + _.angleAdd then
            skirtBack:setOffsetRot(
                legRot - skirtBack:getRot().x - _.angleAdd,
                skirtBack:getOffsetRot().y,
                skirtBack:getOffsetRot().z
            )
        end
    end

    function _.averageCenterPointsX(center, a, b)
        local avg = (a:getOffsetRot().x + b:getOffsetRot().x) / 2
        center:setOffsetRot(avg * _.flare, 0, 0)
    end

    function _.averageCenterPointsZ(center, a, b)
        local avg = (a:getOffsetRot().z + b:getOffsetRot().z) / 2
        center:setOffsetRot(0, 0, avg * _.flare)
    end

    function _.handleCrouching()
        if player:isCrouching() then
			_.root:setPos(_.crouchOffset):setRot(-vanilla_model.BODY:getOriginRot().x - 5,0,0)
        else
            _.root:setPos(vanilla_model.BODY:getOriginRot().x,0,0):setRot(vanilla_model.BODY:getOriginRot().x,0,0)
		end
    end
end

return skirtPhysics;