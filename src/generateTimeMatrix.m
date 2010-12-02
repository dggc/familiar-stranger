function [time, numb] = generateTimeMatrix(s, network)
    import java.lang.*;
    import java.util.*;
    
    % Number of subjects
    % TODO: Change this
    MAX = 10;
    
    % Return values
    time = HashMap();
    numb = HashMap();

    % iterate over all subjects
    for i=1:MAX
       % aux_t var to check whether a access is continuous
       last = HashMap();
       
       n = network.sub_sort(i);
       if(isempty(s(n).places))
           continue;
       end
       
       mac_i = int64(hex2dec(s(n).my_mac));
       disp(sprintf('%d : %d mac_i %0f', i, n, mac_i));
       %disp(mac_i);
       if(~time.containsKey(mac_i))
           time.put(mac_i, HashMap());
           numb.put(mac_i, HashMap());
       end
       aux_t = time.get(mac_i);
       aux_n = numb.get(mac_i);
       scanSize = length(s(n).device_date);
       
       % iterate over all scans
       % for t=1:scanSize
       for t=1:100

%            if(strcmp(locationOfScan(s,n,t),location))
           scanArray = s(n).device_macs(t);
           scanArray = scanArray{1};

           % iterate over all pairs
           disp(sprintf('Time: %d', t));
           for j=1:length(scanArray)
               mac_j = scanArray(j);
               mac_j = int64(mac_j);
               if(~aux_t.containsKey(mac_j))
                   % First meeting
                   aux_n.put(mac_j, 1);
                   aux_t.put(mac_j, 5);
               else
                   % Not the first time
                   if (last.get(mac_j) == (t - 1))
                       disp('   **again ');
                       tmp_n = aux_n.get(mac_j);
                       tmp_n = tmp_n + 1;
                       aux_n.put(mac_j, tmp_n);
                   end
               end
               tmp_t = aux_t.get(mac_j);
               tmp_t = tmp_t + 5;
               aux_t.put(mac_j, tmp_t);
               last.put(mac_j, t);
               disp(sprintf('   mac_j: %f', mac_j));
           end
%            end
       end
    end
end

