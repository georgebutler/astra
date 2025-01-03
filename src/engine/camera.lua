local Camera = {}
Camera.__index = Camera

function Camera.new()
	local self = setmetatable({}, Camera)
	self.x = 0
	self.y = 0
	self.scale = 1
	self.rotation = 0

	return self
end

function Camera:move(dx, dy)
	self.x = self.x + dx
	self.y = self.y + dy
end

function Camera:setPosition(x, y)
	self.x = x
	self.y = y
end

function Camera:setScale(scale)
	self.scale = scale
end

function Camera:setRotation(rotation)
	self.rotation = rotation
end

function Camera:attach()
	love.graphics.push()
	love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
	love.graphics.scale(self.scale)
	love.graphics.rotate(self.rotation)
	love.graphics.translate(-self.x, -self.y)
end

function Camera:detach()
	love.graphics.pop()
end

function Camera:screenToWorld(x, y)
	local cx = love.graphics.getWidth() / 2
	local cy = love.graphics.getHeight() / 2

	x = x - cx
	y = y - cy

	x = x / self.scale
	y = y / self.scale

	local cos = math.cos(-self.rotation)
	local sin = math.sin(-self.rotation)
	local rx = x * cos - y * sin
	local ry = x * sin + y * cos

	x = rx + self.x
	y = ry + self.y

	return x, y
end

return Camera
