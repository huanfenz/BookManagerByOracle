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

 Date: 04/12/2021 15:21:13
*/


-- ----------------------------
-- Table structure for T_BOOK_TYPE
-- ----------------------------
DROP TABLE "SYSTEM"."T_BOOK_TYPE";
CREATE TABLE "SYSTEM"."T_BOOK_TYPE" (
  "BOOKTYPEID" NUMBER NOT NULL,
  "BOOKTYPENAME" VARCHAR2(254 BYTE) NOT NULL,
  "BOOKTYPEDESC" VARCHAR2(254 BYTE) NOT NULL
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
-- Records of T_BOOK_TYPE
-- ----------------------------
INSERT INTO "SYSTEM"."T_BOOK_TYPE" VALUES ('1', '计算机科学', '计算机相关');
INSERT INTO "SYSTEM"."T_BOOK_TYPE" VALUES ('2', '历史', '历史相关');
INSERT INTO "SYSTEM"."T_BOOK_TYPE" VALUES ('3', '文学', '文学相关');
INSERT INTO "SYSTEM"."T_BOOK_TYPE" VALUES ('4', '科幻', '科幻相关');
INSERT INTO "SYSTEM"."T_BOOK_TYPE" VALUES ('6', '小说', '小说相关');
INSERT INTO "SYSTEM"."T_BOOK_TYPE" VALUES ('7', '外语', '外语相关');

-- ----------------------------
-- Primary Key structure for table T_BOOK_TYPE
-- ----------------------------
ALTER TABLE "SYSTEM"."T_BOOK_TYPE" ADD CONSTRAINT "SYS_C0011121" PRIMARY KEY ("BOOKTYPEID");

-- ----------------------------
-- Checks structure for table T_BOOK_TYPE
-- ----------------------------
ALTER TABLE "SYSTEM"."T_BOOK_TYPE" ADD CONSTRAINT "SYS_C0011118" CHECK ("BOOKTYPEID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_TYPE" ADD CONSTRAINT "SYS_C0011119" CHECK ("BOOKTYPENAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_TYPE" ADD CONSTRAINT "SYS_C0011120" CHECK ("BOOKTYPEDESC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table T_BOOK_TYPE
-- ----------------------------
CREATE TRIGGER "SYSTEM"."t_book_type_trig" BEFORE INSERT ON "SYSTEM"."T_BOOK_TYPE" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
declare
begin
    select seq_t_book_type.nextval into :new.booktypeid from dual;
end dept_trig;
/
