function isposdef = observabilityGramian(sys)
   % Wo is the matrix.
   % W_o=\sum_{k=0}^{\infty}\left(A^T\right)^kC^TCA^k
    Wo = gram(sys,'o');
    d=eig(Wo);
    isposdef=all(d>0);
    % If the return is 1 (TRUE) it is observable.
end

% Test the system by writing at the command line£º
%      sys = ss(matrixA,matrixB,matrixC,matrixD);
