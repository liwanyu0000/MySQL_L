#用户
;
##查询该用户的所有消息
SELECT newsid,newstitle,newstime,newsendtime,adminname FROM newsinfo,admininfo WHERE news_adminid = adminid and newstype = 0
UNION ALL
SELECT newsid,newstitle,newstime,newsendtime,adminname FROM admininfo,newsinfo,user_newsrelation WHERE news_adminid = adminid and un_newsid = newsid  and un_userid = 2
ORDER BY newstime DESC;

##查询一条消息
SELECT newsid,newscontent,newstime,newsendtime,adminname FROM newsinfo,admininfo WHERE news_adminid = adminid and newsid = 1;

#管理员
;

## 查询未回复信息
SELECT c_aid,c_a_userid,c_acontent,c_aobject,c_atime
FROM complaint_and_acviceinfo WHERE c_a_adminid IS NULL;

## 查询已回复投诉建议
SELECT c_aid,c_a_userid,c_acontent,c_aobject,c_atime
FROM complaint_and_acviceinfo WHERE c_a_adminid IS NOT NULL;

## 发公告
INSERT INTO newsinfo(news_adminid,newstitle,newscontent,newstime,newsendtime,newstype)
VALUES (12, 'test', 'test', localtime(), localtime(), 0);

## 发单人消息

DELIMITER $$
CREATE PROCEDURE send_news(in inadmin INT, in inuser INT, in innews INT, in intitle TEXT,
in incontent TEXT, in inendtime TIMESTAMP)
BEGIN
    INSERT INTO newsinfo(news_adminid,newstitle,newscontent,
    newstime,newsendtime,newstype, newsid)
    VALUES (inadmin, intitle, incontent, localtime(), inendtime, 2, innews);
    INSERT INTO user_newsrelation(un_newsid, un_userid) VALUES (innews, inuser);
END$$
DELIMITER ;

CALL send_news(19, 23, 103, 'text', 'text', localtime());
