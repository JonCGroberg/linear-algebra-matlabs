function N = NulBasis(A)
    % N = NulBasis(A) returns a basis for the nullspace of A
    % in the columns of N. The basis contains the n-r special
    % solutions to Ax=0.  freecol is the list of free columns.

    [R, pivcol] = rref(A, sqrt(eps));
    [~, n] = size(A);
    r = length(pivcol);

    % Get the column indices of the columns that do not contain a pivot
    freecol = 1:n;
    freecol(pivcol) = [];

    N = zeros(n, n - r);
    N(freecol, : ) = eye(n-r);
    N(pivcol,  : ) = -R(1:r, freecol);
end
