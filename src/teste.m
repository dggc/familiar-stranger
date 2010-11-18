workMatrix = generateEncounterMatrix( s, network, 'home');
homeMatrix = generateEncounterMatrix( s, network, 'home');
elsewhereMatrix = generateEncounterMatrix( s, network, 'elsewhere');

workPairs = encounterPairs(workMatrix, 0, 9999999);
homePairs = encounterPairs(homeMatrix, 0, 9999999);
elsewherePairs = encounterPairs(elsewhereMatrix, 0, 9999999);

workDateMatrix = generateDateEncounterMatrix(s,network,'work');
homeDateMatrix = generateDateEncounterMatrix(s,network,'home');
elsewhereDateMatrix = generateDateEncounterMatrix(s,network,'elsewhere');

workWeeks = weeks(s,network,workDateMatrix,0,9999);
homeWeeks = weeks(s,network,homeDateMatrix,0,9999);
elsewhereWeeks = weeks(s,network,elsewhereDateMatrix,0,9999);

workFriendDateMatrix = generateFriendDateEncounterMatrix(s,network, workDateMatrix);
homeFriendDateMatrix = generateFriendDateEncounterMatrix(s,network,homeDateMatrix);
elsewhereFriendDateMatrix = generateFriendDateEncounterMatrix(s,network,elsewhereDateMatrix);

workNonFriendDateMatrix = generateNonFriendDateEncounterMatrix(s,network,workDateMatrix);
homeNonFriendDateMatrix = generateNonFriendDateEncounterMatrix(s,network,homeDateMatrix);
elsewhereNonFriendDateMatrix = generateNonFriendDateEncounterMatrix(s,network,elsewhereDateMatrix);

workFriendWeeks = weeks(s,network,workFriendDateMatrix,0,9999);
homeFriendWeeks = weeks(s,network,homeFriendDateMatrix,0,9999);
elsewhereFriendWeeks = weeks(s,network,elsewhereFriendDateMatrix,0,9999);

workNonFriendWeeks = weeks(s,network,workNonFriendDateMatrix,0,9999);
homeNonFriendWeeks = weeks(s,network,homeNonFriendDateMatrix,0,9999);
elsewhereNonFriendWeeks = weeks(s,network,elsewhereNonFriendDateMatrix,0,9999);

