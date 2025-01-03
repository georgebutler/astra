local Config = require("config")

local World = {}
World.__index = World

function World.new()
	local self = setmetatable({}, World)
	self.tilemap = {}

	for x = 1, Config.WORLD.SIZE do
		self.tilemap[x] = {}

		for y = 1, Config.WORLD.SIZE do
			self.tilemap[x][y] = 1
		end
	end

	return self
end

function World:update(dt)
	-- Update world state
end

function World:draw()
	for x, row in ipairs(self.tilemap) do
		for y, tile in ipairs(row) do
			if tile == 1 then
				love.graphics.rectangle(
					"fill",
					x * Config.TILES.SIZE,
					y * Config.TILES.SIZE,
					Config.TILES.SIZE,
					Config.TILES.SIZE
				)
			end
		end
	end
end

return World
