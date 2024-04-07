function [name, ufid, ...
    u1, u2, v1, v2, v3, ...
    u1_dot_v1, v1_dot_u1, ...
    norm_u1, u1_dot_u1, norm_v1, v1_dot_v1, ...
    LHS1, RHS1, LHS2, RHS2, LHS3, RHS3, ...
    y1, z1, verify_sum1, verify_orthogonal1, ...
    y2, z2, verify_sum2] = Exercise3()
    % --- Name & UFID --- %
    name = "Jonathan Groberg";
    ufid = 11973817;

    % --- Part A [10 Points] --- %
    u1 = [1; 2; -1; 3];
    u2 = [3; -3; 2; -2];

    v1 = [2; -1; 3; -1];
    v2 = [-6; 6; -4; 4];
    v3 = [6; -6; 4; -4];

    % (i) u1  v1 and v1  u1
    u1_dot_v1 = dot(u1,v1);
    v1_dot_u1 = dot(v1,u1);
    % Property: The dot product/inner products is/are -6 for both
    % U1 ⋅ V1 and V1 ⋅ U1 . 

    % (ii) ||u1||, u1  u1 and ||v1||, v1  v1
    norm_u1 = norm(u1);
    u1_dot_u1 = dot(u1,u1);

    norm_v1 = norm(v1);
    v1_dot_v1 = dot(v1,v1);

    % Relation Between Inner Product & Norm: The dot product of a vector
    % with itself is the same as the norm of the same vector squared

    % (iii) Verify Cauchy-Schwarz Inequality (|u  v| <= ||u|| * ||v||)
    % => u1 & v1
    LHS1 = abs(dot(u1,v1));
    RHS1 = norm(u1)*norm(v1);
    % Observe: LHS1 < RHS1 is true where LHS = 6 and RHS1 = 15

    % => u2 & v2
    LHS2 = abs(dot(u2,v2));
    RHS2 = norm(u2)*norm(v2);
    % Observe: IS LHS2 <= RHS2 is true where 52 = 52

    % => u2 & v3
    LHS3 = abs(dot(u2, v3));
    RHS3 = norm(u2)*norm(v3);
    % Observe: LHS3 <= RHS3 is true where both sides are equal to 52

    % The Cauchy-Schwarz Inequality is an equality when U and V are
    % linearly dependent meaning U and V are on the same line (or one
    % vector is 0)

    % --- Part B (see proj.m) [10 Points] --- %

    % --- Part C [10 Points] --- %
    % (i) v1 as a linear combination of u1 and u1's orthogonal complement

    [y1, z1] = proj(v1,u1);

    verify_sum1 = isequal(v1,y1+z1);
    verify_orthogonal1 = dot(z1,u1)<10e-8;

    % (ii) v2 as a linear combination of u2 and u2's orthogonal complement
    [y2, z2] =  proj(v2,u2)

    verify_sum2 = isequal(v2, y2+z2);

    % z2 is the zero vector because v2 and u2 are already orthogonal so
    % there is not additionaly componented needed
end
