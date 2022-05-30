--board, member, payment, product

-- board 테이블 생성
create table board(seq number primary key,      --글번호
title varchar2(100) not null,                   --제목
content varchar2(800) not null,                 --내용
nickname varchar2(20),                          --닉네임
regdate date,                                   --작성일
visited number                                  --조회수
);

select * from board;
select * from board where seq=2;

insert into board values(1, '샘플1 제목입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), '샘플2 제목입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), '샘플3 제목입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), '샘플4 제목입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), '샘플5 제목입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', sysdate, 0);
insert into board values((select nvl(max(seq), 0)+1 from board), '샘플6 제목입니다.', '여기는 샘플 글1에 대한 내용입니다.', 'admin', sysdate, 0);

update board set title=?, content=?, nickname=?, regdate=sysdate where seq=?;

delete from board where seq=?;


-- member 테이블 생성
create table member(cid varchar2(20) primary key,
upw varchar2(100) not null,
uname varchar2(20) not null,
tel varchar2(15) not null,
email varchar2(50) not null,
birth date,
regdate date
);

insert into member values('admin', '1234', '관리자','010-1234-5678','admin@naver.com','1998-01-16',sysdate);
insert into member values('soom', '5633', '조수민','010-1111-2222','soom@naver.com','1998-12-25',sysdate);
insert into member values('bez', '1111', '백이진','010-7777-8888','bez@naver.com','1992-02-14',sysdate);

select * from member;
drop table member;

--payment 테이블 생성

--상품(goods) 테이블 생성
create table goods(gno number primary key,
gtype varchar2(200),
gname varchar2(50),
gprice number,
gsize varchar2(40),
gamount number,
gcontent varchar(1000),
gimg varchar(1000)
);

select * from goods;


--장바구니(shopping basket) 테이블 생성
create table basket(bno number primary key, -- 장바구니번호
cid varchar2(20),    -- 사용자아이디
gno number,             -- 상품코드
gsize varchar2(40),     -- 크기
gamount number,          -- 수량
bdate Date              -- 장바구니 담긴 날짜
);

select * from basket;

-- 장바구니 담기
insert into basket values ();

-- 장바구니 정보 변경
update basket set gno=?, gcolor=?, amount=?, gsize=?, bdate=sysdate where bno=?;

-- 장바구니 삭제
delete from basket where bno=?;

-- 장바구니 검색
select * from basket;

CREATE TABLE db_access (
  no number primary key,
  request_uri varchar(100),
  query_string varchar(200),
  remote_address varchar(30),
  server_name varchar(60),
  server_port varchar(10),
  locale varchar(20),
  browser varchar(200),
  referer varchar(255),
  session_id varchar(80),
  user_id varchar(20),
  response_time number,
  reg_date date default sysdate
);

select * from db_access;

commit;
