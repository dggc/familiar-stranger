function mac2numb = MacMap (s, network)
    import java.lang.*;
    import java.util.*;
    
    mac2numb = HashMap();
    for i=1:92
        n = network.sub_sort(i);
        mac = int64(hex2dec(s(n).my_mac));
        mac2numb.put( mac, n);
    end
end