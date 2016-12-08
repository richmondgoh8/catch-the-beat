local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local json = require("json")
local chartboost = require( "plugin.chartboost" )


---------------------------------------------------------------------------------

function scene:create( event )
    local sceneGroup = self.view

           yourAppID        = "55b62548c909a66b4389ca5e"
           yourAppSignature = "706873815c8cbbe88a293cc59323dbd9705c7106"

           print("Chartboost plugin version: ".. chartboost.getPluginVersion())
           print("Using ("..yourAppID..")("..yourAppSignature..")")

           function chartBoostListener( event )
                if event.type == "interstitial" and (event.response == "closed" or event.response == "clicked" or event.response == "failed") then
                       composer.gotoScene( "scene2", {effect = "crossFade", time = 800, params={musicID=uniqueID}}  )
                end
            end

           chartboost.init {
                appID        = yourAppID,
                appSignature = yourAppSignature, 
                listener     = chartBoostListener
                           }

           currentID = 1

           Runtime:addEventListener( "system", systemEvent2 )

           backgroundImage = display.newImage ("musicSelection/HDWALL2.png")
           backgroundImage.width = display.contentWidth
           backgroundImage.height = display.contentHeight
           backgroundImage.y = display.contentHeight/2
           backgroundImage.x = display.contentWidth/2

           swipeLayer = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight )
           swipeLayer.alpha=0 --make it transparent
           swipeLayer.isHitTestable = true

           titleImage = display.newImage("musicSelection/musicTitle.png")
           titleImage.x = display.contentWidth/2
           titleImage.y = display.contentHeight/2 - 100
           titleImage.xScale = display.contentWidth/1000
           titleImage.yScale = titleImage.xScale

           firstImage = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 - 40,
                                        id = "Time",
                                        defaultFile = "musicSelection/time.png",
                                        overFile = "musicSelection/time.png",
                                        onEvent = musicReady
                                      }

           firstImage.xScale = display.contentWidth/1100  
           firstImage.yScale = firstImage.xScale

           firstImageX = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 - 40,
                                        id = "MyHeart",
                                        defaultFile = "musicSelection/MyHeart.png",
                                        overFile = "musicSelection/MyHeart.png",
                                        onEvent = musicReady
                                      }

           firstImageX.xScale = display.contentWidth/1100  
           firstImageX.yScale = firstImageX.xScale
           firstImageX.alpha = 0

           firstImageX2 = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 - 40,
                                        id = "Nameless",
                                        defaultFile = "musicSelection/Thenameless.png",
                                        overFile = "musicSelection/Thenameless.png",
                                        onEvent = musicReady
                                      }

           firstImageX2.xScale = display.contentWidth/1100  
           firstImageX2.yScale = firstImageX2.xScale
           firstImageX2.alpha = 0

           firstImageX22 = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 - 40,
                                        id = "Go",
                                        defaultFile = "musicSelection/Go.png",
                                        overFile = "musicSelection/Go.png",
                                        onEvent = musicReady
                                      }

           firstImageX22.xScale = display.contentWidth/1100  
           firstImageX22.yScale = firstImageX22.xScale
           firstImageX22.alpha = 0

           secondImage = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 10,
                                        id = "Nova",
                                        defaultFile = "musicSelection/Nova.png",
                                        overFile = "musicSelection/Nova.png",
                                        onEvent = musicReady
                                      }

           secondImage.xScale = display.contentWidth/1100  
           secondImage.yScale = secondImage.xScale

           secondImageX = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 10,
                                        id = "Frag",
                                        defaultFile = "musicSelection/Frag.png",
                                        overFile = "musicSelection/Frag.png",
                                        onEvent = musicReady
                                      }

           secondImageX.xScale = display.contentWidth/1100  
           secondImageX.yScale = secondImageX.xScale
           secondImageX.alpha = 0

           secondImageX2 = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 10,
                                        id = "Panda",
                                        defaultFile = "musicSelection/Panda.png",
                                        overFile = "musicSelection/Panda.png",
                                        onEvent = musicReady
                                      }

           secondImageX2.xScale = display.contentWidth/1100  
           secondImageX2.yScale = secondImageX2.xScale
           secondImageX2.alpha = 0

           secondImageX22 = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 10,
                                        id = "Goodbye",
                                        defaultFile = "musicSelection/Goodbye.png",
                                        overFile = "musicSelection/Goodbye.png",
                                        onEvent = musicReady
                                      }

           secondImageX22.xScale = display.contentWidth/1100  
           secondImageX22.yScale = secondImageX22.xScale
           secondImageX22.alpha = 0

           thirdImage = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 60,
                                        id = "Fade",
                                        defaultFile = "musicSelection/Fade.png",
                                        overFile = "musicSelection/Fade.png",
                                        onEvent = musicReady
                                      }

           thirdImage.xScale = display.contentWidth/1100  
           thirdImage.yScale = thirdImage.xScale

           thirdImageX = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 60,
                                        id = "Blank",
                                        defaultFile = "musicSelection/Disfigure.png",
                                        overFile = "musicSelection/Disfigure.png",
                                        onEvent = musicReady
                                      }

           thirdImageX.xScale = display.contentWidth/1100  
           thirdImageX.yScale = thirdImageX.xScale
           thirdImageX.alpha = 0

           thirdImageX2 = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 60,
                                        id = "Fly",
                                        defaultFile = "musicSelection/Fly.png",
                                        overFile = "musicSelection/Fly.png",
                                        onEvent = musicReady
                                      }

           thirdImageX2.xScale = display.contentWidth/1100  
           thirdImageX2.yScale = thirdImageX2.xScale
           thirdImageX2.alpha = 0

           thirdImageX22 = widget.newButton {
                                        x=display.contentWidth/2,
                                        y=display.contentHeight/2 + 60,
                                        id = "Flames",
                                        defaultFile = "musicSelection/Flames.png",
                                        overFile = "musicSelection/Flames.png",
                                        onEvent = musicReady
                                      }

           thirdImageX22.xScale = display.contentWidth/1100  
           thirdImageX22.yScale = thirdImageX22.xScale
           thirdImageX22.alpha = 0

           pageImage = display.newImage( "musicSelection/Page1.png",display.contentWidth/2,display.contentHeight/2 + 120)
           pageImage.xScale = display.contentWidth/1200
           pageImage.yScale = pageImage.xScale

           pageImage2 = display.newImage( "musicSelection/Page2.png",display.contentWidth/2,display.contentHeight/2 + 120)
           pageImage2.xScale = display.contentWidth/1200
           pageImage2.yScale = pageImage.xScale
           pageImage2.alpha = 0

           pageImage3 = display.newImage( "musicSelection/Page3.png",display.contentWidth/2,display.contentHeight/2 + 120)
           pageImage3.xScale = display.contentWidth/1200
           pageImage3.yScale = pageImage.xScale
           pageImage3.alpha = 0

           pageImage4 = display.newImage( "musicSelection/Page4.png",display.contentWidth/2,display.contentHeight/2 + 120)
           pageImage4.xScale = display.contentWidth/1200
           pageImage4.yScale = pageImage.xScale
           pageImage4.alpha = 0

           firstMusic    = audio.loadStream( "Music/Aero Chord - Time Leap.mp3" )
           secondMusic   = audio.loadStream( "Music/Ahrix - Nova.mp3" )
           thirdMusic    = audio.loadStream( "Music/Alan Walker - Fade.mp3" )
           fourthMusic   = audio.loadStream( "Music/Different Heaven & EH!DE - My Heart.mp3" )
           fifthMusic    = audio.loadStream( "Music/DJ ASSASS1N - Frag Out (Official HQ Download).mp3" )
           sixthMusic    = audio.loadStream( "Music/Disfigure - Blank.mp3" )
           seventhMusic  = audio.loadStream( "Music/Elliot Berger - The Nameless.mp3" )
           eigthMusic    = audio.loadStream( "Music/Itro - Panda.mp3" )
           ninthMusic    = audio.loadStream( "Music/Krys Talk - Fly Away.mp3" )
           tenthMusic    = audio.loadStream( "Music/Lensko - Lets Go.mp3" )
           eleventhMusic = audio.loadStream( "Music/Tobu - Sound of Goodbye.mp3" )
           twelvethMusic = audio.loadStream( "Music/Vena Cava & Project Veresen feat. Raya - Flames.mp3" )

           --backgroundMusicChannel = audio.play( eleventhMusic, { channel=1, loops=-1, fadein=100 } )


           swipeLayer:addEventListener("touch", startDrag)
           sceneGroup:insert(backgroundImage)
           sceneGroup:insert(swipeLayer)
           sceneGroup:insert(titleImage)
           sceneGroup:insert(firstImage)
           sceneGroup:insert(secondImage)
           sceneGroup:insert(thirdImage)
           sceneGroup:insert(pageImage)
           sceneGroup:insert(pageImage2)
           sceneGroup:insert(pageImage3)
           sceneGroup:insert(pageImage4)
           sceneGroup:insert(firstImageX)
           sceneGroup:insert(secondImageX)
           sceneGroup:insert(thirdImageX)
           sceneGroup:insert(firstImageX2)
           sceneGroup:insert(secondImageX2)
           sceneGroup:insert(thirdImageX2)
           sceneGroup:insert(firstImageX22)
           sceneGroup:insert(secondImageX22)
           sceneGroup:insert(thirdImageX22)


