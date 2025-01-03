local Config = require("config")

local World = {}
World.__index = World

function World.new()
	local self = setmetatable({}, World)

	self.tilemap = {
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
	}

	return self
end

function World:update(dt)
	-- Update world state
end

function World:draw()
	for i, row in ipairs(self.tilemap) do
		for j, tile in ipairs(row) do
			if tile == 1 then
				love.graphics.rectangle(
					"line",
					j * Config.TILES.SIZE,
					i * Config.TILES.SIZE,
					Config.TILES.SIZE,
					Config.TILES.SIZE
				)
			end
		end
	end
end

return World
