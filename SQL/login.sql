## 登录
DELIMITER $$

CREATE PROCEDURE verify_account_up(IN value VARCHAR(50))
BEGIN
    SELECT IFNULL((SELECT TRUE FROM userinfo WHERE userphone = value LIMIT 1), FALSE) AS result;
END$$

DELIMITER ;

CREATE PROCEDURE get_password_up(IN value VARCHAR(50))
BEGIN
    SELECT userpassword FROM userinfo WHERE userphone LIKE value;
END$$

DELIMITER ;

CREATE PROCEDURE verify_account_ue(IN value VARCHAR(50))
BEGIN
    SELECT IFNULL((SELECT TRUE FROM userinfo WHERE useremail = value LIMIT 1), FALSE) AS result;
END$$

DELIMITER ;

CREATE PROCEDURE get_password_ue(IN value VARCHAR(50))
BEGIN
    SELECT userpassword FROM userinfo WHERE useremail LIKE value;
END$$

DELIMITER ;

CREATE PROCEDURE verify_account_ap(IN value VARCHAR(50))
BEGIN
    SELECT IFNULL((SELECT TRUE FROM admininfo WHERE adminphone = value LIMIT 1), FALSE) AS result;
END$$

DELIMITER ;

CREATE PROCEDURE get_password_ap(IN value VARCHAR(50))
BEGIN
    SELECT adminpassword FROM admininfo WHERE adminphone LIKE value;
END$$

DELIMITER ;

CREATE PROCEDURE verify_account_ae(IN value VARCHAR(50))
BEGIN
    SELECT IFNULL((SELECT TRUE FROM admininfo WHERE adminemail = value LIMIT 1), FALSE) AS result;
END$$

DELIMITER ;

CREATE PROCEDURE get_password_ae(IN value VARCHAR(50))
BEGIN
    SELECT adminpassword FROM admininfo WHERE adminemail LIKE value;
END$$

DELIMITER ;

CALL verify_account_up('18538232830');

CALL verify_account_ue('wwmgbp@qq.com;');

CALL verify_account_ap('13423874189');

CALL verify_account_ae('oebvv@eastday.com');

CALL get_password_up('18538232830');

CALL get_password_ue('wwmgbp@qq.com;');

CALL get_password_ap('13423874189');

CALL get_password_ae('oebvv@eastday.com');



## 注册

INSERT INTO userinfo(username, userpassword, userphone) VALUES ('text', 'test', '00000000000');
INSERT INTO userinfo(username, userpassword, useremail) VALUES ('text', 'test', 'test@test.test');
INSERT INTO userinfo(username, userpassword, userphone, useremail) VALUES ('text', 'test', '00000000001', 'test1@test.test');

UPDATE userinfo set isactive = 1 WHERE userphone = '00000000000';

UPDATE userinfo set isactive = 1 WHERE useremail = 'test@test.test';

INSERT INTO admininfo(adminname, adminpassword, adminphone) VALUES ('text', 'test', '00000000000');
INSERT INTO admininfo(adminname, adminpassword, adminemail) VALUES ('text', 'test', 'test@test.test');
INSERT INTO admininfo(adminname, adminpassword, adminphone, adminemail) VALUES ('text', 'test', '00000000001', 'test1@test.test');

UPDATE admininfo set isactive = 1 WHERE adminphone = '00000000000';

UPDATE admininfo set isactive = 1 WHERE adminemail = 'test@test.test';