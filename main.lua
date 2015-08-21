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



local pelota = display.newImage( "StarCoin.png", 65, 15 )

physics.addBody( pelota, "dynamic", {density = 0.9, friction=0.2 ,bounce=0.7 } )


local suelo = display.newRect( 150, alto, ancho, 10 )

physics.addBody(suelo, "static", {density = 0.9, friction=0.1 ,bounce=0.8 } )

for i = 1, 4 do

local bloque = display.newImage( "Red_Brick_Block.png", ancho/4 + 50, centerX - 150 + 30 * i , 20, 30)

physics.addBody( bloque, "dynamic", {density = 0.5, friction=0.20 ,bounce=0.5} )

end




--plataforma1
local plataforma = display.newRect( ancho/4, centerX + 30, ancho/2, 10)

physics.addBody (plataforma, "static", {density = 0.9, friction=0.1 ,bounce=0.8 })

local plataforma = display.newRect( ancho/4, 350 * 1, ancho/2, 10)

physics.addBody (plataforma, "static", {density = 0.9, friction=0.1 ,bounce=0.8 })





--Colocando paredes
local pared = display.newRect( 345, 345, 4, 800 )
physics.addBody( pared, "static",  {density = 0.9, friction=0.1 ,bounce=0.8 } )

local pared = display.newRect( -25, -25, 4, 1000 )
physics.addBody( pared, "static",  {density = 0.9, friction=0.1 ,bounce=0.8 } )


for i = 0, 2 do

local rect = display.newImage( "Bloque inte.gif", 20, 370 + i * 20, 20, 20 )
physics.addBody( rect, "dynamic", {density = 0.9, friction=0.10 ,bounce=0.8 } )


end



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








