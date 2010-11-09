function b = encounterPairs( a, min, max )
    import java.lang.*;
    import java.util.*;
    
    keyIt = a.keySet().iterator();
    b = LinkedList();
    while(keyIt.hasNext())
        key = int64(keyIt.next());
        keyMap = a.get(key);
        if(isempty(keyMap))
            continue;
        end
        key2It = keyMap.keySet().iterator();
        while(key2It.hasNext())
            key2 = int64(key2It.next());
            value = keyMap.get(key2);
            if(value >= min && value <= max)
                b.add([key,key2,value]);
            end
        end
    end
end

