local Config = require("config")
local Scene = require("engine.scene")

local Menu = setmetatable({}, { __index = Scene })
Menu.__index = Menu

function Menu.new(sceneManager)
	local self = setmetatable(Scene.new(sceneManager), Menu)
	return self
end

function Menu:draw()
	love.graphics.print("Press Enter to Start", Config.WINDOW.WIDTH / 2 - 50, Config.WINDOW.HEIGHT / 2)
end

function Menu:keypressed(key)
	if key == "return" then
		self.sceneManager:switch("game")
	end
end

return Menu
