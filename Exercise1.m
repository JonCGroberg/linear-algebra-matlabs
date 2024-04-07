function [name, ufid, ...
    n1, B1, A1, ...
    P1, D1, PDP1, ...
    P1_again, D1_again, PDP_again, ...
    P2, D2, PDP2, P3, D3, PDP3, ...
    A2, P4, D4, verify1_LHS, verify1_RHS, verify2, basis_eigenspace, ...
    A3, P5, D5, dot_A3, ...
    A4, P6, D6] = Exercise1()
    % --- Name & UFID --- %
    name = "Jonathan Groberg";
    ufid = 11973817;

    rng(ufid, 'twister') % (DO NOT REMOVE)

    % --- Part A [10 Points] --- %
    % vvv GENERATES RANDI MATRIX WITH DISTINCT EIGENVALUES vvv %
    n1 = 4;
    A1 = [];
    B1 = [];
    while length(unique(diag(A1))) ~= n1
        B1 = randiFullRank([-7, 7], n1);
        A1 = triu(B1); % Returns the upper-triangular part of A1
    end
    % ^^^ DO NOT MODIFY! ^^^ %

    % The eigenvalues of A1 are -2, 1, 7, -1 because the eigenvalues of a
    % matrix are found by calculating the determinant of a matrix and since
    % A1 is a diagonal matrix, the characteristic polynomaial can be
    % constructed by using the values in the diagonal

    [P1, D1] = eig(A1); % Returns eigen vectors as P1 and eigen values 
    % in D1(matrix) 

    % P1 is the eigenvectors of A1
    % D1 is the diagonal matrix containing the eigen values

    PDP1 = P1 * D1 * inv(P1); % accounting for error the result is the same 
    % as A1 


    [P1_again, D1_again] = eigvec(A1); % returns the largest possible set of linearly
    % independent eigenvectors of A and eigen values in D1(matrix)
    PDP_again = P1_again * D1_again * inv(P1_again);

    % We can conlude that A1 is diagonalizeable because A1 can successfully
    % be rewritten in the form P * D * P^-1 where this is equal to A1

    % (i) First distinct diagonalization
    P2 = P1; % (DO NOT REMOVE)
    D2 = D1; % (DO NOT REMOVE)

    % MODIFY P2 & D2 HERE
    P2 = P2 * (1/2);

    PDP2 = P2 * D2 * inv(P2);

    % (ii) Second distinct diagonalization
    P3 = P1; % (DO NOT REMOVE)
    D3 = D1; % (DO NOT REMOVE)

    % MODIFY P3 & D3 HERE
    P3 = P3 * 3;

    PDP3 = P3 * D3 * inv(P3);

    % --- Part B [10 Points] --- %
    A2 = [2 1 0 0;
          0 2 1 0; 
          0 0 2 1; 
          0 0 0 2];

    [P4, D4] = eig(A2); % (UNCOMMENT THIS LINE)

    verify1_LHS = A2 * P4;
    verify1_RHS = P4 * D4;
    verify2 = (P4 * D4 * inv(P4));

    % Observe: A2*P4 is equal to P4 * D4 which implies that D4 are Eigen
    % Values for A2 HOWEVER P4 * D4 * P4^-1 is not the same as A and therefore
    % is not Diagonalizable

    basis_eigenspace = NulBasis(A2);

    % A2 is not diagonalizable because...
    % (i) A2*P4 is equal to P4 * D4 HOWEVER P4 * D4 * P4^-1 is not equal
    % to A which implies A is not invertible and therefore not
    % diagonalizable
    % (ii) the basis for the eigenspace is {[1; 0; 0; 0]} of size 1 and
    % because the multiplicity is 4 (not equal) it is not diagonalizable 

    % --- Part C [10 Points] --- %
    A3 = [5 2; 2 5];

    [P5, D5] = eigvec(A3); 

    dot_A3 = dot(P5(:,1),P5(:,2));

    % The eigenvectors of A3 are [1; 1] and [-1; 1]. When the dot product
    % of v1 and v2 are 0 that means they are perpendicular 

    % Solution: x(t) = (c1)(e^7t)([1; 1]) + (c2)(e^3t)([-1, 1])

    % --- Part D [10 Points] --- % 
    A4 = [-9 -12 -6;
           2  1   2; 
           7  12  5];

    [P6, D6] = eig(A4)

    disp(P6*D6*inv(P6))
    % A4 is diagonalizable because P6 * D6 * P6^-1  = A4

    % Solution: x(t) = (c1)(e^sqrt(7))([-.6047l; .2016; 0.7705])
    % + (c2)(e^-3t)([0.8729; -0.2182; -0.4364])
    % + (c3)(e^-sqrt(7)t)([0.8891; -0.2964; -0.3489])
end
