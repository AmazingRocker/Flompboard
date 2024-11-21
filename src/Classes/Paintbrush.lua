-- Paintbrush
-- AmazingRock3r
-- November 21, 2024

--// Modules
local Line = require("src.Classes.Line")

--// Variables
local DEFAULT_SETTINGS = {
	MaxSize = 50,
	MinSize = 1,
}

local Paintbrush = {}
Paintbrush.__index = Paintbrush

function Paintbrush.new()
	local self = setmetatable({}, Paintbrush)
	self._posX = 0
	self._posY = 0
	self._segments = 100
	self._color = { 0, 0, 0 }
	self._lines = {}
	self._lastPosition = nil

	return self
end

function Paintbrush:Update(positionX, positionY, isMouseDown)
	self._posX = positionX
	self._posY = positionY

	if isMouseDown then
		if self._lastPosition then
			Line.new(self._lastPosition.x, self._lastPosition.y, positionX, positionY, _G.Radius, self._color)
		end

		self._lastPosition = { x = positionX, y = positionY }
	else
		self._lastPosition = nil
	end
end

function Paintbrush:SetRadius(y)
	if y > 0 then
		_G.Radius = math.min(_G.Radius + 1, DEFAULT_SETTINGS.MaxSize)
	else
		_G.Radius = math.max(_G.Radius - 1, DEFAULT_SETTINGS.MinSize)
	end
end

function Paintbrush:Draw()
	love.graphics.setColor(self._color)
	love.graphics.circle("fill", self._posX, self._posY, _G.Radius, self._segments)
	love.graphics.setColor(1, 1, 1)
end

return Paintbrush
