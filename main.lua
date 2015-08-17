-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local centerX = display.contentCenterX
local centerY = display.contentCenterY

local ancho = display.contentWidth
local alto = display.contentHeight


--Cargamos libreria physics
local physics = require "physics"

--Activamos pelota
physics.start( )



local pelota = display.newCircle( 65, 170, 15 )

physics.addBody( pelota, "dynamic", {density = 0.9, friction=0.2 ,bounce=0.7 } )


local suelo = display.newRect( -5, alto, ancho, 10 )

physics.addBody(suelo, "static", {density = 0.9, friction=0.1 ,bounce=0.8 } )

for i = 1, 4 do

local bloque = display.newRect(ancho/4 + 50, centerY - 150 + 30 * i , 30, 30)

physics.addBody( bloque, "dynamic", {density = 0.5, friction=0.0 ,bounce=0.1 } )

end

--plataforma1
local plataforma = display.newRect( ancho/4, centerY, ancho/2, 10)

physics.addBody (plataforma, "static", {density = 0.9, friction=0.1 ,bounce=0.8 })

local plataforma = display.newRect( ancho/4, 450, ancho/2, 10)

physics.addBody (plataforma, "static", {density = 0.9, friction=0.1 ,bounce=0.8 })

for i = 0, 2 do

local rect = display.newRect(150, 370 + i * 20, 20, 20)
physics.addBody( rect, "dynamic", {density = 1.0, friction=0.3 ,bounce=0.2 } )

end


--Colocando paredes
local pared = display.newRect( 345, 345, 4, 800 )
physics.addBody( pared, "static",  {density = 0.9, friction=0.1 ,bounce=0.8 } )

local pared = display.newRect( -25, -25, 4, 1000 )
physics.addBody( pared, "static",  {density = 0.9, friction=0.1 ,bounce=0.8 } )


--Movimientos pelota
function circleTouched(event)
if event.phase == "began" then
	display.getCurrentStage( ):setFocus(pelota)
elseif event.phase == "ended" then
pelota:applyLinearImpulse( event.xStart - event.x, event.yStart - event.y )
display.getCurrentStage( ):setFocus( nil)

    end
end

pelota:addEventListener( "touch", circleTouched )








