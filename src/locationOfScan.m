function locationOfScan = locationOfScan(s, person, scanNumber)
    if(isempty(s(person).places) || s(person).device_date(scanNumber) > s(person).places.endate || s(person).device_date(scanNumber) < s(person).places.startdate)
        locationOfScan = 'invalid';
        return;
    end
    a = hourOffset(s, person,scanNumber)+1;
    
    locationOfScan = s(person).data_mat(a);
    switch(locationOfScan)
        case 0
            locationOfScan = 'no signal';
        case 1
            locationOfScan = 'home';
        case 2
            locationOfScan = 'work';
        case 3
            locationOfScan = 'elsewhere';
        otherwise
            locationOfScan = 'phone is off';
    end
end