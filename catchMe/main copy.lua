---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"


---------------------------------------------------------------------------------

local nextSceneButton

function scene:create( event )
    sceneGroup = self.view

    backgroundImage = display.newImage ("gameStandard.png")
    backgroundImage.width = display.contentWidth
    backgroundImage.height = display.contentHeight
    backgroundImage.y = display.contentHeight/2
    backgroundImage.x = display.contentWidth/2

    middleRect = display.newRect(display.contentWidth/2 + 2,display.contentHeight/2 + 70,150,200)
    middleRect.alpha = 0

    leftRect = display.newRect(display.contentWidth/5.5 + 5,display.contentHeight/2 + 70,150,200)
    leftRect.alpha = 0

    rightRect = display.newRect(display.contentWidth/2  + 178,display.contentHeight/2 + 70,150,200)
    rightRect.alpha = 0

    hitText = display.newText("",100,100,native.systemFont,15)
--[[
    score = 0
    countdownTimer = 3
    countDown = display.newText("Starting in.."..countdownTimer,display.contentWidth/2,display.contentHeight/2,native.systemFont,40)
    timer.performWithDelay(1000,timerDown,3)]]

    --timer.performWithDelay(3000,spawnMonsters)

    myText = display.newText( "", display.contentWidth/2 + 230, display.contentHeight/8 , native.systemFont, 28 )
    myText:setFillColor( 1, 0, 0 )

    sceneGroup:insert(backgroundImage)
    sceneGroup:insert(myText)
    sceneGroup:insert(middleRect)
    sceneGroup:insert(leftRect)
    sceneGroup:insert(rightRect)
    sceneGroup:insert(hitText)
    --sceneGroup:insert(countDown)

    sheetData = {
                        width = 156,
                        height = 186,
                        numFrames = 4,
                        sheetContentWidth = 624,
                        sheetContentHeight = 186
              }

    imageSheet = graphics.newImageSheet( "noobBlob.png", sheetData )

    sheetData2= {
                        width = 155,
                        height = 186,
                        numFrames = 8,
                        sheetContentWidth = 1240,
                        sheetContentHeight = 186
              }

    imageSheet2 = graphics.newImageSheet( "improvedBlob.png", sheetData2 )

    sheetData3 = {
                        width = 82,
                        height = 72,
                        numFrames = 5,
                        sheetContentWidth = 410,
                        sheetContentHeight = 72
              }

    imageSheet3 = graphics.newImageSheet( "heart.png", sheetData3 )

    sheetData4 = {
                        width = 1334,
                        height = 750,
                        numFrames = 3,
                        sheetContentWidth = 4002,
                        sheetContentHeight = 750
              }

    imageSheet4 = graphics.newImageSheet( "danger4.png", sheetData4 )

    sequenceData =
                    {
                        {name="walking", sheet = imageSheet, start=1, count=4, time=1000, loopCount = 0, loopDirection = "bounce"},
                        {name="running", sheet = imageSheet2, start=1, count=8, time=800, loopCount = 0, loopDirection = "bounce"}
                    }

        sequenceData2 =
                    {
                        {name="5Health", sheet = imageSheet3, start=1, count=1, time=1000, loopCount = 1, loopDirection = "forward"},
                        {name="4Health", sheet = imageSheet3, start=2, count=1, time=1000, loopCount = 1, loopDirection = "forward"},
                        {name="3Health", sheet = imageSheet3, start=3, count=1, time=1000, loopCount = 1, loopDirection = "forward"},
                        {name="2Health", sheet = imageSheet3, start=4, count=1, time=1000, loopCount = 1, loopDirection = "forward"},
                        {name="1Health", sheet = imageSheet3, start=5, count=1, time=1000, loopCount = 1, loopDirection = "forward"}
                    }

        sequenceData3 =
                    {
                        {name="danger", sheet = imageSheet4, start=1, count=3, time=700, loopCount = 0, loopDirection = "bounce"}
                    }
                  spawnMonsters()

end

function timerDown()
    countdownTimer = countdownTimer - 1
    countDown.text = "Starting in.." .. countdownTimer
print(countdownTimer)
    if countdownTimer == 0 then
        countDown.text = ""
        myText.text = score
        spawnMonsters()
    end
end

function decreaseLive(event)
    if event.phase == "began" and heartBeat.sequence == "5Health" then
        heartBeat:setSequence("4Health")
elseif  event.phase == "began" and heartBeat.sequence == "4Health" then
        heartBeat:setSequence("3Health")

elseif  event.phase == "began" and heartBeat.sequence == "3Health" then
        heartBeat:setSequence("2Health")

