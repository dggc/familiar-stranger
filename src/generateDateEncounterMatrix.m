function encounterMatrix = generateDateEncounterMatrix(s, network, location)
    import java.lang.*;
    import java.util.*;
    import java.text.*;
    
    encounterMatrix = HashMap();
    dateFormat = SimpleDateFormat('dd-MMM-yyyy');
    %mais que 92 dah pau
    for i=1:92
       n = network.sub_sort(i);
       if(isempty(s(n).places))
           continue;
       end
       
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
               scanDateAux = dateFormat.parse(datestr(s(n).device_date(j)));
               scanDate = Calendar.getInstance();
               scanDate.setTime(scanDateAux);
               scanDate.set(Calendar.HOUR,0);
               scanDate.set(Calendar.MINUTE,0);
               scanDate.set(Calendar.SECOND,0);
               
               scanArray = s(n).device_macs(j);
               scanArray = scanArray{1};
               for k=1:length(scanArray)
                   scan = scanArray(k);
                   scan = int64(scan);
                   %disp(scan);
                   %disp(j);
                   if(~aux.containsKey(scan))
                       aux.put(scan, HashMap());
                   end
                   dailyHash = aux.get(scan);
                   
                   %disp('lili');
                   %disp(aux.get(scan));
                   %disp('lili');
                   if(~dailyHash.containsKey(scanDate))
                       dailyHash.put(scanDate, 0);
                   end
                   tmp = dailyHash.get(scanDate);
                   tmp = tmp+1;
                   %disp(scan);
                   %disp(tmp);
                   %disp(n);
                   %disp(j);
                   %disp(scanDate.getTime().toLocaleString());
                   dailyHash.put(scanDate,tmp);
               end
           end
       end
    end
end