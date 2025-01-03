local Scene = require("engine.scene")
local World = require("engine.world")

local Game = setmetatable({}, { __index = Scene })
Game.__index = Game

function Game.new(sceneManager)
	local self = setmetatable(Scene.new(sceneManager), Game)
	self.world = World.new()
	self.camera:setScale(1)

	return self
end

function Game:update(dt)
	if love.keyboard.isDown("left") then
		self.camera:move(-200 * dt, 0)
	end
	if love.keyboard.isDown("right") then
		self.camera:move(200 * dt, 0)
	end
	if love.keyboard.isDown("up") then
		self.camera:move(0, -200 * dt)
	end
	if love.keyboard.isDown("down") then
		self.camera:move(0, 200 * dt)
	end

	self.world:update(dt)
end

function Game:draw()
	self:attachCamera()
	self.world:draw()
	self:detachCamera()
end

function Game:keypressed(key)
	if key == "escape" then
		self.sceneManager:switch("menu")
	end
end

return Game