elseif  event.phase == "began" and heartBeat.sequence == "2Health" then
    dangerSign()
        heartBeat:setSequence("1Health")

elseif  event.phase == "began" and heartBeat.sequence == "1Health" then
        timer.cancel(onTimer)
        audio.pause( backgroundMusicChannel )
        exitScene()

end
    end

function spawnMonsters()

    blobGenerator = math.random(1,3)
    
    platformImage1 = display.newImage ("Platform_03.png")
    platformImage1.width = display.contentWidth/4
    platformImage1.height = display.contentHeight/4
    platformImage1.y = display.contentHeight/2 + 110
    platformImage1.x = display.contentWidth/2 - 180

    platformImage2 = display.newImage ("Platform_05.png")
    platformImage2.width = display.contentWidth/4
    platformImage2.height = display.contentHeight/4
    platformImage2.y = display.contentHeight/2 + 110
    platformImage2.x = display.contentWidth/2

    platformImage3 = display.newImage ("Platform_07.png")
    platformImage3.width = display.contentWidth/4
    platformImage3.height = display.contentHeight/4
    platformImage3.y = display.contentHeight/2 + 110
    platformImage3.x = display.contentWidth/2 + 180

    heartImage = display.newImage ("gate.png")
    heartImage.x = display.contentWidth/2
    heartImage.y = display.contentHeight/2 - 50
    heartImage.xScale = display.contentWidth/1200
    heartImage.yScale = heartImage.xScale

    character = display.newSprite( imageSheet, sequenceData )
    character.xScale = display.contentWidth/1500
    character.yScale = character.xScale
    character.y = display.contentHeight/2 + 75
    firstCharacter()
    character:play() 
    character:addEventListener("touch",killMonster)
    transition.to( character, { time=1500, alpha=0, onComplete=listener1 } )
    backgroundMusic = audio.loadStream( "Test.mp3" )
    backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=1000 } )
    audio.pause( backgroundMusicChannel )

    heartBeat = display.newSprite(imageSheet3, sequenceData2)
    --heartBeat:setSequence("1Health")
    heartBeat.xScale = display.contentWidth/1000
    heartBeat.yScale = heartBeat.xScale
    heartBeat.x = display.contentWidth/2 
    heartBeat.y =display.contentHeight/2 - 63
    heartBeat:play() 

    sceneGroup:insert(platformImage1)
    sceneGroup:insert(platformImage2)
    sceneGroup:insert(platformImage3)
    sceneGroup:insert(character)
    sceneGroup:insert(heartBeat)
    sceneGroup:insert(heartImage)

    time = 60
    onTimer = timer.performWithDelay(300,decreaseTime,0)

    if blobGenerator == 1 then

        character.x = platformImage1.x
        middleRect.alpha = 0.1
        rightRect.alpha = 0.1
        leftRect.alpha = 0
        hitText.x = platformImage1.x
        hitText.y = platformImage1.y + 40

elseif blobGenerator == 2 then

        character.x = platformImage2.x
        leftRect.alpha = 0.1
        middleRect.alpha = 0
        rightRect.alpha = 0.1
hitText.x = platformImage2.x
hitText.y = platformImage1.y + 40
elseif blobGenerator == 3 then

        character.x = platformImage3.x
        leftRect.alpha = 0.1
        middleRect.alpha = 0.1
        rightRect.alpha = 0
hitText.x = platformImage3.x
hitText.y = platformImage1.y + 40
    end

    leftRect:addEventListener("touch",decreaseLive)
    rightRect:addEventListener("touch",decreaseLive)
    middleRect:addEventListener("touch",decreaseLive)
end

function listener1()
print("dead")
end

function firstCharacter()

    randomizer = math.random(1,2)

    if randomizer == 1 then 

        character:setSequence("walking")
      monsterLife = 2
hitText.text = monsterLife.." Hit(s)"

    elseif randomizer == 2 then
character:setSequence("running")

monsterLife = 1
hitText.text = monsterLife.." Hit(s)"
    end
end

function killMonster(event)
--print(event.numTaps)
    if  event.phase == "ended" and character.sequence == "walking" then
       -- print(5)
       twoLives()

elseif event.phase == "ended" and character.sequence == "running" then
oneLife()
   end     
end

function oneLife()
time = 60
          rightRect.alpha = 0
          leftRect.alpha = 0
          middleRect.alpha = 0
          blobGenerator2 = math.random(1,3)
        monsterSelector = math.random(1,3)
        audio.resume( backgroundMusicChannel )
        playing()
