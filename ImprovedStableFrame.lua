
-- --------------------------
-- Improved Stable Frame
-- By Cybeloras of Mal'Ganis
-- --------------------------

for i = 11, 20 do 
    if not _G["PetStableStabledPet"..i] then
        CreateFrame("Button", "PetStableStabledPet"..i, PetStableFrame, "PetStableSlotTemplate", i)
    end
end

for i = 1, 20 do
	local frame = _G["PetStableStabledPet"..i]
	if i > 1 then
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", _G["PetStableStabledPet"..i-1], "RIGHT", 7, 0)
	end
	frame:SetFrameLevel(PetStableFrame:GetFrameLevel() + 1)
end

PetStableStabledPet1:ClearAllPoints()
PetStableStabledPet1:SetPoint("TOPLEFT", PetStableBottomInset, 10, -9)

PetStableStabledPet8:ClearAllPoints()
PetStableStabledPet8:SetPoint("TOPLEFT", PetStableStabledPet1, "BOTTOMLEFT", 0, -5)

PetStableStabledPet15:ClearAllPoints()
PetStableStabledPet15:SetPoint("TOPLEFT", PetStableStabledPet8, "BOTTOMLEFT", 0, -5)

PetStableNextPageButton:Hide()
PetStablePrevPageButton:Hide()

PetStableFrameModelBg:SetHeight(265)
PetStableFrameModelBg:SetTexCoord(0.16406250, 0.77734375, 0.00195313, 0.51942003)

PetStableFrameInset:SetPoint("BOTTOMRIGHT", PetStableFrame, "BOTTOMRIGHT", -6, 142)

PetStableFrameStableBg:SetHeight(134)

NUM_PET_STABLE_SLOTS = 20
NUM_PET_STABLE_PAGES = 1
PetStableFrame.page = 1



