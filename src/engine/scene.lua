local Scene = {}
Scene.__index = Scene

function Scene.new(sceneManager)
	local self = setmetatable({}, Scene)
	self.sceneManager = sceneManager

	return self
end

function Scene:update(dt) end
function Scene:draw() end
function Scene:keypressed(key) end
function Scene:load() end
function Scene:unload() end

return Scene
