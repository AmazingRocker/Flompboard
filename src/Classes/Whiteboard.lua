-- Whiteboard
-- AmazingRock3r
-- November 21, 2024

local Whiteboard = {}
Whiteboard.__index = Whiteboard

function Whiteboard.new()
	local self = setmetatable({}, Whiteboard)
	self.Lines = {}

	return self
end

function Whiteboard:Draw()
	love.graphics.clear(1, 1, 1, 1)
end

function Whiteboard:Destroy()
	--
end

return Whiteboard
