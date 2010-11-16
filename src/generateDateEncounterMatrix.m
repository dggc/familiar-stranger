function encounterMatrix = generateDateEncounterMatrix(s, network, location)
    import java.lang.*;
    import java.util.*;
    import java.text.*;
    
    encounterMatrix = HashMap();
    dateFormat = SimpleDateFormat('dd-MMM-yyyy');
    %mais que 92 dah pau
    for i=1:5
       n = network.sub_sort(i);
       mac = int64(hex2dec(s(n).my_mac));
       %disp('lala');
       disp(n);
       %disp(mac);
       if(~encounterMatrix.containsKey(mac))
           encounterMatrix.put(mac, HashMap());
       end
       aux = encounterMatrix.get(mac);
       scanSize = length(s(n).device_date);
       %disp(scanSize);
       for j=1:scanSize
           %disp(j);
           if(strcmp(locationOfScan(s,n,j),location))
               scanArray = s(n).device_macs(j);
               scanDateAux = dateFormat.parse(datestr(s(n).device_date(j)));
               scanDate = Calendar.getInstance();
               scanDate.setTime(scanDateAux);
               scanDate.set(Calendar.HOUR,0);
               scanDate.set(Calendar.MINUTE,0);
               scanDate.set(Calendar.SECOND,0);
               
               scanArray = scanArray{1};
               for k=1:length(scanArray)
                   scan = scanArray(k);
                   scan = int64(scan);
                   %disp(scan);
                   %disp(j);
                   if(~aux.containsKey(scan))
                       %disp('lele');
                       aux.put(scan, HashMap());
                   else
                       %disp('lolo');
                   end
                   %disp('lili');
                   %disp(aux.get(scan));
                   %disp('lili');
                   dailyHash = aux.get(scan);
                   if(~dailyHash.containsKey(scanDate))
                       dailyHash.put(scanDate, 0);
                   end
                   tmp = dailyHash.get(scanDate);
                   tmp = tmp+1;
                   %disp(scan);
                   %disp(tmp);
                   dailyHash.put(scanDate,tmp);
               end
           end
       end
    end
end

