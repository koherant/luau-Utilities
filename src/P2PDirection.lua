function AdjustPosition(pos)
	if pos.X < 0 and pos.Z < 0 then
		if pos.X < pos.Z then
			pos = Vector3.new(pos.X,pos.Y,0)
			return pos
		else
			pos = Vector3.new(0,pos.Y, pos.Z)
			return pos
		end
	elseif pos.X < 0 and pos.Z >= 0 then
		if pos.X < pos.Z *-1 then
			pos = Vector3.new(pos.X,pos.Y,0)
			return pos
		else
			pos = Vector3.new(0,pos.Y, pos.Z)
			return pos
		end
	elseif pos.X >= 0 and pos.Z < 0 then
		if pos.X > pos.Z *-1 then
			pos = Vector3.new(pos.X,pos.Y,0)
			return pos
		else
			pos = Vector3.new(0,pos.Y, pos.Z)
			return pos
		end
	elseif pos.X >= 0 and pos.Z >= 0 then
		if pos.X > pos.Z then
			pos = Vector3.new(pos.X,pos.Y,0)
			return pos
		else
			pos = Vector3.new(0,pos.Y, pos.Z)
			return pos
		end
	end
end

function CheckPosition(pos)
	if pos.X ~= 0 then
		if pos.X > 0 then
			return "Right"
		elseif pos.X < 0 then
			return "Left"
		end
	else
		if pos.Z > 0 then
			return "Back"
		elseif pos.Z < 0 then
			return "Front"
		end
	end
end

return function(part1, part2)
	return CheckPosition(AdjustPosition(part2.CFrame:pointToObjectSpace(part1.Position)))
end
