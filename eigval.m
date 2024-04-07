function [evalues, repeats] = eigval(A)
    % eigval  Eigenvalues and their algebraic multiplicity.
    %
    % evalues = eigval(A) returns the distinct eigenvalues of A,
    % with duplicates removed and sorted in decreasing order.
    %
    % [evalues, repeats] = eigval(A) also returns the row vector
    % repeats that gives the multiplicity of each eigenvalue.
    % The sum of the multiplicities is n.

    tol = sqrt(eps);
    lambda = sort(eig(A));
    lambda = round(lambda/tol) * tol;
    
    % lambda gives all n eigenvalues (repetitions included).
    
    evalues = unique(lambda);
    evalues = flipud(evalues);
    n = length(lambda);
    d = length(evalues);
    A = ones(n, 1) * evalues';
    B = lambda * ones(1, d);
    MATCH = abs(A-B) <= tol;
    
    % MATCH is an n by d zero matrix except
    % MATCH(i,j) = 1 when lambda(i) = evalues(j).
    % Summing the columns gives the row vector repeats.
    
    repeats = sum(MATCH);
end
