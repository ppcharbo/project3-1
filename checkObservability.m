function unobsv = checkObservability(A, C)
   % Returns the observable matrix. If this matrix is full rank, the system is proved to be observable.
   % If it is not full rank, the number of unobservables = the number of rows of the A matrix - the rank of the observable matrix.
    Ob = obsv(A,C);
   % Returns the number of unobservables.
   % (if it is 0) Observable
   unobsv = length(A) - rank(Ob);
end

% checkObservability: this method is simple and straightforward, and also gives an indication of how much of the data is unobservable.
% observabilityGramian: This is a more complex test.
% Gramian may be more practical for large and complex systems, where the calculations are faster when the system is larger.
% However, checkObservability is more intuitive for smaller systems.