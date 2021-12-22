/*
 Navicat Premium Data Transfer

 Source Server         : 虚拟机oracle
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : 192.168.199.183:1521
 Source Schema         : SYSTEM

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 04/12/2021 15:21:27
*/


-- ----------------------------
-- Table structure for T_USER
-- ----------------------------
DROP TABLE "SYSTEM"."T_USER";
CREATE TABLE "SYSTEM"."T_USER" (
  "USERID" NUMBER NOT NULL,
  "USERNAME" VARCHAR2(254 BYTE) NOT NULL,
  "USERPASSWORD" VARCHAR2(254 BYTE) NOT NULL,
  "ISADMIN" NUMBER NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of T_USER
-- ----------------------------
INSERT INTO "SYSTEM"."T_USER" VALUES ('1', 'admin', 'admin', '1');
INSERT INTO "SYSTEM"."T_USER" VALUES ('2', '李明', '123456', '0');
INSERT INTO "SYSTEM"."T_USER" VALUES ('11', 'zhang', '123', '0');
INSERT INTO "SYSTEM"."T_USER" VALUES ('13', 'zhao', 'abc', '1');
INSERT INTO "SYSTEM"."T_USER" VALUES ('14', 'wangpeng', '123456', '0');
INSERT INTO "SYSTEM"."T_USER" VALUES ('15', 'wp123', 'wp456', '1');
INSERT INTO "SYSTEM"."T_USER" VALUES ('16', 'wp123', 'wp456', '1');

-- ----------------------------
-- Primary Key structure for table T_USER
-- ----------------------------
ALTER TABLE "SYSTEM"."T_USER" ADD CONSTRAINT "SYS_C0011108" PRIMARY KEY ("USERID");

-- ----------------------------
-- Checks structure for table T_USER
-- ----------------------------
ALTER TABLE "SYSTEM"."T_USER" ADD CONSTRAINT "SYS_C0011105" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_USER" ADD CONSTRAINT "SYS_C0011106" CHECK ("USERPASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_USER" ADD CONSTRAINT "SYS_C0011107" CHECK ("ISADMIN" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table T_USER
-- ----------------------------
CREATE TRIGGER "SYSTEM"."t_user_trig" BEFORE INSERT ON "SYSTEM"."T_USER" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
declare
begin
    select seq_t_user.nextval into :new.userid from dual;
end dept_trig;
/
