function newTable = union(table, p, q)
    newTable = table;
    if (p < q)
        newTable(root(table, p)) = root(table, q);
    else
        newTable(root(table, q)) = root(table, p);
    end
end