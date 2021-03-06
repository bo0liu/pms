package com.petrodata.pms.team

import com.petrodata.pms.core.BaseDepartment
import com.petrodata.pms.core.BaseUser
//班次
class Rotation {
    //名称
    String name
    //录入人（小队队长）
    BaseUser creater;
    //隶属小队   初始化时与录入者的部门id相同
    BaseDepartment baseDepartment;
    //时区  演算成与服务器时区的小时差
    String timeZone
    //
    //岗位包含人员
    static hasMany = [baseUsers:BaseUser]
    static constraints = {
    }
    def beforeInsert() {
        baseDepartment=creater?.baseDepartment;
    }
}
