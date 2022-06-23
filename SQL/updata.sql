##空房查询
SELECT lpad(houseid, 10, 0), location, adminname FROM houseinfo, admininfo WHERE house_adminid = adminid AND housestate = 0;
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
    DELETE FROM user_houserelation WHERE uh_relation_houseid = inhouse;
    ##添加记录
    INSERT INTO user_houserelation(uh_relation_userid, uh_relation_houseid, gethousetime)
        VALUES(inuser, inhouse, localtime());
    ##记录修改
    INSERT INTO updatarelation(updatacontent, updatatime, updata_houseid, updata_adminid)
    VALUES(content, localtime(), inhouse, inadmin);
END$$
DELIMITER ;
CALL updata_old(47, 3, 16, '房屋3转手106用户');
## 更新入住时间
UPDATE user_houserelation SET movetime = localtime() WHERE uh_relation_userid = 106 AND uh_relation_houseid = 3;

CALL send_news(21,43,213,'回复投诉/建议','weardf', localtime());


DELIMITER $$
CREATE PROCEDURE send_news(in inadmin INT, in inuser INT, in innews INT, in intitle TEXT,
in incontent TEXT, in inendtime TIMESTAMP, in inc_aid INT)
BEGIN
    UPDATE complaint_and_acviceinfo SET c_a_adminid = inadmin WHERE c_aid = inc_aid;
    INSERT INTO newsinfo(news_adminid,newstitle,newscontent,
    newstime,newsendtime,newstype, newsid)
    VALUES (inadmin, intitle, incontent, localtime(), inendtime, 2, innews);
    INSERT INTO user_newsrelation(un_newsid, un_userid) VALUES (innews, inuser);
END$$
DELIMITER ;