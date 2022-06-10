#展示未购车位
SELECT pcarid,pcarloction  FROM pcarinfo  WHERE pcarstate<>2;
#展示已购车位
SELECT pcarid,pcar_houseid,buytime,pcarloction  FROM pcarinfo
WHERE pcarstate=2;
#查询已缴费
SELECT costid,cost_houseid,costmoney,coststarttime,paytime,costtype
FROM costinfo,costtypeinfo WHERE cost_costtypeid = costtypeid
and paytime is NOT NULL; 
#查询未缴费
SELECT costid,cost_houseid,costmoney,coststarttime,costtype
FROM costinfo,costtypeinfo WHERE cost_costtypeid = costtypeid
and paytime is NULL;