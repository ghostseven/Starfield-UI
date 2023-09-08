function Initialize()
	nBands = RmGetUInt("BandCount", 100)
	nBars = RmGetUInt("BarCount", 100)

	oMs = {}
	for i=1,nBands do
		oMs[i] = SKIN:GetMeasure("MeterBand" .. i)
	end
	bUseMap1 = true
	tHeightMap1 = {}
	tHeightMap2 = {}
	tParentBand = {}
	for i=1,nBars do
		tHeightMap1[i] = 0
		tHeightMap2[i] = 0

		tParentBand[i] = mapi(i, 1, nBars, 1, nBands)
	end
	for i=nBars/2-7,nBars/2+7 do
		tHeightMap1[i] = -3
	end
	tC = {}
	tC.Height = RmGetUInt("Height", 150)/2
	tC.ExpScaleFactor = RmGetUNumber("ExpScaleFactor", 0.8)
	tC.Stiffness = RmGetNumber("Stiffness", 1.02)
	if tC.Stiffness <= 1 then tC.Stiffness = 1 end
	tC.Spread = RmGetUNumber("Spread", 8)
	tC.Scale = RmGetUNumber("Scale", 7)
	tC.Width = RmGetUNumber("Width", 1000)
	if tC.Width <= 0 then tC.Width = 1000 end

	tC.FillY = RmGetUNumber("FillY", 0)
	tC.Fill = RmGetUNumber("Fill", 0) > 0
end
function toCurve(t, xStart, yStart, ySize, xSize, tScale)

	local xEnd, yEnd, yVal, yValNext
	local xMax = xSize*#t
	local xCOffset = xSize/2

	yValNext = map(t[1], -tScale, tScale, yStart+ySize, yStart-ySize)
	local str = {("%d,%d"):format(xStart, yValNext)}

	if tC.Fill then str[1] = ("%d,%d | LineTo "):format(0, tC.FillY) .. str[1] end

	for i=1,#t do
		xEnd = map(i, 1, #t, xStart, xMax)
		yVal = yValNext
		yValNext = map(t[cl(i+1, 1, #t)], -tScale, tScale, yStart+ySize, yStart-ySize)
		yEnd = (yVal + yValNext)/2

		table.insert(str, ("CurveTo %d,%d,%d,%d"):format(xEnd, yEnd, xEnd-xCOffset, yVal))
	end
	if tC.Fill then table.insert(str, ("LineTo %d,%d"):format(tC.Width, tC.FillY)) end

	return table.concat(str, "|")
end

function Update()
	local source, dest
	if bUseMap1 then
		source = tHeightMap1
		dest = tHeightMap2
	else
		source = tHeightMap2
		dest = tHeightMap1
	end
	for i=1,nBars do

		dest[i] = dest[i] + oMs[ tParentBand[i] ]:GetValue()^tC.ExpScaleFactor

		dest[i] = ( source[cl(i-1, 1, nBars)] + source[cl(i+1, 1, nBars)] ) / tC.Stiffness - dest[i]
 
		dest[i] = dest[i] - (dest[i] / tC.Spread)
	end
	SKIN:Bang("!SetOption", "MeterWaweBar", "MyPath", toCurve(dest, 0, tC.Height, tC.Height, tC.Width / nBars, -tC.Scale))

	bUseMap1 = not bUseMap1
end
function cl(var, min, max)
	if var < min then 
		return min
	elseif var > max then
		return max
	end
	return var
end
function map(nVar, nMin1, nMax1, nMin2, nMax2)
	return nMin2 + (nMax2 - nMin2) * ((nVar - nMin1) / (nMax1 - nMin1))
end
function mapi(nVar, nMin1, nMax1, nMin2, nMax2)
	return math.floor(map(nVar, nMin1, nMax1, nMin2, nMax2))
end
function RmGetInt(sVar, iDefault)
	return math.floor(SKIN:GetVariable(sVar, iDefault))
end
function RmGetUInt(sVar, iDefault)
	return math.abs(RmGetInt(sVar, iDefault))
end
function RmGetNumber(sVar, iDefault)
	return tonumber(SKIN:GetVariable(sVar, iDefault))
end
function RmGetUNumber(sVar, iDefault)
	return math.abs(tonumber(SKIN:GetVariable(sVar, iDefault)))
end
function RmGetStr(sVar, iDefault)
	return SKIN:GetVariable(sVar, iDefault)
end