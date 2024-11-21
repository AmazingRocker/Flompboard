-- main
-- AmazingRock3r
-- November 21, 2024

--// Classes
local Whiteboard = require("src.Classes.Whiteboard")
local Paintbrush = require("src.Classes.Paintbrush")
local Line = require("src.Classes.Line")

--// Variables
local windowWidth, windowHeight = love.graphics.getDimensions()

function love.load()
	whiteboard = Whiteboard.new()
	paintbrush = Paintbrush.new()

	love.window.setTitle("Flompboard")
	love.mouse.setVisible(false)
end

function love.resize(width, height)
	windowWidth = width
	windowHeight = height
end

function love.wheelmoved(_, y)
	paintbrush:SetRadius(y)
end

function love.update(deltaTime)
	local mouseX, mouseY = love.mouse.getPosition()
	local isMouseDown = love.mouse.isDown(1)
	paintbrush:Update(mouseX, mouseY, isMouseDown)
end

function love.draw()
	whiteboard:Draw()
	Line:Draw()
	paintbrush:Draw()
end
