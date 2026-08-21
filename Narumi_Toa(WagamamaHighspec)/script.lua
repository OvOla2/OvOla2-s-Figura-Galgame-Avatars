-- ========================================
-- Vanilla Model Hiding
-- ========================================

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)
--re-enable the helmet item
vanilla_model.HELMET_ITEM:setVisible(false)

--hide vanilla cape model
vanilla_model.CAPE:setVisible(false)

-- ========================================
-- Library Requires
-- ========================================

local membrane = require("libraries.membrane")
local skirtPhysics = require("libraries.membrane_skirt")

-- ========================================
--  Membrane Skirt Texture
-- ========================================

--- Membrane: MiniInner_FL
membrane:define(models.main.Membranes.MiniInner_FL, {
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1top_I,
})

--- Membrane: MiniInner_LF
membrane:define(models.main.Membranes.MiniInner_LF, {
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2bottom_I,
})

--- Membrane: MiniInner_LB
membrane:define(models.main.Membranes.MiniInner_LB, {
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3top_I,
})

--- Membrane: MiniInner_BL
membrane:define(models.main.Membranes.MiniInner_BL, {
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4bottom_I,
})

--- Membrane: MiniInner_BR
membrane:define(models.main.Membranes.MiniInner_BR, {
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5top_I,
})

--- Membrane: MiniInner_RB
membrane:define(models.main.Membranes.MiniInner_RB, {
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6bottom_I,
})

--- Membrane: MiniInner_RF
membrane:define(models.main.Membranes.MiniInner_RF, {
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7top_I,
})

--- Membrane: MiniInner_FL
membrane:define(models.main.Membranes.MiniInner_FL, {
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1bottom_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8top_I,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8bottom_I,
})

--- Membrane: MiniOuter_FL
membrane:define(models.main.Membranes.MiniOuter_FL, {
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1top_O,
})

--- Membrane: MiniOuter_LF
membrane:define(models.main.Membranes.MiniOuter_LF, {
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontLeft.Mbone2bottom_O,
})

--- Membrane: MiniOuter_LB
membrane:define(models.main.Membranes.MiniOuter_LB, {
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtLeft.Mbone3top_O,
})

--- Membrane: MiniOuter_BL
membrane:define(models.main.Membranes.MiniOuter_BL, {
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackLeft.Mbone4bottom_O,
})

--- Membrane: MiniOuter_BR
membrane:define(models.main.Membranes.MiniOuter_BR, {
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBack.Mbone5top_O,
})

--- Membrane: MiniOuter_RB
membrane:define(models.main.Membranes.MiniOuter_RB, {
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtBackRight.Mbone6bottom_O,
})

--- Membrane: MiniOuter_RF
membrane:define(models.main.Membranes.MiniOuter_RF, {
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtRight.Mbone7top_O,
})

--- Membrane: MiniOuter_FL
membrane:define(models.main.Membranes.MiniOuter_FL, {
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1bottom_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFront.Mbone1top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8top_O,
    models.main.root.Body.Skirt.Skirt2.SkirtFrontRight.Mbone8bottom_O,
})

-- ========================================
-- Skirt Physics
-- ========================================

--parameters: skirtPhysics.new(root, flare, angleAdd, legMultiplier, crouchOffset, XsittingOffset, YsittingOffset)
skirtPhysics.new(models.main.root.Body.Skirt.Skirt2, 1.3, 5, 0.75, vec(0,0.75,0), 60, 20)

-- ========================================
-- ExpressionControll
-- ========================================

-- 表情控制器引用
local exp = require("libraries.ExpressionController")

-- ========================================
-- ActionWheel
-- ========================================

-- 加载 select 模块
local select = require("libraries.Select")

-- 创建主页面
local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

-- 创建选择器 Action
local selector = mainPage:newSelect()
    :setTitle({text = "选择表情", color = "#00FFFF"})   -- 标题
    :setItem("minecraft:player_head")                    -- 可选的图标
    -- 添加所有表情选项
    :addChoice("Joy")
    :addChoice("Shocked")
    :addChoice("Angry1")
    :addChoice("Angry2")
    :addChoice("Disgust1")
    :addChoice("Disgust2")
    :addChoice("Disgust3")
    :addChoice("Content")
    :addChoice("Disappear")
    :addChoice("Excited")
    :addChoice("Contempt")
    :addChoice("Jealous")
    :addChoice("Sad")
    :addChoice("Pout")
    :addChoice("Ashamed")
    :addChoice("Default")

    -- 点击事件：左键点击执行切换表情
    :setOnLeftClick(function(self, expressionName)
        exp.setExpression(expressionName)
    end)

-- ========================================
-- Hair Physics with PhysBone API
-- ========================================

local physBone = require("libraries.physBoneAPI")

function events.entity_init()
    local bhl1 = physBone.physBoneBhl1
    local bhl2 = physBone.physBoneBhl2
    local bhl3 = physBone.physBoneBhl3
    local bhl4 = physBone.physBoneBhl4

    if bhl1 then
        bhl1:setSpringForce(0.8)
            :setAirResistance(0.3)
            :setNodeRadius(0.5)  -- 调大碰撞体积
    end

    if bhl2 then
        bhl2:setSpringForce(0.6)
            :setAirResistance(0.35)
            :setNodeRadius(0.4)
    end

    if bhl3 then
        bhl3:setSpringForce(0.4)
            :setAirResistance(0.4)
            :setNodeRadius(0.3)
    end

    if bhl4 then
        bhl4:setSpringForce(0.2)
            :setAirResistance(0.45)
            :setNodeRadius(0.25)
    end

    -- 注册碰撞体（防止头发穿透背部）
    -- 在 Blockbench 中创建colliderBack
    local backCollider = models.main.root.Body.backCollider
    if backCollider then
        physBone:newCollider(backCollider)
    end
end

