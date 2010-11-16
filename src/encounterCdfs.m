function result = encounterCdfs( s, network )
    workMatrix = generateEncounterMatrix( s, network, 'work');
    homeMatrix = generateEncounterMatrix( s, network, 'home');
    elsewhereMatrix = generateEncounterMatrix( s, network, 'elsewhere');
    workPairs = encounterPairs(workMatrix, 0, 9999999);
    homePairs = encounterPairs(homeMatrix, 0, 9999999);
    elsewherePairs = encounterPairs(elsewhereMatrix, 0, 9999999);
    
    workCount = count(workPairs);
    homeCount = count(homePairs);
    elsewhereCount = count(elsewherePairs);
%     workMatrix = 0;
%     homeMatrix = 1;
%     elsewhereMatrix = 2;
%     workPairs = 3;
%     homePairs = 4;
%     elsewherePairs = 5;
%     workCount = 6;
%     homeCount = 7;
%     elsewhereCount = 8;
    
    function c = count(pairs)
        i = 1;
        c = 1:pairs.size();
        it = pairs.iterator();
        while(it.hasNext())
            current = it.next();
            c(i) = current(3);
            i = i+1;
        end
    end

    result = [ workCount, workPairs, workMatrix, homeCount, homePairs, homeMatrix, elsewhereCount, elsewherePairs, elsewhereMatrix ];
end

