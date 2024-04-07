function [y_hat, z, name, ufid] = proj(y, u)
    % Purpose: Finds the orthogonal projection of y onto u and the
    % component of y orthogonal to u
    % Input Argument [y]: Vector y
    % Input Argument [u]: Vector u
    % Output Argument [y_hat]: projection of y onto u
    % Output Argument [z]: component of y orthogonal to u

    % --- Name & UFID --- %
    name = "Jonathan Groberg";
    ufid = 11973817;

    y_hat = dot(y,u)/dot(u,u)*u;
    z = y-y_hat;
end
