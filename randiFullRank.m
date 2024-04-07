function R = randiFullRank(bounds, n)
    R = [];
    while rank(R) < n
        R = randi(bounds, n);
    end
end
