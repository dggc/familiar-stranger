classdef FamiliarStranger
    %FamiliarStranger Interface for retrieving the familiar stranger graph
    % Defines the methods that should be implemented by classes that
    % calculate the familiar stranger graph
    
    methods(Abstract)
        familiarStrangerGraph = calculateFamiliarStrangerGraph(s, network)
        %calculateFamiliarStrangerGraph Calculates the
        %FamiliarStrangerGraph. Should return a adjacency matrix as the
        %result.
    end
    
end

