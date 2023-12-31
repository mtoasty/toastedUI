local UIListLayout = script.Parent;
local ParentFrame = UIListLayout.Parent;

local lockDirection = "Y"; --| X, Y, or XY

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function(): nil
	local newContentSize = UIListLayout.AbsoluteContentSize;
	
	if lockDirection == "X" then
		ParentFrame.Size = UDim2.new(0, newContentSize.X, ParentFrame.Size.Y.Scale, ParentFrame.Size.Y.Offset);
	elseif lockDirection == "Y" then
		ParentFrame.Size = UDim2.new(ParentFrame.Size.X.Scale, ParentFrame.Size.X.Offset, 0, newContentSize.Y);
	elseif lockDirection == "XY" then
		ParentFrame.Size = UDim2.new(0, newContentSize.X, 0, newContentSize.Y);
	end
end);