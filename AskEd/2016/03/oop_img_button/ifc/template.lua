-- =============================================================
-- Your Copyright Statement Goes Here
-- =============================================================
--  template.lua
-- =============================================================

local composer 		= require( "composer" )
local scene    		= composer.newScene()

----------------------------------------------------------------------
--								LOCALS								--
----------------------------------------------------------------------
-- Variables
local w = display.contentWidth
local h = display.contentHeight
local fullw = display.actualContentWidth
local fullh = display.actualContentHeight
local centerX = display.contentCenterX
local centerY = display.contentCenterY

local buttonWidth     = display.actualContentWidth/3
local buttonHeight    = buttonWidth/ 3
local tweenButtons    = buttonHeight/2 + buttonHeight/5
local fontSize   	  = math.floor( buttonHeight/2 )


-- Forward Declarations
local onPush1

-- Useful Localizations
local mAbs              = math.abs
local mRand             = math.random
local mDeg              = math.deg
local mRad              = math.rad
local mCos              = math.cos
local mSin              = math.sin
local mAcos             = math.acos
local mAsin             = math.asin
local mSqrt             = math.sqrt
local mCeil             = math.ceil
local mFloor            = math.floor
local mAtan2            = math.atan2
local mPi               = math.pi

local getInfo           = system.getInfo
local getTimer          = system.getTimer
local strMatch          = string.match
local strFormat         = string.format
local pairs             = pairs

----------------------------------------------------------------------
--	Scene Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:create( event )
	local sceneGroup = self.view

	-- Create a simple background
	local back = display.newRect( sceneGroup, centerX, centerY, fullw * 4, fullw * 4 )
	back:setFillColor( 0, 0, 0 )

	-- Create a label showing which scene this is
	local label = display.newText( sceneGroup, "Template", 
		                          centerX, centerY - display.actualContentHeight/2 + fontSize * 2, 
		                          native.systemFont, fontSize * 2)
	label:setFillColor( 0.8, 1, 1  )

	-- Create a button
	local push1 = PushButton( sceneGroup, centerX, centerY, "Push Me", onPush1, 
	                          { width = buttonWidth, height = buttonHeight,
	                            labelColor = {0,1,0}, labelSize = fontSize  } )

end

----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:willEnter( event )
	local sceneGroup = self.view
end
----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:didEnter( event )
	local sceneGroup = self.view
end

----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:willExit( event )
	local sceneGroup = self.view
end
----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:didExit( event )
	local sceneGroup = self.view
end

----------------------------------------------------------------------
----------------------------------------------------------------------
function scene:destroy( event )
	local sceneGroup = self.view
end

----------------------------------------------------------------------
--				FUNCTION/CALLBACK DEFINITIONS						--
----------------------------------------------------------------------
onPush1 = function ( self, event ) 
	print("Pressed button... do something.")
	local options =
	{
		effect = "fade", -- See list here: http://docs.coronalabs.com/daily/api/library/composer/gotoScene.html
		time = 200,
		params =
		{
			arg1 = "value", 
			arg2 = 0
		}
	}
	--composer.gotoScene( "ifc.scenename", options  )	
	return true
end

---------------------------------------------------------------------------------
-- Scene Dispatch Events, Etc. - Generally Do Not Touch Below This Line
---------------------------------------------------------------------------------
function scene:show( event )
	local sceneGroup 	= self.view
	local willDid 	= event.phase
	if( willDid == "will" ) then
		self:willEnter( event )
	elseif( willDid == "did" ) then
		self:didEnter( event )
	end
end
function scene:hide( event )
	local sceneGroup 	= self.view
	local willDid 	= event.phase
	if( willDid == "will" ) then
		self:willExit( event )
	elseif( willDid == "did" ) then
		self:didExit( event )
	end
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------
return scene
