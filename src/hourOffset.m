function hourOffset = hourOffset(s, person, scanNumber)
    hourOffset = hourDifference(s(person).device_date(scanNumber), s(person).places.startdate);
end