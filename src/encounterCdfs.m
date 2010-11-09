function [ workCount, workPairs, workMatrix, homeCount, homePairs, homeMatrix, elsewhereCount, elsewherePairs, elsewhereMatrix ] = encounterCdfs( s, network )
    workMatrix = generateEncounterMatrix( s, network, 'work');
    homeMatrix = generateEncounterMatrix( s, network, 'home');
    elsewhereMatrix = generateEncounterMatrix( s, network, 'elsewhere');
    workPairs = encounterPairs(workMatrix, 0, 9999999);
    homePairs = encounterPairs(homeMatrix, 0, 9999999);
    elsewherePairs = encounterPairs(elsewhereMatrix, 0, 9999999);
    
    %workCount = count(workPairs);
    %homeCount = count(homePairs);
    %elsewhereCount = count(elsewherePairs);
    workCount = [0];
    homeCount = [0];
    elsewhereCount = [0];
    
    function c = count(pairs)
        i = 0;
        c = 1:pairs.size();
        it = pairs.iterator();
        while(it.hasNext())
            current = it.next();
            c(i) = current(3);
            i = i+1;
        end
    end
end

