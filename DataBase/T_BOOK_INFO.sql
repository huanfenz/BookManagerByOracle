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

 Date: 04/12/2021 15:21:07
*/


-- ----------------------------
-- Table structure for T_BOOK_INFO
-- ----------------------------
DROP TABLE "SYSTEM"."T_BOOK_INFO";
CREATE TABLE "SYSTEM"."T_BOOK_INFO" (
  "BOOKID" NUMBER NOT NULL,
  "BOOKNAME" VARCHAR2(255 BYTE) NOT NULL,
  "BOOKAUTHOR" VARCHAR2(255 BYTE) NOT NULL,
  "BOOKPRICE" NUMBER NOT NULL,
  "BOOKTYPEID" NUMBER NOT NULL,
  "BOOKDESC" VARCHAR2(1000 BYTE) NOT NULL,
  "ISBORROWED" NUMBER NOT NULL,
  "BOOKIMG" VARCHAR2(255 BYTE) NOT NULL
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
-- Records of T_BOOK_INFO
-- ----------------------------
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('1', 'Java程序设计', '耿祥义', '55.5', '1', '《Java2实用教程》不仅可以作为高等院校相关专业的教材，也适合自学者及软件开发人员参考使用。Java是一种很优秀的编程语言，具有面向对象、与平台无关、安全、稳定和多线程等特点，是目前软件设计中极为健壮的编程语言。Java语言不仅可以用来开发大型的应用程序，而且特别适合于在Internet上应用开发，Java已成为网络时代最重要的编程语言之一。', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112241065.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('2', '红楼梦', '曹雪芹', '36', '3', '《红楼梦》是一部百科全书式的长篇小说。以宝黛爱情悲剧为主线，以四大家族的荣辱兴衰为背景，描绘出18世纪中国封建社会的方方面面。', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112140064.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('4', '西游记', '吴承恩', '60', '3', '《西游记》主要描写的是孙悟空保唐僧西天取经，历经九九八十一难的故事。唐僧取经是历史上一件真实的事。大约距今一千三百多年前，即唐太宗贞观元年（627），年仅25岁的青年和尚玄奘离开京城长安，只身到天竺（印度）游学。他从长安出发后，途经中亚、阿富汗、巴基斯坦，历尽艰难险阻，最后到达了印度。他在那里学习了两年多，并在一次大型佛教经学辩论会任主讲，受到了赞誉。', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112242308.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('5', '水浒传', '施耐庵', '50.6', '3', '《水浒传》是我国第一部以农民起义为题材的长篇章回小说，是我国文学史上一座巍然屹立的丰碑，也是世界文学宝库中一颗光彩夺目的明珠。数百年来，它一直深受我国人民的喜爱，并被译为多种文字，成为我国流传最为广泛的古代长篇小说之一。', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228386001水浒传.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('12', '三国演义', '罗贯中', '42', '3', '《三国演义》又名《三国志演义》、《三国志通俗演义》，是我国小说史上最著名最杰出的长篇章回体历史小说。', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112143793.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('13', '三体（全集）', '刘慈欣', '92', '4', '三体三部曲 (《三体》《三体Ⅱ·黑暗森林》《三体Ⅲ·死神永生》) ，原名“地球往事三部曲”，是中国著名科幻作家刘慈欣的首个长篇系列。', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112143943.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('14', '天龙八部', '金庸', '58', '6', '天龙八部乃金笔下的一部长篇小说，与《射雕》，《神雕》等 几部长篇小说一起被称为可读性最高的金庸小说。《天龙》的故事情节曲折，内容丰富，也曾多次被改编为电视作品。', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112143125.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('27', '明朝那些事儿', '当年明月', '399', '2', '国民史学读本，持续风行十余年，畅销3000万册，全本白话正说明朝大历史', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228686000明朝那些事儿.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('28', '沙丘', 'Frank Herbert', '394.9', '4', '每个“不可不读”的书单上都有《沙丘》！伟大的《沙丘》六部曲中文版初次完整出版！人类每次正视自己的渺小，都是自身的一次巨大进步。', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228758971沙丘.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('30', 'C Primer Plus', '史蒂芬·普拉达', '90.5', '1', 'C语言入门教程，C语言程序设计籍，程序员的启蒙教材，针对C11标准库更新', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637224588022C.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('31', '计算机网络：自顶向下方法', 'James，F.Kurose', '73.4', '1', '以自顶向下的方式系统展现计算机网络的原理与结构，广受欢迎的计算机网络教材。', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637230839418计算机网络.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('32', '围城', '钱钟书', '30.2', '3', '《围城》是一幅栩栩如生的世井百态图，人生的酸甜苦辣千般滋味均在其中得到了淋漓尽致的体现。钱钟书先生将自己的语言天才并入极其渊博的知识，再添加上一些讽刺主义的幽默调料，以一书而定江山。《围城》显示给我们一个真正的聪明人是怎样看人生，又怎样用所有作家都必得使用的文字来表述自己的“观”和“感”的。', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228900554围城.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('33', '平凡的世界', '路遥', '101.8', '3', '人生路遥，但没有白走的路；在平凡的世界里，照样可以活得丰富而精彩。《平凡的世界》激励了一代又一代青年人向上向善、自强不息，产生了广泛而深远的社会影响。读者从路遥身上获取励志的力量，正在于他的作品始终充盈着奋斗、激扬着拼搏，这是作品的魂魄，更是他人生的真实写照。', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228780984平凡的世界.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('34', '哈利波特', 'J.K.罗琳', '648', '6', '本书生动幽默，感人至深，而罗琳的创作经历就像这个故事本身一样令人印象深刻。与哈利·波特一样，J.K.罗琳的内心深藏着魔法。', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228304016哈利波特.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('36', '新概念英语1', '亚历山大', '41.85', '7', '全新的教学理念、有趣的课文内容、全面的技能训练，提供完整、经过实践检验的英语学习体系！', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228199551新概念英语1.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('37', '新概念英语2', '亚历山大', '47.25', '7', '全新的教学理念、有趣的课文内容、全面的技能训练，提供完整、经过实践检验的英语学习体系！', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228195386新概念英语2.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('38', '新概念英语3', '亚历山大', '46.5', '7', '全新的教学理念、有趣的课文内容、全面的技能训练，提供完整、经过实践检验的英语学习体系！', '0', 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228191325新概念英语3.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('100', '红楼梦123', '曹雪芹', '35.5', '3', '为闺阁立传', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111131322401.jpg');
INSERT INTO "SYSTEM"."T_BOOK_INFO" VALUES ('102', '红楼梦', '曹雪芹', '35.5', '3', '为闺阁立传', '0', 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111131322401.jpg');

-- ----------------------------
-- Primary Key structure for table T_BOOK_INFO
-- ----------------------------
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011117" PRIMARY KEY ("BOOKID");

-- ----------------------------
-- Checks structure for table T_BOOK_INFO
-- ----------------------------
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011109" CHECK ("BOOKID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011110" CHECK ("BOOKNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011111" CHECK ("BOOKAUTHOR" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011112" CHECK ("BOOKPRICE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011113" CHECK ("BOOKTYPEID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011114" CHECK ("BOOKDESC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011115" CHECK ("ISBORROWED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SYSTEM"."T_BOOK_INFO" ADD CONSTRAINT "SYS_C0011116" CHECK ("BOOKIMG" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table T_BOOK_INFO
-- ----------------------------
CREATE TRIGGER "SYSTEM"."t_book_info_trig" BEFORE INSERT ON "SYSTEM"."T_BOOK_INFO" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
declare
begin
    select seq_t_book_info.nextval into :new.bookid from dual;
end dept_trig;
/