end

function twoLives()
        if myLife == nil then
            monsterLife = 1
hitText.text = monsterLife.." Hit(s)"
            myLife = 2
            myLife = myLife - 1
    elseif myLife ~= nil and myLife ~= 1 then
            myLife = myLife -1

        elseif myLife == 1 then
            myLife = nil
          time = 60
          rightRect.alpha = 0
          leftRect.alpha = 0
          middleRect.alpha = 0
          blobGenerator2 = math.random(1,3)
        monsterSelector = math.random(1,3)
        audio.resume( backgroundMusicChannel )
        playing()
        end
       -- print(myLife)
    end

function decreaseTime()

time = time - 1
print(time)

    if time == 56 and heartBeat.sequence == "5Health" then
       -- dangerSign()
        heartBeat:setSequence("4Health")
        heartBeat:play()
        audio.pause( backgroundMusicChannel )

        

elseif time == 56 and heartBeat.sequence == "4Health"  then
        heartBeat:setSequence("3Health")
        print("4ealth")
        heartBeat:play()
        audio.pause( backgroundMusicChannel )

elseif time == 56 and heartBeat.sequence == "3Health" then
        heartBeat:setSequence("2Health")
        heartBeat:play()
        audio.pause( backgroundMusicChannel )

elseif time == 56 and heartBeat.sequence == "2Health" then
        dangerSign()
        heartBeat:setSequence("1Health")
        heartBeat:play()
        audio.pause( backgroundMusicChannel )

elseif time == 56 and heartBeat.sequence == "1Health" then
    --dangerSign()
timer.cancel(onTimer)

        audio.pause( backgroundMusicChannel )
      exitScene()
    end
end

function exitScene()
    print("hello"..score)
composer.gotoScene( "scoringScreen", {effect = "slideLeft", time = 800, params = {myScore = score}} )
   -- print("Bye"..myScore)
end

function resumeMusic()
if audio.isChannelPaused(backgroundMusicChannel) == true then
    audio.resume( backgroundMusicChannel )
end
    end

function dangerSign()

    dangerIcon = display.newSprite(imageSheet4, sequenceData3)
    dangerIcon.xScale = display.contentWidth/1300
    dangerIcon.yScale = display.contentHeight/700
    dangerIcon.x = display.contentWidth/2 
    dangerIcon.y =display.contentHeight/2
    dangerIcon:play() 

    sceneGroup:insert(dangerIcon)

end

function playing(event)
     --   timer.performWithDelay(1000,pauseMusic)
        score = score + 1
        myText.text = score
        character:pause()
        character:removeSelf()
        character = nil

        character = display.newSprite( imageSheet, sequenceData )
        character.xScale = display.contentWidth/1500
        character.yScale = character.xScale
        character.y = display.contentHeight/2 + 75

        if blobGenerator2 == 1 then
            standard()
            character.x = platformImage1.x
            leftRect.alpha = 0
            middleRect.alpha = 0.1
            rightRect.alpha = 0.1
            hitText.x = platformImage1.x
hitText.y = platformImage1.y +40

    elseif blobGenerator2 == 2 then
            standard()
            leftRect.alpha = 0.1
        middleRect.alpha = 0
        rightRect.alpha = 0.1
            character.x = platformImage2.x
            hitText.x = platformImage2.x
hitText.y = platformImage2.y + 40

    elseif blobGenerator2 == 3 then
           standard()
           leftRect.alpha = 0.1
        middleRect.alpha = 0.1
        rightRect.alpha = 0
            character.x = platformImage3.x
            hitText.x = platformImage3.x
hitText.y = platformImage3.y + 40

    end

        character:addEventListener("touch",killMonster)
        character:play() 

end

function standard()
    test = math.random(1,2)

    if test == 1 then
        monsterLife = 1
hitText.text = monsterLife.." Hit(s)"
        character:setSequence("running")
elseif test == 2 then
    monsterLife = 2
    hitText.text = monsterLife.." Hit(s)"
    character:setSequence("walking")
    end
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is still off screen and is about to move on screen

    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- 
        -- INSERT code here to make the scene come alive
        -- e.g. start timers, begin animation, play audio, etc
    
    end 
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
            print("executed")
            character:removeSelf()
            character=nil
            time=60
            audio.rewind( backgroundMusicChannel )
            audio.stop( backgroundMusicChannel )
        composer.removeScene("scene2")

    elseif phase == "did" then
        -- Called when the scene is now off screen

		
    end 
end


function scene:destroy( event )
    local sceneGroup = self.view

    print("ME2")
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
