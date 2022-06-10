#查询维修任务
#未接取任务查询
SELECT task_houseid,taskcontent FROM taskinfo where taskstate = 0;
#已开始任务查询
SELECT task_houseid,taskstarttime,taskcontent,ataskstate FROM taskinfo,admin_taskrelation where taskid=admin_task_taskid AND taskstate = 1;
#已完成任务查询
SELECT task_houseid,taskstarttime,taskendtime,taskcontent FROM taskinfo,admin_taskrelation where taskid=admin_task_taskid AND taskstate = 2;
#更改任务状态存入

#接取未开始任务
DELIMITER $$
CREATE PROCEDURE receive_task(IN intask INT, IN inadmin INT)
BEGIN
    UPDATE taskinfo SET taskstate = 1 WHERE  taskid = intask;
    INSERT INTO  admin_taskrelation (ataskstate, taskstarttime,
    admin_task_taskid, admin_task_adminid)
    VALUES(0, localtime(), intask, inadmin);
END$$
DELIMITER ;

CALL receive_task(13, 12);

#维修完成

DELIMITER $$
CREATE PROCEDURE successful_task(IN inatr INT)
BEGIN
    UPDATE taskinfo SET taskstate = 2 WHERE  taskid = (
        SELECT admin_task_taskid FROM admin_taskrelation
        WHERE admin_taskid = inatr);
    UPDATE admin_taskrelation SET ataskstate = 1, taskendtime = localtime()
    WHERE admin_taskid =  inatr;
END$$
DELIMITER ;

CALL successful_task(92);

#维修失败

DELIMITER $$
DELIMITER $$
CREATE PROCEDURE fail_task(IN inatr INT)
BEGIN
    UPDATE taskinfo SET taskstate = 0 WHERE  taskid = (
        SELECT admin_task_taskid FROM admin_taskrelation
        WHERE admin_taskid = inatr);
    UPDATE admin_taskrelation SET ataskstate = 2
    WHERE admin_taskid =  inatr;
END$$
DELIMITER ;
CALL fail_task(85);