local SceneManager = {
    scenes = {},
    currentScene = nil
}

function SceneManager.register(name, scene)
    SceneManager.scenes[name] = scene
    if scene.init then scene.init(SceneManager) end
end

function SceneManager.switch(sceneName)
    if SceneManager.scenes[sceneName] then
        if SceneManager.currentScene and SceneManager.currentScene.unload then
            SceneManager.currentScene.unload()
        end
        SceneManager.currentScene = SceneManager.scenes[sceneName]
        if SceneManager.currentScene.load then
            SceneManager.currentScene.load()
        end
    end
end

function SceneManager.update(dt)
    if SceneManager.currentScene and SceneManager.currentScene.update then
        SceneManager.currentScene.update(dt)
    end
end

function SceneManager.draw()
    if SceneManager.currentScene and SceneManager.currentScene.draw then
        SceneManager.currentScene.draw()
    end
end

function SceneManager.keypressed(key)
    if SceneManager.currentScene and SceneManager.currentScene.keypressed then
        SceneManager.currentScene.keypressed(key)
    end
end

return SceneManager