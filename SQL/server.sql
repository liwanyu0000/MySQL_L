##停车
##查询该用户的停车位
SELECT pcarid, pcarloction, buytime, location FROM pcarinfo, houseinfo, user_houserelation WHERE pcar_houseid = houseid and pcar_houseid = uh_relation_houseid and uh_relation_userid = 1;
##查询空车位
SELECT pcarid, pcarloction FROM pcarinfo WHERE pcarstate = 0;
## 修改车位信息
UPDATE pcarinfo SET pcarstate = 1, pcar_houseid = 33, buytime = localtime() WHERE pcarid = 99;
## 维修
## 查询维修任务
SELECT taskcontent,taskstate FROM taskinfo WHERE task_houseid = 1;
## 查询任务详情
SELECT taskcontent,taskstate,taskstarttime,taskendtime,ataskstate
FROM taskinfo LEFT OUTER JOIN admin_taskrelation
ON admin_task_taskid = taskid WHERE taskid = 1; 
## 插入维修任务
INSERT INTO taskinfo(taskstate, taskcontent, task_houseid) VALUES (0, 'test', 1);