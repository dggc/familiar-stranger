function c = countPairs(pairs)
    i = 1;
    c = 1:pairs.size();
    it = pairs.iterator();
    while(it.hasNext())
        current = it.next();
        c(i) = current(3);
        i = i+1;
    end
end