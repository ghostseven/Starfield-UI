function Initialize()
	tYear   = SKIN:GetVariable('Year')
	tMonth  = SKIN:GetVariable('Month')
	tDay    = SKIN:GetVariable('Day')
	tHour   = SKIN:GetVariable('Hour')
	tMinute = SKIN:GetVariable('Minute')
	tSecond = SKIN:GetVariable('Second')


    tYearP   = SKIN:GetVariable('YearP')
	tMonthP  = SKIN:GetVariable('MonthP')
	tDayP    = SKIN:GetVariable('DayP')
	tHourP   = SKIN:GetVariable('HourP')
	tMinuteP = SKIN:GetVariable('MinuteP')
	tSecondP = SKIN:GetVariable('SecondP')
end

function Update()
    local currentTime = os.time()
    local targetTime = os.time{
    year = tYear,
    month = tMonth,
    day = tDay,
    hour = tHour,
    min = tMinute,
    sec = tSecond
    }
    local targetTimeP = os.time{
    year = tYearP,
    month = tMonthP,
    day = tDayP,
    hour = tHourP,
    min = tMinuteP,
    sec = tSecondP
    }

    local remainingTime = targetTime - currentTime

    -- Calculate the number of days, hours, minutes, and seconds
    local days = math.floor(remainingTime / (24 * 60 * 60))
    remainingTime = remainingTime % (24 * 60 * 60)
    local hours = math.floor(remainingTime / (60 * 60))
    remainingTime = remainingTime % (60 * 60)
    local minutes = math.floor(remainingTime / 60)
    local seconds = remainingTime % 60

    local remainingTimeP = targetTimeP - currentTime

    -- Calculate the number of days, hours, minutes, and seconds
    local daysP = math.floor(remainingTimeP / (24 * 60 * 60))
    remainingTimeP = remainingTimeP % (24 * 60 * 60)
    local hoursP = math.floor(remainingTimeP / (60 * 60))
    remainingTimeP = remainingTimeP % (60 * 60)
    local minutesP = math.floor(remainingTimeP / 60)
    local secondsP = remainingTimeP % 60


    if(remainingTime <=0)
    then
        SKIN:Bang('!HideMeterGroup', 'SFCountDown')
        SKIN:Bang('!ShowMeterGroup', 'SFARRIVED')

    else
        SKIN:Bang('!SetOption', 'SF_DAYS', 'Text', zeroPad(days))
        SKIN:Bang('!SetOption', 'SF_HOURS', 'Text', zeroPad(hours))
        SKIN:Bang('!SetOption', 'SF_MINS', 'Text', zeroPad(minutes))
        SKIN:Bang('!SetOption', 'SF_SECS', 'Text', zeroPad(seconds))
    end 

    if(remainingTimeP <=0)
    then
        SKIN:Bang('!HideMeterGroup', 'SFCountDownPRIO')
        SKIN:Bang('!ShowMeterGroup', 'SFARRIVEDPRIO')

    else
        SKIN:Bang('!SetOption', 'SF_DAYS_PRIO', 'Text', zeroPad(daysP))
        SKIN:Bang('!SetOption', 'SF_HOURS_PRIO', 'Text', zeroPad(hoursP))
        SKIN:Bang('!SetOption', 'SF_MINS_PRIO', 'Text', zeroPad(minutesP))
        SKIN:Bang('!SetOption', 'SF_SECS_PRIO', 'Text', zeroPad(secondsP))
    end 
end

-- Zero-padding the single-digit numbers
function zeroPad(value)
    if value < 10 then
        return "0" .. value
    else
        return tostring(value)
    end
end