local composer = require( "composer" )
local scene = composer.newScene()
local widget = require "widget"
local json = require("json")
local parse = require( "mod_parse" )

---------------------------------------------------------------------------------

function scene:create( event )
           sceneGroup = self.view

           --Only 1 Function is being called in this function scene

           display.setDefault( "background", 34/255, 49/255, 63/255 )

           defaultName = system.getInfo("deviceID")

           backgroundImage = display.newImage ("gameStandard2.png")
           backgroundImage.width = display.contentWidth
           backgroundImage.height = display.contentHeight
           backgroundImage.y = display.contentHeight/2
           backgroundImage.x = display.contentWidth/2

           placeHolder = display.newRect(display.contentWidth/2,display.contentHeight/2,display.contentWidth,display.contentHeight)
           placeHolder.alpha = 0

           testing = display.newText("Personal Stats",display.contentWidth/2 + 110  ,display.contentHeight/2 - 100,"CF Boston",27)
           testing:setFillColor(220/255,220/255,220/255)

           hallText = display.newText("Hall of Fame",display.contentWidth/2 - 125  ,display.contentHeight/2 - 100,"CF Boston",27)
           hallText:setFillColor(220/255,220/255,220/255)

           testing2 = display.newText("Kill Streak",display.contentWidth/2 + 110,display.contentHeight/2 - 15  ,"CF Boston",18)
           testing2:setFillColor(1,1,1)

           nameHolder = display.newText("Name: Nil",display.contentWidth/2 + 110,display.contentHeight/2 - 50 ,"CF Boston",18)
           nameHolder:setFillColor(1,1,1)

           positionHolder = display.newText("Position: Nil",display.contentWidth/2 + 110,display.contentHeight/2 + 20 ,"CF Boston",18)
           positionHolder:setFillColor(1,1,1)

         --  native.setActivityIndicator( true )

       --    userText = display.newText("Name: ".. defaultName .. " [[Click to Edit]]",display.contentWidth/2,display.contentHeight - 30 ,"Bleeding Cowboys",18)
        --   userText:setFillColor(0,0,0)
        --   userText:addEventListener("tap",retrieveRecords)
           internetChecker()
           scoreChecker()

           backButton = widget.newButton
                                        {
                                            x = display.contentWidth/2 + 100,
                                            y = display.contentHeight/2 + 60,
                                            width = display.contentWidth/4,
                                            height = display.contentHeight/8,
                                            defaultFile = "default2.png",
                                            overFile = "default2.png",
                                            label = "",
                                            id = "goBack",
                                            onEvent = checkStatus
                                        }

           editButton = widget.newButton
                                        {
                                            x = display.contentWidth/2 + 100,
                                            y = display.contentHeight/2 + 100,
                                            width = display.contentWidth/4,
                                            height = display.contentHeight/8,
                                            defaultFile = "editButton.png",
                                            overFile = "editButton2.png",
                                            label = "",
                                            id = "goBack",
                                            onEvent = editor
                                        }


                                       tableView = widget.newTableView
                                      {
                                          left = 70,
                                          top = 90,
                                          height = display.contentHeight/2.1,
                                          width = display.contentWidth/3,
                                          onRowRender = onRowRender,
                                          onRowTouch = onRowTouch,
                                          listener = scrollListener,
                                          hideBackground = true,
                                          noLines = true
                                      }



         -- retrieveRecords()

           sceneGroup:insert(backgroundImage)
           sceneGroup:insert(placeHolder)
           sceneGroup:insert(testing)
           sceneGroup:insert(hallText)
           sceneGroup:insert(testing2)
       --    sceneGroup:insert(userText)
           sceneGroup:insert(backButton)
           sceneGroup:insert(editButton)
           sceneGroup:insert(tableView)
           sceneGroup:insert(nameHolder)
           sceneGroup:insert(positionHolder)
end

function internetChecker(event)

network.request("http://www.google.com.sg", "GET", internetListener)

end

function internetListener(event)
      if event.isError then
        native.showAlert("Alert!","Internet Connection is Required For This Page.",{"Exit"},onClosePage)
    else 
      --  native.showAlert("Alert!","Internet Connection is Required For This Page.",{"Exit"},onClosePage)
    end
end 

function onClosePage(event)
composer.gotoScene("scene1",{time=800,effect="crossFade"})
end


function editor(event)

    if event.phase == "began" then

