function result = root(table, index)
    result = index;
    while (table(result) ~= result)
        result = table(result);
    end
end