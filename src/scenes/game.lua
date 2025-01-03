local game = {}

function game.init(manager)
    game.sceneManager = manager
end

function game.load()
    print("Game Loaded")
end

function game.update(dt)
    -- Game update logic
end

function game.draw()
    love.graphics.print("Game is Running", 400, 300)
end

function game.keypressed(key)
    if key == "escape" then
        game.sceneManager.switch("menu")
    end
end

return game