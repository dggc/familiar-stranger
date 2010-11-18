% function printFriends = matchFriends(s, network)
% 
%     for i=1:94
%         for j=1:94
%             friend = (network.friends(i, j) == 1);
%             disp(sprintf('i: %d j: %d friends? %d\n',i, j, friend));
%         end
%     end
%     printFriends = friend;
%     
% end

function isAFriend = matchFriends( network, i, j)

    isAFriend = (network.friends(i, j) == 1);
    
end