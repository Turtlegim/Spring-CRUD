create table board_t(
    no          number          primary key,
    title       varchar2(100)   not null,
    name        varchar2(20)    not null,
    content     clob            not null,
    regdate     date            default sysdate,
    readcount   number          default 0,
    password    varchar2(128)   not null
);

ALTER TABLE board_t ADD new_no NUMBER;
alter TABLE board_t add constraint fk_board_t foreign key(new_no) references new_board_t(no);

create sequence board_t_no_seq;

create table new_board_t(
    no          number          primary key,
    name        varchar2(20)    not null,
    regdate     date            default sysdate
);

begin
for i in 1..10002 loop
   insert into board_t
   (no, title, name, password, content, regdate, readcount, NEW_NO)
   values(board_t_no_seq.nextval, '제목'||i,'이름'||i,'1111','내용..'||i,
   sysdate-((10002-i)/24/6), trunc(dbms_random.value(0, 100)), 1);
end loop;
end;


commit;


CREATE TABLE reply_board_t ( 
  re_no number, 
  name varchar2(20),     
  re_context clob,
  regdate date default sysdate,
  seq_first number,
  seq_second NUMBER,
  CONSTRAINT reply_board_t_re_no_fk FOREIGN KEY(re_no) REFERENCES board_t(no),
  CONSTRAINT reply_board_t_re_context_nn check(re_context IS NOT null)
);



create sequence reply_board_t_no_seq;

CREATE SEQUENCE NEW_BOARD_T_NO_SEQ;


ALTER TABLE reply_board_t DROP CONSTRAINT REPLY_BOARD_T_RE_NO_FK;
     
ALTER TABLE reply_board_t
ADD CONSTRAINT DNO
FOREIGN KEY (re_no) REFERENCES board_t(no)
ON DELETE CASCADE;