end

function startDrag(event)
      local swipeLength = math.abs(event.x - event.xStart) 
     -- print(event.phase, swipeLength)
      local t = event.target
      local phase = event.phase
          if "began" == phase then

              return true

      elseif "moved" == phase then

      elseif "ended" == phase or "cancelled" == phase then

          if event.xStart > event.x and swipeLength > 50 then 

                  print("Swiped Left")
                  forwardPage()

              elseif event.xStart < event.x and swipeLength > 50 then 

                  print( "Swiped Right" )
                  backPage()

          end 

          end
end

function systemEvent2( event )
    local phase = event.phase

    if event.type == "applicationResume" then
        -- Start a ChartBoost session
        chartboost.startSession( yourAppID, yourAppSignature )
    end
    
    return true
end

function forwardPage()

    if currentID == 1 then 

        universalFirst()

        currentID = 2
        pageImage.alpha = 0
        pageImage2.alpha = 1

elseif currentID == 2 then

        universalFirst()

        currentID = 3
        pageImage2.alpha = 0
        pageImage3.alpha = 1


elseif currentID == 3 then

        universalFirst()

        currentID = 4 
        pageImage3.alpha = 0
        pageImage4.alpha = 1

elseif currentID == 4 then

        universalFirst()

        currentID = 1
        pageImage4.alpha = 0
        pageImage.alpha = 1

    end
