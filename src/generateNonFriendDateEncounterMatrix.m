function result = generateNonFriendDateEncounterMatrix(s,network,encounterMatrix)
    import java.lang.*;
    import java.util.*;
    
    result = HashMap();
    for i=1:92
        n1 = network.sub_sort(i);
        mac1 = int64(hex2dec(s(n1).my_mac));
        disp(mac1);
        result.put(mac1, HashMap());
        actualHash = encounterMatrix.get(mac1);
        if(isempty(actualHash))
            continue;
        end
        auxHash = result.get(mac1);
        
        for j=1:92
            n2 = network.sub_sort(j);
            mac2 = int64(hex2dec(s(n2).my_mac));
            if(network.friends(i,j) ~= 1)
                tmp = actualHash.get(mac2);
                if(~isempty(tmp))
                    auxHash.put(mac2, tmp);
                end
            end
        end
    end
end