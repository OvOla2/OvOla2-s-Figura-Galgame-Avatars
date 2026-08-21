-- ExpressionController.lua
local ExpressionController = {}

-- 配置
local CONFIG = {
    EXPRESSIONS = {
        "Default", "Disgust1", "Disgust2", "Disgust3", "Content",
        "Disappear", "Excited", "Contempt", "Shocked", "Jealous",
        "Angry1", "Angry2", "Joy", "Sad", "Ashamed", "Pout"
    },
    DEFAULT_EXPRESSION = "Default",
    AUTO_RESET_TIME = 10,          -- 秒
    TICKS_PER_SECOND = 20,
}

-- 状态
local state = {
    currentExpression = CONFIG.DEFAULT_EXPRESSION,
    resetTickCounter = 0,          -- 当前已计数的 tick 数
    isResetting = false,
    resetTimerActive = false,      -- 是否正在计时
}

-- 获取 FaceParts 组
local function getFaceParts()
    return models.main.root.Head.FaceParts
end

-- 隐藏所有表情
local function hideAllExpressions()
    local faceParts = getFaceParts()
    for _, name in ipairs(CONFIG.EXPRESSIONS) do
        local part = faceParts[name]
        if part then
            part:setVisible(false)
        end
    end
end

-- 显示指定表情（并隐藏其他所有）
local function showExpression(expressionName)
    if not expressionName then return end
    hideAllExpressions()
    local faceParts = getFaceParts()
    local part = faceParts[expressionName]
    if part then
        part:setVisible(true)
        state.currentExpression = expressionName
    end
end

-- 复位到默认表情（由计时触发）
local function resetToDefault()
    if state.isResetting then return end
    state.isResetting = true

    if state.currentExpression ~= CONFIG.DEFAULT_EXPRESSION then
        showExpression(CONFIG.DEFAULT_EXPRESSION)
    end

    state.isResetting = false
    state.resetTimerActive = false
    state.resetTickCounter = 0
end

-- 启动复位计时（重置计数器）
local function startResetTimer()
    state.resetTickCounter = 0
    state.resetTimerActive = true
end

-- 取消复位计时
local function stopResetTimer()
    state.resetTimerActive = false
    state.resetTickCounter = 0
end

-- 切换表情（外部调用接口）
function ExpressionController.setExpression(expressionName, sync)
    if not expressionName then return end
    -- 如果已经是当前表情，若为默认只取消计时, 若为非默认保持计时
    if state.currentExpression == expressionName then
        if expressionName == CONFIG.DEFAULT_EXPRESSION then
            stopResetTimer()
        else
            startResetTimer()      -- 重新计时
        end
        return
    end

    -- 显示新表情
    showExpression(expressionName)

    -- 根据表情类型启动/停止计时
    if expressionName ~= CONFIG.DEFAULT_EXPRESSION then
        startResetTimer()
    else
        stopResetTimer()
    end

    -- 多人同步
    if sync ~= false and host:isHost() then
        pings.ExpressionPing(expressionName)
    end
end

-- 获取当前表情
function ExpressionController.getCurrentExpression()
    return state.currentExpression
end

-- 初始化（显示默认表情）
function ExpressionController.init()
    hideAllExpressions()
    showExpression(CONFIG.DEFAULT_EXPRESSION)
    stopResetTimer()
end

-- ===== tick 事件：每秒执行 20 次，用于复位计时 =====
function events.tick()
    if not state.resetTimerActive then return end

    state.resetTickCounter = state.resetTickCounter + 1
    local requiredTicks = CONFIG.AUTO_RESET_TIME * CONFIG.TICKS_PER_SECOND
    if state.resetTickCounter >= requiredTicks then
        resetToDefault()
    end
end

-- ===== 定义 Ping=====
pings.ExpressionPing = function(expressionName)
    ExpressionController.setExpression(expressionName, false)
end

-- 自动初始化
ExpressionController.init()

return ExpressionController