end

function universalFirst()
    if currentID == 1 then
      firstImage.alpha = 0
      secondImage.alpha = 0
      thirdImage.alpha = 0
      firstImageX.alpha = 1
      secondImageX.alpha = 1
      thirdImageX.alpha = 1

elseif currentID == 2 then

      firstImageX.alpha = 0
      secondImageX.alpha = 0
      thirdImageX.alpha = 0

      firstImageX2.alpha = 1
      secondImageX2.alpha = 1
      thirdImageX2.alpha = 1

elseif currentID == 3 then

      firstImageX2.alpha = 0
      secondImageX2.alpha = 0
      thirdImageX2.alpha = 0

      firstImageX22.alpha = 1
      secondImageX22.alpha = 1
      thirdImageX22.alpha = 1

elseif currentID == 4 then
  
      firstImageX22.alpha = 0
      secondImageX22.alpha = 0
      thirdImageX22.alpha = 0

      firstImage.alpha = 1
      secondImage.alpha = 1
      thirdImage.alpha = 1

    end
end

function backPage()

    if currentID == 4 then

        universalSecond()

        currentID = 3
        pageImage4.alpha = 0
        pageImage3.alpha = 1


elseif currentID == 3 then

        universalSecond()

        currentID = 2 
        pageImage3.alpha = 0
        pageImage2.alpha = 1

elseif currentID == 2 then

        universalSecond()

        currentID = 1
        pageImage2.alpha = 0
        pageImage.alpha = 1

elseif currentID == 1 then

        universalSecond()

        currentID = 4
        pageImage.alpha = 0
        pageImage4.alpha = 1

    end
