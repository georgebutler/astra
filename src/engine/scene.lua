local Scene = {}
Scene.__index = Scene

function Scene.new(sceneManager)
	local self = setmetatable({}, Scene)
	self.sceneManager = sceneManager
	self.camera = require("engine.camera").new()

	return self
end

function Scene:update(dt) end
function Scene:draw() end
function Scene:keypressed(key) end
function Scene:load() end
function Scene:unload() end

function Scene:attachCamera()
	self.camera:attach()
end

function Scene:detachCamera()
	self.camera:detach()
end

return Scene
