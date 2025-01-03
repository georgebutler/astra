local Config = require("config")

local World = {}
World.__index = World

function World.new()
	local self = setmetatable({}, World)
	self.tilemap = {}
	self.seed = love.math.random(-100.0, 100.0)

	local scale = 1 / (Config.TILES.SIZE * 2)
	local maxHeight = math.floor(Config.WORLD.SIZE / 2)

	for x = 1, Config.WORLD.SIZE do
		self.tilemap[x] = {}

		local noiseValue = love.math.noise(x * scale, self.seed)
		local height = math.floor(noiseValue * maxHeight)

		for y = 1, Config.WORLD.SIZE do
			if y > Config.WORLD.SIZE - height then
				self.tilemap[x][y] = 1
			else
				self.tilemap[x][y] = 0
			end
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
					"line",
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