end

function universalSecond()

    if currentID == 1 then

        firstImage.alpha = 0
        secondImage.alpha = 0
        thirdImage.alpha = 0

        firstImageX22.alpha = 1
        secondImageX22.alpha = 1
        thirdImageX22.alpha = 1

elseif currentID == 4 then

        firstImageX22.alpha = 0
        secondImageX22.alpha = 0
        thirdImageX22.alpha = 0

        firstImageX2.alpha = 1
        secondImageX2.alpha = 1
        thirdImageX2.alpha = 1

elseif currentID == 3 then

        firstImageX2.alpha = 0
        secondImageX2.alpha = 0
        thirdImageX2.alpha = 0

        firstImageX.alpha = 1
        secondImageX.alpha = 1
        thirdImageX.alpha = 1

elseif currentID == 2 then

        firstImageX.alpha = 0
        secondImageX.alpha = 0
        thirdImageX.alpha = 0   

        firstImage.alpha = 1
        secondImage.alpha = 1
        thirdImage.alpha = 1

    end
end

function musicReady(event)

myGameSettings = loadTable("gameScore.json")
--print(myGameSettings.score)

    if event.phase == "began" and event.target.id == "Time" then
       uniqueID = "Time"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

elseif event.phase == "began" and event.target.id == "Nova" then

       uniqueID = "Nova"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )


elseif event.phase == "began" and event.target.id == "Fade"  then

       uniqueID = "Fade"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

elseif event.phase == "began" and event.target.id == "MyHeart" then

       myHeartX()

elseif event.phase == "began" and event.target.id == "Frag" then
       
       myFragX()

elseif event.phase == "began" and event.target.id == "Blank" then
       
       myBlankX()

elseif event.phase == "began" and event.target.id == "Nameless" then
       
       myNamelessX()

elseif event.phase == "began" and event.target.id == "Panda" then

       myPandaX()

elseif event.phase == "began" and event.target.id == "Fly" then

       myFlyX()

elseif event.phase == "began" and event.target.id == "Go" then
       
       myGoX()

elseif event.phase == "began" and event.target.id == "Goodbye" then

       myGoodbyeX()

elseif event.phase == "began" and event.target.id == "Flames" then

       myFlameX()

    end
end

function myHeartX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 50 then 

       uniqueID = "Heart"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 49 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 50 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 50 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function onComplete()

end

function myFragX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 50 then 

       uniqueID = "Frag"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 49 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 50 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 50 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myBlankX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 50 then 

       uniqueID = "Blank"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 49 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 50 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 50 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myNamelessX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 100 then 

       uniqueID = "Name"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 99 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 100 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 100 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myPandaX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 100 then 

       uniqueID = "Panda"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 99 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 100 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 100 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myFlyX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 100 then 

       uniqueID = "Fly"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 99 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 100 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 100 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myGoX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 150 then 

       uniqueID = "Go"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 149 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 150 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 150 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myGoodbyeX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 150 then 

       uniqueID = "Goodbye"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 149 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 150 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 150 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function myFlameX()

    if myGameSettings ~= nil then

        if myGameSettings.score >= 150 then 

       uniqueID = "Flames"
       chartboost.cache( "interstitial" )
       chartboost.show( "interstitial" )

        elseif myGameSettings.score <= 149 then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 150 Pts is Needed", {"Search New Songs"}, onComplete )

        end

elseif myGameSettings  == nil then

          alert = native.showAlert( "Requirement Not Met!!", "Minimum Requirement of 150 Pts is Needed", {"Search New Songs"}, onComplete )

    end
end

function handleEvent(event)

    composer.gotoScene( "scene1", {effect = "crossFade", time = 800} )

end

function saveTable(t,filename)

    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")

    if file then
        local contents = json.encode(t)
        file:write( contents )
        io.close( file )
        return true
  else 
        return false  
    end
end

function loadTable(filename)

    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )

    if file then
        local contents = file:read( "*a" )
        myTable = json.decode(contents);
        io.close( file )
        return myTable 
    end
    return nil
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
        composer.removeScene("musicSelection")
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
