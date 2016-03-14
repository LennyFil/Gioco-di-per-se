-----------------------------------------------------------------------------------------
--
-- scene2.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.hiddenStatusBar )

local physics = require( "physics" )
physics.start()

local storyboard = require "storyboard"
local scene = storyboard.newScene()
-- Your code here

function scene:createScene(event)
local sceneGroup = self.view

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local altezza = display.contentHeight
local larghezza = display.contentWidth
local radius = 0
local xdirection = 1
local xspeed = 10
local screenTop = display.screenOriginY
local screenBottom = display.viewableContentHeight + display.screenOriginY
local screenLeft = display.screenOriginX
local screenRight = display.viewableContentWidth + display.screenOriginX

bg = display.newImageRect("foto.jpg", 520, 1000)
bg.x = display.contentWidth / 1.85
bg.y = display.contentHeight / 1.25
sceneGroup: insert(bg)

ground = display.newImageRect("ground.png", 480 , 90)
ground.x = larghezza / 2
ground.y = altezza * 1.075
physics.addBody( ground, "static", {friction=0.5, bounce=0.2}) 
sceneGroup:insert(bg)

back = display.newImageRect("backbtt.png", 50, 40)
back.x = display.contentWidth - 300
back.y = display.contentHeight - 500 
sceneGroup: insert(back)

replay = display.newImageRect("backbtt.png", 50, 40)
replay = display.contentWidth - 500
replay = display.contentHeight -500
sceneGroup: insert(back)

 local function spawnblock(event)

	local phase = event.phase
	if "ended" == phase then 
	cubo2 = display.newImageRect( "crate.png" , 100, 70)
	   physics.addBody( cubo2, { density=1000.0 , friction=0.01, bounce=0.01 } )
	end
		return true
		
end


local function movement(event)
	if(action == 'add') then

	centerX = centerX + ( xspeed * xdirection );
	

	if ( centerX > screenRight - radius or centerX < screenLeft + radius ) then
		xdirection = xdirection * -1;
	end
	cubo2:translate(centerX - cubo2.x, (centerY / 2)- cubo2.y )
end



bg.touch = onObjectTouch
bg:addEventListener( "touch", spawnblock )

end


--enter scena--
function scene:enterScene(evnet)
local sceneGroup = self.view



local function backbtt(event)
	if("ended" == event.phase) then 
	storyboard.gotoScene("scene1")
    end
end 
back:addEventListener("touch", backbtt)
end 

local function replaybtt(event)
	if("ended" == event.phase) then
	storyboard.gotoScene("scene2")
end
replay:addEventListener("touch", replaybtt)
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













