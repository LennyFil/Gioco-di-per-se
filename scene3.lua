-----------------------------------------------------------------------------------------
--
-- scene3.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.hiddenStatusBar )

local storyboard = require "storyboard"
local scene = storyboard.newScene()
-- Your code here

local function backbtt(event)
	if( "ended" == event.phase ) then 
	storyboard.gotoScene("Scene1")
    end
end

--nuova scena -- 
function scene:createScene(event)
local sceneGroup = self.view

bg = display.newImageRect("foto.jpg", 520, 1000)
bg.x = display.contentWidth / 1.85
bg.y = display.contentHeight / 1.25
sceneGroup: insert(bg)

back = display.newImageRect("backbtt.png", 60, 60)
back.x = display.contentWidth - 100
back.y = display.contentHeight - 200
sceneGroup: insert(back)

end
--enter scena--
function scene:enterScene(evnet)
local sceneGroup = self.view

back:addEventListener("touch", backbtt)

end 

--exit scene--
function scene:exitScene(event)
local sceneGroup = self.view

end

--destroy scene--
function scene:destroyScene(event)
local sceneGroup = self.view



end


scene:addEventListener( "createScene", scene)
scene:addEventListener( "enterScene", scene)
scene:addEventListener( "exitScene", scene)
scene:addEventListener( "destroyScene", scene)

return scene 













