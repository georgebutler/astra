local SceneManager = {}

function SceneManager:init()
	self = setmetatable({}, { __index = SceneManager })
	self.scenes = {}
	self.currentScene = nil

	return self
end

function SceneManager:register(name, scene)
	self.scenes[name] = scene
end

function SceneManager:switch(sceneName)
	if self.scenes[sceneName] then
		if self.currentScene and self.currentScene.unload then
			self.currentScene:unload()
		end

		self.currentScene = self.scenes[sceneName].new(self)

		if self.currentScene.load then
			self.currentScene:load()
		end
	end
end

function SceneManager:update(dt)
	if self.currentScene then
		self.currentScene:update(dt)
	end
end

function SceneManager:draw()
	if self.currentScene then
		self.currentScene:draw()
	end
end

function SceneManager:keypressed(key)
	if self.currentScene then
		self.currentScene:keypressed(key)
	end
end

return SceneManager:init()
