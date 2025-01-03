local Config = require("config")
local SceneManager = require("engine.scenemanager")

function love.load()
	love.window.setMode(Config.WINDOW.WIDTH, Config.WINDOW.HEIGHT)
	love.window.setTitle(Config.WINDOW.TITLE)

	local MenuScene = require("scenes.menu")
	local GameScene = require("scenes.game")

	SceneManager:register("menu", MenuScene)
	SceneManager:register("game", GameScene)

	SceneManager:switch("menu")
end

function love.update(dt)
	SceneManager:update(dt)
end

function love.draw()
	SceneManager:draw()
end

function love.keypressed(key)
	SceneManager:keypressed(key)
end
