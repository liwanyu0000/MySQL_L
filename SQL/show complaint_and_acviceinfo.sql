##查询投诉/建议
SELECT c_aid,c_acontent,c_atime,c_aobject,adminname FROM complaint_and_acviceinfo LEFT OUTER JOIN admininfo ON c_a_adminid = adminid WHERE c_a_userid = 1;
##添加投诉/建议
INSERT INTO complaint_and_acviceinfo(c_acontent,c_atime,c_aobject,c_a_userid) VALUES('xxxxxxx','2022-05-26 05:17:28','xxx', 1);