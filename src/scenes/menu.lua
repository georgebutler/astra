local menu = {}

function menu.init(manager)
    menu.sceneManager = manager
end

function menu.load()
    print("Menu Loaded")
end

function menu.update(dt)
    -- Menu update logic
end

function menu.draw()
    love.graphics.print("Press Enter to Start", 400, 300)
end

function menu.keypressed(key)
    if key == "return" then
        menu.sceneManager.switch("game")
    end
end

return menu