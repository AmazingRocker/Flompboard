-- Line
-- AmazingRock3r
-- November 21, 2024

--// Variables

local Line = {}
Line.__index = Line

function Line.new(x1, y1, x2, y2, radius, color)
	local self = setmetatable({}, Line)
	self._x1 = x1
	self._y1 = y1
	self._x2 = x2
	self._y2 = y2
	self._radius = _G.Radius
	self._color = color or { 0, 0, 0 }

	table.insert(_G.Lines, self)
	return self
end

function Line:Draw()
	for _, line in ipairs(_G.Lines) do
		love.graphics.setColor(line._color)

		love.graphics.circle("fill", line._x1, line._y1, line._radius)
		love.graphics.circle("fill", line._x2, line._y2, line._radius)

		love.graphics.setLineWidth(line._radius * 2)
		love.graphics.line(line._x1, line._y1, line._x2, line._y2)
		love.graphics.setLineWidth(1)
	end

	love.graphics.setColor(1, 1, 1)
end

function Line:IsNear(x, y, radius)
	local distanceStart = math.sqrt((x - self._x1) ^ 2 + (y - self._y1) ^ 2)
	local distanceEnd = math.sqrt((x - self._x2) ^ 2 + (y - self._y2) ^ 2)

	return distanceStart <= radius or distanceEnd <= radius
end

function Line:Destroy()
	--
end

return Line
