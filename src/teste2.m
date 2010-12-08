workMatrix = generateEncounterMatrix( s, network, 'work');
homeMatrix = generateEncounterMatrix( s, network, 'home');
elsewhereMatrix = generateEncounterMatrix( s, network, 'elsewhere');

workFriendCount = generateFriendCount(s,network,workMatrix);
homeFriendCount = generateFriendCount(s,network,homeMatrix);
elsewhereFriendCount = generateFriendCount(s,network,elsewhereMatrix);

workNonFriendCount = generateNonFriendCount(s,network,workMatrix);
homeNonFriendCount = generateNonFriendCount(s,network,homeMatrix);
elsewhereNonFriendCount = generateNonFriendCount(s,network,elsewhereMatrix);


