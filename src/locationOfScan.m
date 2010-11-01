function locationOfScan = locationOfScan(s, person, scanNumber)
    if(s(4).device_date(scanNumber) > s(4).places.endate || s(4).device_date(scanNumber) < s(4).places.startdate)
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