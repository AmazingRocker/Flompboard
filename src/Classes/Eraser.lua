-- Eraser
-- AmazingRock3r
-- November 21, 2024

local Eraser = {}
Eraser.__index = Eraser

function Eraser.new()
	local self = setmetatable({}, Eraser)
	return self
end

function Eraser:Update(positionX, positionY, isMouseDown)
	if isMouseDown then
		for i = #_G.Lines, 1, -1 do
			if _G.Lines[i]:IsNear(positionX, positionY, _G.Radius) then
				table.remove(_G.Lines, i)
			end
		end
	end
end

return Eraser
