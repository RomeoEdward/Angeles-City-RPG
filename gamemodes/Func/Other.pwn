forward LoadOther();
public LoadOther()
{
	new
	    rows,
	    fields;

	cache_get_data(rows, fields, g_iHandle);
	
	for (new i = 0; i < rows; i ++)
	{
	 	OtherData[dwlb] = cache_get_field_int(i, "dwlb");
	 	OtherData[mats] = cache_get_field_int(i, "mats");
	 	OtherData[car] = cache_get_field_int(i, "cars");
	}
	return 1;
}

stock SaveOther()
{
    new query[1024];
    
    format(query, sizeof(query), "UPDATE `other` SET `dwlb` = '%d'", OtherData[dwlb]);
    mysql_tquery(g_iHandle, query);
    format(query, sizeof(query), "UPDATE `other` SET `mats` = '%d'", OtherData[mats]);
    mysql_tquery(g_iHandle, query);
    format(query, sizeof(query), "UPDATE `other` SET `cars` = '%d'", OtherData[car]);
    mysql_tquery(g_iHandle, query);
    return 1;
}
