function encounterMatrix = generateEncounterMatrix(s, network, location)
    import java.lang.*;
    import java.util.*;
    
    encounterMatrix = HashMap();
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
               scanArray = s(n).device_macs(j);
               scanArray = scanArray{1};
               for k=1:length(scanArray)
                   scan = scanArray(k);
                   scan = int64(scan);
                   %disp(scan);
                   %disp(j);
                   if(~aux.containsKey(scan))
                       %disp('lele');
                       aux.put(scan, 0);
                   else
                       %disp('lolo');
                   end
                   %disp('lili');
                   %disp(aux.get(scan));
                   %disp('lili');
                   tmp = aux.get(scan);
                   tmp = tmp+1;
                   %disp(scan);
                   %disp(tmp);
                   aux.put(scan,tmp);
               end
           end
       end
    end
end

