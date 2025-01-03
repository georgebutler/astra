local SceneManager = require "engine.scenemanager"

function love.load()
    -- Load individual scenes
    local menuScene = require "scenes.menu"
    local gameScene = require "scenes.game"
    
    -- Register scenes with SceneManager
    SceneManager.register("menu", menuScene)
    SceneManager.register("game", gameScene)
    
    SceneManager.switch("menu")
end

function love.update(dt)
    SceneManager.update(dt)
end

function love.draw()
    SceneManager.draw()
end

function love.keypressed(key)
    SceneManager.keypressed(key)
end