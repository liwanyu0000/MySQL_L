CREATE TABLE userinfo(
    userid INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username VARCHAR(12) NOT NULL COMMENT '用户名',
    userpassword VARCHAR(255) NOT NULL COMMENT '密码',
    isactive TINYINT NOT NULL COMMENT '是否激活(0:未激活, 1:已激活)' DEFAULT(0),
    userphone VARCHAR(11) UNIQUE COMMENT '手机号码',
    useremail VARCHAR(50) UNIQUE COMMENT '邮箱'
);
CREATE TABLE admininfo(
    adminid INT AUTO_INCREMENT PRIMARY KEY COMMENT '管理员ID',
    adminname VARCHAR(12) NOT NULL COMMENT '管理员名',
    adminpassword VARCHAR(255) NOT NULL COMMENT '密码',
    isactive TINYINT NOT NULL COMMENT '是否激活(0:未激活, 1:已激活)' DEFAULT(0),
    adminphone VARCHAR(11) UNIQUE COMMENT '手机号码',
    adminemail VARCHAR(50) UNIQUE COMMENT '邮箱',
    padminid INT DEFAULT(NULL) COMMENT '父管理员ID',
    FOREIGN KEY (padminid) REFERENCES admininfo(adminid)
);
CREATE TABLE houseinfo(
    houseid INT AUTO_INCREMENT PRIMARY KEY COMMENT '房屋ID',
    location VARCHAR(20) NOT NULL COMMENT '位置',
    housestate TINYINT NOT NULL COMMENT '房屋状态(0:无用户, 1:有用户)' DEFAULT 0,
    house_adminid INT NOT NULL COMMENT '管理员ID',
    FOREIGN KEY (house_adminid) REFERENCES admininfo(adminID)
);
CREATE TABLE complaint_and_acviceinfo(
    c_aid INT AUTO_INCREMENT PRIMARY KEY COMMENT '投诉/建议ID',
    c_atime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
    c_aobject VARCHAR(20)  COMMENT '对被投诉/建议的对象的描述',
    c_acontent TEXT NOT NULL COMMENT '内容',
    c_a_userid INT NOT NULL COMMENT '用户ID',
    c_a_adminid INT COMMENT '管理员ID',
    FOREIGN KEY (c_a_userid)  REFERENCES userinfo(userid),
    FOREIGN KEY (c_a_adminid) REFERENCES admininfo(adminID)
);
CREATE TABLE newsinfo(
    newsid INT AUTO_INCREMENT PRIMARY KEY COMMENT '消息ID',
    newstime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
    newscontent TEXT NOT NULL COMMENT '内容',
    newstype TINYINT NOT NULL DEFAULT 0 COMMENT '房屋状态(0:全体用户, 1:多用户, 2:单用户)',
    newsendtime TIMESTAMP COMMENT '到期时间',
    news_adminid INT NOT NULL COMMENT '管理员ID',
    FOREIGN KEY (news_adminid) REFERENCES admininfo(adminid)
);
CREATE TABLE costtypeinfo(
    costtypeid int AUTO_INCREMENT PRIMARY KEY COMMENT '费用类型ID',
    costtype VARCHAR(20) NOT NULL COMMENT '费用类型'
);
CREATE TABLE costinfo(
    costid INT AUTO_INCREMENT PRIMARY KEY COMMENT '费用ID',
    coststarttime TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
    paytime TIMESTAMP COMMENT '缴费时间',
    costmoney DOUBLE NOT NULL COMMENT '金额',
    cost_houseid INT NOT NULL COMMENT '房屋ID',
    cost_userid INT NOT NULL COMMENT '用户ID',
    cost_costtypeid INT NOT NULL COMMENT '费用类型ID',
    FOREIGN KEY (cost_houseid)  REFERENCES houseinfo(houseid),
    FOREIGN KEY (cost_userid)  REFERENCES userinfo(userid),
    FOREIGN KEY (cost_costtypeid)  REFERENCES costtypeinfo(costtypeid)
);
CREATE TABLE taskinfo(
    taskid INT AUTO_INCREMENT PRIMARY KEY COMMENT '维修ID',
    taskstate TINYINT NOT NULL DEFAULT 0 COMMENT '维修状态(0:未开始, 1:已开始, 2:已完成)',
    taskcontent TEXT NOT NULL COMMENT '维修内容',
    task_userid INT NOT NULL COMMENT '用户ID',
    FOREIGN KEY (task_userid) REFERENCES userinfo(userid)
);
CREATE TABLE pcarinfo(
    pcarid INT AUTO_INCREMENT PRIMARY KEY COMMENT '停车位ID',
    pcarstate TINYINT NOT NULL DEFAULT 0 COMMENT '停车位状态(0:空闲,  1:已停车, 2:已预定)',
    pcarloction VARCHAR(20) NOT NULL COMMENT '位置',
    buytime TIMESTAMP COMMENT '购买时间',
    pcar_houseid INT COMMENT '房屋ID',
    FOREIGN KEY (pcar_houseid) REFERENCES houseinfo(houseid)
);
CREATE TABLE user_houserelation(
    uh_relation_userid INT COMMENT '用户ID',
    uh_relation_houseid INT COMMENT '房屋ID',
    gethousetime TIMESTAMP COMMENT '购房时间',
    movetime TIMESTAMP COMMENT '入住时间',
    PRIMARY KEY (uh_relation_userid, uh_relation_houseid),
    FOREIGN KEY (uh_relation_userid) REFERENCES userinfo(userid),
    FOREIGN KEY (uh_relation_houseid) REFERENCES houseinfo(houseid)
);
CREATE TABLE updatarelation(
    updataid INT AUTO_INCREMENT PRIMARY KEY COMMENT '更新ID',
    updatacontent TEXT NOT NULL COMMENT '更新内容',
    updatatime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    updata_houseid INT NOT NULL COMMENT '房屋ID',
    updata_adminid INT NOT NULL COMMENT '管理员ID',
    FOREIGN KEY (updata_houseid) REFERENCES houseinfo(houseid) ,
    FOREIGN KEY (updata_adminid) REFERENCES admininfo(adminid)
);
CREATE TABLE admin_taskrelation(
    admin_taskid INT AUTO_INCREMENT PRIMARY KEY COMMENT '维修信息',
    ataskstate TINYINT NOT NULL DEFAULT 0 COMMENT '维修状态(0:正在维修, 1:维修完成, 2:维修失败)',
    taskstarttime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '维修任务分配时间',
    taskendtime TIMESTAMP COMMENT '维修完成时间',
    admin_task_taskid INT NOT NULL COMMENT '维修ID',
    admin_task_adminid INT NOT NULL COMMENT '管理员ID',
    FOREIGN KEY (admin_task_taskid) REFERENCES taskinfo(taskid),
    FOREIGN KEY (admin_task_adminid) REFERENCES admininfo(adminid)
);

CREATE TABLE user_newsrelation(
    user_newssrelationid INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID',
    un_newsid INT NOT NULL COMMENT '消息ID',
    un_userid INT NOT NULL COMMENT '用户ID',
    FOREIGN KEY (un_newsid) REFERENCES newsinfo(newsid),
    FOREIGN KEY (un_userid) REFERENCES userinfo(userid)
);