-- Line
-- AmazingRock3r
-- November 21, 2024

--// Variables

local Line = {}
Line.__index = Line
Line.Lines = {}

function Line.new(x1, y1, x2, y2, radius, color)
	local self = setmetatable({}, Line)
	self._x1 = x1
	self._y1 = y1
	self._x2 = x2
	self._y2 = y2
	self._radius = radius or 5
	self._color = color or { 0, 0, 0 }

	table.insert(Line.Lines, self)
	return self
end

function Line:Draw()
	for _, line in ipairs(Line.Lines) do
		love.graphics.setColor(line._color)

		love.graphics.circle("fill", line._x1, line._y1, line._radius)
		love.graphics.circle("fill", line._x2, line._y2, line._radius)

		love.graphics.setLineWidth(line._radius * 2)
		love.graphics.line(line._x1, line._y1, line._x2, line._y2)
		love.graphics.setLineWidth(1)
	end

	love.graphics.setColor(1, 1, 1)
end

function Line:Destroy()
	--
end

return Line
