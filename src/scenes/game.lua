local Scene = require("engine.scene")
local World = require("engine.world")

local Game = setmetatable({}, { __index = Scene })
Game.__index = Game

function Game.new(sceneManager)
	local self = setmetatable(Scene.new(sceneManager), Game)
	self.world = World.new()

	return self
end

function Game:update(dt)
	self.world:update(dt)
end

function Game:draw()
	self.world:draw()
end

function Game:keypressed(key)
	if key == "escape" then
		self.sceneManager:switch("menu")
	end
end

return Game
