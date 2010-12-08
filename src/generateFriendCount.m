function result = generateFriendCount(s,network,encounterMatrix)
    import java.lang.*;
    import java.util.*;
    
    result = 0;
    for i=1:92
        n1 = network.sub_sort(i);
        mac1 = int64(hex2dec(s(n1).my_mac));
        disp(mac1);
        actualHash = encounterMatrix.get(mac1);
        if(isempty(actualHash))
            continue;
        end
        
        for j=1:92
            n2 = network.sub_sort(j);
            mac2 = int64(hex2dec(s(n2).my_mac));
            if(network.friends(i,j) == 1)
                if(actualHash.containsKey(mac2))
                     result = result + actualHash.get(mac2);
                end
            end
        end
    end
end