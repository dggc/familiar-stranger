function familiarStranger = generateFamiliarStranger(s, network)
    import java.lang.*;
    import java.util.*;
    
    familiarStranger = HashMap();
    for i=1:90
       n = network.sub_sort(i);
       mac = hex2dec(s(n).my_mac);
       %disp('lala');
       disp(n);
       disp(mac);
       if(~familiarStranger.containsKey(mac))
           familiarStranger.put(mac, HashMap());
       end
       aux = familiarStranger.get(mac);
       scanSize = length(s(n).device_date);
       %disp(scanSize);
       for j=1:scanSize
           scan = s(n).device_macs(j);
           if(strcmp(locationOfScan(s,n,j),'elsewhere'))
               disp(scan);
               disp(j);
               if(~aux.containsKey(scan))
                   disp('lele');
                   aux.put(scan, 0);
               else
                   disp('lolo');
               end
               disp('lili');
               disp(aux.get(scan));
               disp('lili');
               aux.put(s(n).device_macs(scan, aux.get(scan)+1));
           end
       end
    end
end

