## 上司查询

SELECT adminid, adminname, adminphone, adminemail
FROM admininfo WHERE adminid = (
    SELECT padminid FROM admininfo WHERE adminid = 1);

## 删除用户账户

UPDATE userinfo SET isactive = 0 WHERE userid = 3;

## 查询下属

SELECT adminid, adminname, adminphone, adminemail
FROM admininfo WHERE padminid = 21;