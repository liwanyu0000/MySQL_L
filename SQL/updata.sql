##空房查询
SELECT houseid, location, house_adminid FROM houseinfo WHERE housestate = 0;
## 修改房屋信息
## 新房
DELIMITER $$
CREATE PROCEDURE updata_new(IN inhouse INT, IN inuser INT, IN inadmin INT, in content TEXT)
BEGIN
    ##修改房屋状态，添加用户
    UPDATE houseinfo SET housestate = 1 WHERE houseid = inhouse;
    INSERT INTO user_houserelation(uh_relation_userid, uh_relation_houseid, gethousetime)
        VALUES(inuser, inhouse, localtime());
    ##记录修改
    INSERT INTO updatarelation(updatacontent, updatatime, updata_houseid, updata_adminid)
    VALUES(content, localtime(), inhouse, inadmin);
END$$
DELIMITER ;
CALL updata_new(72, 106, 23, '101用户入住72房屋');
## 更新入住时间
UPDATE user_houserelation SET movetime = localtime() WHERE uh_relation_userid = 106 AND uh_relation_houseid = 72;

## 旧房

DELIMITER $$
CREATE PROCEDURE updata_old(IN inhouse INT, IN inuser INT, IN inadmin INT, in content TEXT)
BEGIN
    ##清空该房屋的费用，车位
    UPDATE costinfo SET paytime = localtime() WHERE paytime IS NULL;
    UPDATE costinfo SET istrue = 0 WHERE cost_houseid = inhouse;
    UPDATE pcarinfo SET pcarstate = 0, buytime = NULL, pcar_houseid = NULL WHERE pcar_houseid = inhouse;
    ##添加记录
    INSERT INTO user_houserelation(uh_relation_userid, uh_relation_houseid, gethousetime)
        VALUES(inuser, inhouse, localtime());
    ##记录修改
    INSERT INTO updatarelation(updatacontent, updatatime, updata_houseid, updata_adminid)
    VALUES(content, localtime(), inhouse, inadmin);
END$$
DELIMITER ;
CALL updata_old(3, 106, 16, '房屋3转手106用户');
## 更新入住时间
UPDATE user_houserelation SET movetime = localtime() WHERE uh_relation_userid = 106 AND uh_relation_houseid = 3;