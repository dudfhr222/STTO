-- 생성자 Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   위치:        2022-05-02 10:34:25 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE USER scott
    IDENTIFIED BY
    ACCOUNT UNLOCK
;

GRANT CREATE SYNONYM, CREATE view, unlimited tablespace to scott;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE SCOTT.BOARDS
(
    b_number     NUMBER(5),
    b_id         VARCHAR2(15 BYTE),
    b_title      VARCHAR2(80 BYTE),
    b_content    VARCHAR2(3000 BYTE),
    b_startdate  VARCHAR2(10 BYTE),
    b_finishdate VARCHAR2(10 BYTE),
    b_stmember   NUMBER(5),
    b_interests  VARCHAR2(30 BYTE),
    b_goal       VARCHAR2(30 BYTE),
    b_status     NUMBER(5),
    b_ref        NUMBER(5),
    b_step       NUMBER(5),
    b_group      NUMBER(5) DEFAULT 1--그룹 번호 ,
        B_GMEMBER    NUMBER (5) DEFAULT 1 --그룹 내 회원번호 ,
        B_INTER_CH   VARCHAR2 (30 BYTE) ,
    B_AREA       VARCHAR2 (30 BYTE) ,
    B_LANGUAGE   VARCHAR2 (30 BYTE)
) PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE scott.groupboard (
                                  gr_mem_number NUMBER(10),
                                  gr_mem_gnum   NUMBER(10),
                                  gr_mem_name   VARCHAR2(12 BYTE),
                                  gr_mem_study  VARCHAR2(2000 BYTE),
                                  gr_mem_conid  NUMBER(3),
                                  gr_mem_date   VARCHAR2(30 BYTE),
                                  gr_check      NUMBER(3)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE scott.groupmemberboard (
                                        gr_mem_gnum      NUMBER(5),
                                        mem_id           VARCHAR2(15 BYTE),
                                        gr_mem_number    NUMBER(10),
                                        gr_mem_name      VARCHAR2(12 BYTE),
                                        mem_email        VARCHAR2(50 BYTE),
                                        group_goal       VARCHAR2(2000 BYTE),
                                        group_studydate  VARCHAR2(30 BYTE),
                                        group_startdate  VARCHAR2(30 BYTE),
                                        group_finishdate VARCHAR2(30 BYTE),
                                        group_interests  VARCHAR2(30 BYTE),
                                        group_report     NUMBER(3),
                                        group_like       NUMBER(3),
                                        gr_mem_date      VARCHAR2(20 BYTE),
                                        group_introduce  VARCHAR2(2000 BYTE)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE scott.groupmemberboard ADD CONSTRAINT groupmemberboard_pk PRIMARY KEY ( gr_mem_gnum );

CREATE TABLE scott.grouprequest (
                                    mem_name  VARCHAR2(15 BYTE),
                                    mem_id    VARCHAR2(15 BYTE),
                                    b_title   VARCHAR2(80 BYTE),
                                    b_id      VARCHAR2(15 BYTE),
                                    b_gmember NUMBER(5),
                                    b_group   NUMBER(5)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE scott.memtemp (
                               gr_mem_gnum      NUMBER(5),
                               mem_id           VARCHAR2(15 BYTE),
                               gr_mem_number    NUMBER(10),
                               gr_mem_name      VARCHAR2(12 BYTE),
                               mem_email        VARCHAR2(50 BYTE),
                               group_goal       VARCHAR2(2000 BYTE),
                               group_studydate  VARCHAR2(30 BYTE),
                               group_startdate  VARCHAR2(30 BYTE),
                               group_finishdate VARCHAR2(30 BYTE),
                               group_interests  VARCHAR2(30 BYTE),
                               group_report     NUMBER(3),
                               group_like       NUMBER(3),
                               gr_mem_date      VARCHAR2(20 BYTE),
                               group_introduce  VARCHAR2(2000 BYTE)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE scott.stmembers (
                                 mem_num       NUMBER DEFAULT 10000,
                                 mem_id        VARCHAR2(15 BYTE),
                                 mem_pw        VARCHAR2(20 BYTE),
                                 mem_name      VARCHAR2(12 BYTE),
                                 mem_jumin     NUMBER(13),
                                 mem_tel       NUMBER(11),
                                 mem_email     VARCHAR2(50 BYTE),
                                 mem_interests VARCHAR2(30 BYTE),
                                 mem_introduce VARCHAR2(2000 BYTE),
                                 mem_report    NUMBER(5)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE scott.stmembers ADD CONSTRAINT stmembers_pk PRIMARY KEY ( mem_id );

ALTER TABLE scott.boards
    ADD CONSTRAINT boards_stmembers_fk FOREIGN KEY ( b_id )
        REFERENCES scott.stmembers ( mem_id )
        ON DELETE CASCADE
        NOT DEFERRABLE;

ALTER TABLE scott.groupboard
    ADD CONSTRAINT groupboard_groupmemberboard_fk FOREIGN KEY ( gr_mem_gnum )
        REFERENCES scott.groupmemberboard ( gr_mem_gnum )
        ON DELETE CASCADE
        NOT DEFERRABLE;

ALTER TABLE scott.groupmemberboard
    ADD CONSTRAINT groupmemberboard_stmembers_fk FOREIGN KEY ( mem_id )
        REFERENCES scott.stmembers ( mem_id )
        ON DELETE CASCADE
        NOT DEFERRABLE;