usernameField = native.newTextField( display.contentWidth/2, display.contentHeight/2 - 70, 300, 50 )
usernameField.font = native.newFont( "Bleeding Cowboys" )
usernameField.text = ""
usernameField.align = "center"
usernameField.placeholder = "Input New Name"
usernameField.hasBackground = false
usernameField:setTextColor( 1, 1, 1 )
usernameField.size = 200
usernameField:resizeFontToFitHeight()
usernameField:addEventListener( "userInput", onUsername )
--sceneGroup:insert(usernameField)
native.setKeyboardFocus( usernameField )

myRectangle = display.newRect( display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight )
myRectangle.strokeWidth = 3
myRectangle:setFillColor( 0.5 )
myRectangle.alpha = 0.6
myRectangle:setStrokeColor( 1, 1, 1 )

print("inserted!")

    end
end

function onUsername( event )
    if ( "began" == event.phase ) then

        --  backButton.alpha = 0

        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
      --  print("hello" ..  event.target.text)
      print("Run how many times")
        savedName = event.target.text
        native.setKeyboardFocus( nil )
        usernameField:removeSelf()
        usernameField = nil
        myRectangle:removeSelf()
        myRectangle = nil
        updatePlayer()
     --   print("Saved" .. saveText)
    end
end


function onRowRender( event )
print("rendering")
    local phase = event.phase
    local row = event.row
    local id = row.index

    rowHeight = row.contentHeight
    rowWidth = row.contentWidth
    print("name" .. user[1].name .. "score" .. user[1].score .. "row"..row.index .. "userID " .. id)
    t = display.newText( row,   row.index .. "." .. " Name: "..string.sub(user[id].playername,1,11) .. " Score: " .. user[id].score, 0, 0, "Bleeding Cowboys", 12 )
    t.anchorX = 0
    t.x = 10
    t.y = rowHeight * 0.5
    t:setTextColor(1,1,1)

end


function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached top limit" )
        elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "left" ) then print( "Reached left limit" )
        elseif ( event.direction == "right" ) then print( "Reached right limit" )
        end
    end

    return true
end

--First Function is being Executed Here

function retrieveRecords(event)
                  native.setActivityIndicator( true )
                  userStatus = loadTable("userSettings.json")

                  if userStatus ~= nil then

                  local headers = {}
                  headers["X-Parse-Application-Id"] = "l4K4kgAtTU5kQSwBZ5SIczbR310HNlAWiTUwy7Km"
                  headers["X-Parse-REST-API-Key"] = "ziTEzIObowaTPLwYcIrDe4GJVbyTRM68Todg4IbH"
                  headers["X-Parse-Session-Token"] = userStatus.mySessionID
                  headers["Content-Type"] = "application/json"

                  local params = {}
                  params.headers = headers
                  params.body = ""
                  uri = "https://api.parse.com/1/classes/_User/"
                  --params.body = body
          --        print("new URI:"..uri)
                  network.request(uri, "GET", poorListener, params)
    end
end

function poorListener(event)

native.setActivityIndicator( false )
secretive = json.encode(event.response)
secretive = json.decode(event.response)

user = {}

    for i = 1, #secretive.results do

    user[i] = {["name"]=secretive.results[i].username,["playername"] = secretive.results[i].playername,["score"] = secretive.results[i].score}
    print("User Name: " .. user[i].name .. " Player Name: " ..user[i].playername .. " User Score: "..user[i].score)

    end
  --print(user[2].score)
  --print(user[2].name)
  h =  table.sort(user,compare) --sorting works here
  --print(user[2].score)
  --print(user[2].name)

            for i = 1, #secretive.results do
print("am i running once?")
                tableView:insertRow{

                rowColor = {default={ 31/255, 41/255, 43/255 }, over={ 1, 0.5, 0, 0.2 } },
                            rowHeight = 30,
                           }

            end


                     count = 0

            for i = 1, #secretive.results do

                     count = count + 1

                  if system.getInfo("deviceID") == user[i].name then
                     print(system.getInfo("deviceID") .. " Hello " .. user[i].name .. " POSITION: " .. count)
                     nameHolder.text = "Name: " .. string.sub(user[i].playername,1,11)
                     positionHolder.text = "Position: #" .. count
                  end

            end
end

function compare(a,b)
  return a.score>b.score
end

function scoreChecker()

                   myGameSettings = loadTable("gameScore.json")

                if myGameSettings == nil then

                   testing2.text = "Your Kill Streak: 0"
                   myGameSettings = {}
                   myGameSettings.score = 0
                   saveTable(myGameSettings, "gameScore.json")

            elseif myGameSettings ~= nil then

                   testing2.text = "Your Kill Streak: "..myGameSettings.score

    end
deleteTable()
--                  networkUser()

end

function deleteTable()

    os.remove(system.pathForFile("gameScore.json",system.DocumentsDirectory))
    os.remove(system.pathForFile("userSettings.json",system.DocumentsDirectory)) 
    print("All Deleted!")

