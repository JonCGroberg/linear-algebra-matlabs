function [name, ufid, ...
    A, x0, x1, x2, ...
    sol1, P, D, C1, sol2, ...
    x0_another, sol3, C2, sol4] = Exercise2()
    % --- Name & UFID --- %
    name = "Jonathan Groberg";
    ufid = 11973817;

    % --- Part A [10 Points] --- %
    A = [.8 .2 .1;
         .1 .7 .3;
         .1 .1 .6];
    x0 = [.7;
          .2;
          .1];

    x1 = A*x0;
    x2 = A*x1;

    % --- Part B (see SolveDiffEq.m) [10 Points] --- %

    % --- Part C [10 Points] --- %
    % Method 1: Call SolveDiffEq(...)
    sol1 = SolveDiffEq(A,x0);

    % Method 2: Diagonalization (of the Transformation Matrix)
    [P, D] = eig(A);

    C1 = P \ x0;

    sol2 = C1(1)*P(:,1);

    % Observe: Both methods produce exactly the same result/limit
    % Conclude: In the long run, we expect  45% of those surveyed will drive cars, 35% minivans, and 20% suv. 

    % --- Part D [10 Points] --- %
    x0_another = [.3;
                  .3;
                  .4];

    % Method 1: Call SolveDiffEq(...)
    sol3 = SolveDiffEq(A, x0_another);

    % Method 2: Diagonalization (of the Transformation Matrix)
    C2 = P \ x0_another;

    sol4 = C2(1)*P(:,1);

    % Comparision: Different x0 vectors result in the same limit for the
    % function resulting in steady state vector [.45;.35;.2]
    % Theoreom: According to the steady state theoreom, because the entries
    % of each column add up to 1 in the regular stochastic matrix  with the
    % largest eigen value being 1 there exists a unique steady state vector
    % found by taking the limit as k approaches infinity
    % Conclusion: In the long run we expect the the % of people driving
    % a car, van, or suv to be 45%, 35%, and 20% respectively
end
