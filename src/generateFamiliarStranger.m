function familiarStranger = generateFamilarStranger(s, network)
    import java.lang.*;
    import java.util.*;
    
    familiarStranger = HashMap();
    for i=1:90
       n = network.sub_sort(i);
       mac = hex2num(s(n).my_mac);
       disp('lala');
       disp(n);
       disp(mac);
       if(~familiarStranger.containsKey(mac))
           familiarStranger.put(mac, HashMap());
       end
       aux = familiarStranger.get(mac);
       scanSize = size(s(n).device_date);
       for j=1:scanSize
           scan = s(n).device_macs(j);
           disp(scan);
           if(strcmp(locationOfScan(s,n,j),'elsewhere'))
               if(~aux.containsKey(scan))
                   aux.put(scan, 0);
               end
               aux.put(s(n).device_macs(scan, aux.get(scan)+1));
           end
       end
    end
end

