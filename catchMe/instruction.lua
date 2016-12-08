local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"


---------------------------------------------------------------------------------

function scene:create( event )
    local sceneGroup = self.view

           backgroundImage = display.newImage ("instruction.png")
           backgroundImage.width = display.contentWidth
           backgroundImage.height = display.contentHeight
           backgroundImage.y = display.contentHeight/2
           backgroundImage.x = display.contentWidth/2

           backgroundImage:addEventListener("tap",handleEvent)

           sceneGroup:insert(backgroundImage)

end



function handleEvent(event)

    composer.gotoScene( "scene1", {effect = "crossFade", time = 800} )

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then


    elseif phase == "did" then


        
    end 
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then

    elseif phase == "did" then

        composer.removeScene("instruction")
		
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view

    -- Called prior to the removal of scene's "view" (sceneGroup)
    -- 
    -- INSERT code here to cleanup the scene
    -- e.g. remove display objects, remove touch listeners, save state, etc
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
