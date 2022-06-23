## 查询房屋费用
SELECT * FROM costinfo, costtypeinfo WHERE cost_costtypeid = costtypeid AND cost_houseid =  1;

## 缴费修改

UPDATE costinfo set paytime = localtime() WHERE costid = 88;

## 房屋信息查询

SELECT houseid,location,gethousetime,movetime,adminname FROM houseinfo, user_houserelation, admininfo WHERE uh_relation_houseid = houseid and house_adminid = adminid and uh_relation_userid = 1;