end

function networkUser()

                   userStatus = loadTable("userSettings.json")
--print("network User" .. userStatus)
                if userStatus == nil then

                   createUsers()

            elseif userStatus ~= nil then

                   updateUsers()
                   print("User is Created, Proceed to Updating")
    end              
end

function createUsers()
                   print("Creating User")
                   native.setActivityIndicator( true )
                   local headers = {}
                   headers["X-Parse-Application-Id"] = "l4K4kgAtTU5kQSwBZ5SIczbR310HNlAWiTUwy7Km"
                   headers["X-Parse-REST-API-Key"] = "ziTEzIObowaTPLwYcIrDe4GJVbyTRM68Todg4IbH"
                   headers["Content-Type"] = "application/json"

                   tempTable = {}
                   tempTable.username = system.getInfo("deviceID")
                   tempTable.playername = system.getInfo("deviceID")
                   tempTable.password = "Null"
                   tempTable.score = myGameSettings.score

                   encoder = json.encode(tempTable)
                   print(encoder)

                   local params = {}
                   params.headers = headers
                   params.body = encoder
                   uri = "https://api.parse.com/1/classes/_User"
                   network.request(uri, "POST", networkListener, params)


end

function networkListener(event)

                   native.setActivityIndicator( false )
                   checkError = json.encode(event.response)
                   checkError = json.decode(event.response)

                   if checkError.error == nil then
                      defaultName = tempTable.playername
                --      userText.text = "Name: ".. defaultName .. " [[Click to Edit]]"
                      print("User Created"..event.response)
                      print("User Object ID: " .. checkError.objectId .. " Session ID: " .. checkError.sessionToken)
                      myObjectID = checkError.objectId 
                      mySessionID = checkError.sessionToken

                      userStatus = {}
                      userStatus.myObjectID = myObjectID
                      userStatus.mySessionID = mySessionID

                      saveTable(userStatus,"userSettings.json")

               --     updateUsers()
                      print(userStatus.myObjectID .. userStatus.mySessionID)
                      retrieveRecords()
              elseif checkError.error ~= nil then
                      native.setActivityIndicator(false)
                      print("User Already Exist")

    end
end

function updateUsers()

                  local headers = {}
                  headers["X-Parse-Application-Id"] = "l4K4kgAtTU5kQSwBZ5SIczbR310HNlAWiTUwy7Km"
                  headers["X-Parse-REST-API-Key"] = "ziTEzIObowaTPLwYcIrDe4GJVbyTRM68Todg4IbH"
                  headers["X-Parse-Session-Token"] = userStatus.mySessionID
                  headers["Content-Type"] = "application/json"

                  tempTable = {}
                  tempTable.score = myGameSettings.score

                  encoder = json.encode(tempTable)
                  print(encoder)

                  local params = {}
                  params.headers = headers
                  params.body = encoder
                  uri = "https://api.parse.com/1/classes/_User/"..userStatus.myObjectID
                  --params.body = body
                  print("new URI:"..uri)
                  network.request(uri, "PUT", networkListener2, params)

end

function networkListener2( event )


  print("success"..event.response)

end

function updatePlayer()

                  local headers = {}
                  headers["X-Parse-Application-Id"] = "l4K4kgAtTU5kQSwBZ5SIczbR310HNlAWiTUwy7Km"
                  headers["X-Parse-REST-API-Key"] = "ziTEzIObowaTPLwYcIrDe4GJVbyTRM68Todg4IbH"
                  headers["X-Parse-Session-Token"] = userStatus.mySessionID
                  headers["Content-Type"] = "application/json"

                  nameTable = {}
                  nameTable.playername = savedName

                  encoder = json.encode(nameTable)
                  print(encoder)

                  local params = {}
                  params.headers = headers
                  params.body = encoder
                  uri = "https://api.parse.com/1/classes/_User/"..userStatus.myObjectID
                  --params.body = body
                  print("new URI:"..uri)
                  network.request(uri, "PUT", networkListener3, params)

end

function networkListener3(event)

nameHolder.text = "Name: "..savedName
end

--[[
  --hello = json.decode(event.response)
 -- print(hello.results[1].username)
]]


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


function checkStatus(event)

    if event.phase == "ended" and event.target.id == "restart" then

        composer.gotoScene("scene2",{time=800,effect="crossFade"})

elseif event.phase == "ended" and event.target.id == "goBack" then
        
        composer.gotoScene("scene1",{time=800,effect="crossFade"})

    end
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

           composer.removeScene("leaderScreen")

    elseif phase == "did" then

    
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
