
local clientVersion = select(4, GetBuildInfo())
local wow_900 = clientVersion >= 90000
local wow_800 = clientVersion >= 80000
local wow_503 = clientVersion >= 50300

local maxSlots = NUM_PET_STABLE_PAGES * NUM_PET_STABLE_SLOTS

local NUM_PER_ROW, heightChange
if wow_900 then
	NUM_PER_ROW = 10
elseif wow_800 then
	NUM_PER_ROW = 10
	heightChange = 65
elseif wow_503 then
	NUM_PER_ROW = 10
	heightChange = 36
else
	NUM_PER_ROW = 7
	heightChange = 17
end

for i = NUM_PET_STABLE_SLOTS + 1, maxSlots do 
	if not _G["PetStableStabledPet"..i] then
		CreateFrame("Button", "PetStableStabledPet"..i, PetStableFrame, "PetStableSlotTemplate", i)
	end
end

for i = 1, maxSlots do
	local frame = _G["PetStableStabledPet"..i]
	if i > 1 then
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", _G["PetStableStabledPet"..i-1], "RIGHT", 7.3, 0)
	end
	frame:SetFrameLevel(PetStableFrame:GetFrameLevel() + 1)
	frame:SetScale(7/NUM_PER_ROW)
end

for i = NUM_PER_ROW+1, maxSlots, NUM_PER_ROW do
	_G["PetStableStabledPet"..i]:ClearAllPoints()
	_G["PetStableStabledPet"..i]:SetPoint("TOPLEFT", _G["PetStableStabledPet"..i-NUM_PER_ROW], "BOTTOMLEFT", 0, -5)
end

PetStableNextPageButton:Hide()
PetStablePrevPageButton:Hide()

if wow_900 then
	local widthDelta = 315
	local heightDelta = 184
	local f = CreateFrame("Frame", "ImprovedStableFrameSlots", PetStableFrame, "InsetFrameTemplate")
	f:ClearAllPoints()
	f:SetSize(widthDelta, PetStableFrame:GetHeight() + heightDelta - 28)
	-- f:SetPoint("BOTTOMRIGHT", _G["PetStableStabledPet"..maxSlots], 5, -5)

	f:SetPoint(PetStableFrame.Inset:GetPoint(1))
	PetStableFrame.Inset:SetPoint("TOPLEFT", f, "TOPRIGHT")
	PetStableFrame:SetWidth(PetStableFrame:GetWidth() + widthDelta)
	PetStableFrame:SetHeight(PetStableFrame:GetHeight() + heightDelta)

	PetStableFrameModelBg:SetHeight(281 + heightDelta)

	local p, r, rp, x, y = PetStableModel:GetPoint(1)
	PetStableModel:SetPoint(p, r, rp, x, y - 32)

	PetStableStabledPet1:ClearAllPoints()
	PetStableStabledPet1:SetPoint("TOPLEFT", f, 8, -8)
else

	PetStableStabledPet1:ClearAllPoints()
	PetStableStabledPet1:SetPoint("TOPLEFT", PetStableBottomInset, 9, -9)

	PetStableFrameModelBg:SetHeight(281 - heightChange)
	PetStableFrameModelBg:SetTexCoord(0.16406250, 0.77734375, 0.00195313, 0.55078125 - heightChange/512)

	PetStableFrameInset:SetPoint("BOTTOMRIGHT", PetStableFrame, "BOTTOMRIGHT", -6, 126 + heightChange)

	PetStableFrameStableBg:SetHeight(116 + heightChange)
end


NUM_PET_STABLE_SLOTS = maxSlots
NUM_PET_STABLE_PAGES = 1
PetStableFrame.page = 1



