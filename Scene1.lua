-----------------------------------------------------------------------------------------
--
-- Scene1.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.hiddenStatusBar )
-- Your code here

local storyboard = require "storyboard"
local scene = storyboard.newScene()			

local function startbtt( event )
	if ( "ended" == event.phase) then 
	storyboard.gotoScene( "scene2" )
    end
end

local function scorebtt(event)
	if ( "ended" == event.phase) then 
	storyboard.gotoScene( "scene3" )
    end 
end 


--nuova scena--
function scene:createScene(event)	
local sceneGroup = self.view

bg = display.newImageRect("foto.jpg", 520, 1000)
bg.x = display.contentWidth / 1.85
bg.y = display.contentHeight / 1.25
sceneGroup: insert(bg)


start = display.newImageRect("bttstart.png", 300, 65)
start.x = display.contentCenterX
start.y = display.contentHeight - 400 
sceneGroup:insert(start)

score = display.newImageRect("scorebtt.png", 300, 65)
score.x = display.contentCenterX
score.y = display.contentHeight - 100
sceneGroup:insert(score)


end


--enter scena--
function scene:enterScene(evnet)
local sceneGroup = self.view

start:addEventListener("touch", startbtt)
score:addEventListener("touch", scorebtt)
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















