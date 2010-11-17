function w  = weeks(s, network, encounterDateMatrix, min, max)
    import java.lang.*;
    import java.util.*;
    import java.text.*;
    
    w = LinkedList();
    
    dateFormat = SimpleDateFormat('dd-MMM-yyyy');
    firstMacIt = encounterDateMatrix.keySet().iterator();
    while(firstMacIt.hasNext())
        firstMac = int64(firstMacIt.next());
        
        position = 0;
        for i=1:92
            n = network.sub_sort(i);
            mac = int64(hex2dec(s(n).my_mac));
            if(firstMac == mac)
                position = n;
                break;
            end
        end
        
        %disp('COMECO');
        %disp(position);
        if(isempty(s(position).places))
            continue;
        end
        beginDate = dateFormat.parse(datestr(s(position).places.startdate));
        endDate = dateFormat.parse(datestr(s(position).places.endate));
        nWeeks = endDate.getTime() - beginDate.getTime();
        nWeeks = ceil(nWeeks/1000/60/60/24/7);
        
        firstMacHash = encounterDateMatrix.get(firstMac);
        secondMacIt = firstMacHash.keySet().iterator();
        while(secondMacIt.hasNext())
            secondMac = int64(secondMacIt.next());
            secondMacHash = firstMacHash.get(secondMac);
%             disp(secondMacHash);
            dailyIt = secondMacHash.keySet().iterator();
            weekHash = HashMap();
            while(dailyIt.hasNext())
                day = dailyIt.next();
                weekKey = strcat(num2str(day.get(Calendar.YEAR)), '-', num2str(day.get(Calendar.WEEK_OF_YEAR)));
                if(~weekHash.containsKey(weekKey))
                    weekHash.put(weekKey,0);
                end
                %disp(num2str(day.get(Calendar.MONTH)));
                %disp(num2str(day.get(Calendar.DATE)));
                %disp(weekKey);
                tmp = weekHash.get(weekKey);
                tmp = tmp+1;
                %disp(tmp);
                weekHash.put(weekKey,tmp);
            end
            
            weekIt = weekHash.keySet().iterator();
            validWeeks = 0.0;
            while(weekIt.hasNext())
                weekKey = weekIt.next();
                e = weekHash.get(weekKey);
                if(e >= min && e <= max)
                    validWeeks = validWeeks + 1.0;
                end
            end
        
            ratio = validWeeks/nWeeks;
            if(ratio>1)
                disp(position);
                disp(firstMac);
                disp(secondMac);
                disp(beginDate);
                disp(endDate);
                disp(validWeeks);
                disp(nWeeks);
                
                ratio = 1;
            end
            %disp(ratio);
            w.add({firstMac, secondMac, ratio});
            %w.add([secondMac, ratio]);
            %disp(w.getLast());
        end
    end
end