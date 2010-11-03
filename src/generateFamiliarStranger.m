function familiarStranger = generateFamiliarStranger(s, network)
    import java.lang.*;
    import java.util.*;
    
    familiarStranger = HashMap();
    %mais que 92 dah pau
    for i=1:92
       n = network.sub_sort(i);
       mac = int64(hex2dec(s(n).my_mac));
       %disp('lala');
       disp(n);
       %disp(mac);
       if(~familiarStranger.containsKey(mac))
           familiarStranger.put(mac, HashMap());
       end
       aux = familiarStranger.get(mac);
       scanSize = length(s(n).device_date);
       %disp(scanSize);
       for j=1:scanSize
           %disp(j);
           if(strcmp(locationOfScan(s,n,j),'elsewhere'))
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

