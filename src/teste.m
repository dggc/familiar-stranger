  
    homeMatrix = generateEncounterMatrix( s, network, 'home');
    elsewhereMatrix = generateEncounterMatrix( s, network, 'elsewhere');
    workPairs = encounterPairs(workMatrix, 0, 9999999);
    homePairs = encounterPairs(homeMatrix, 0, 9999999);
    elsewherePairs = encounterPairs(elsewhereMatrix, 0, 9999999);