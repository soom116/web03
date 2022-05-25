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
email varchar2(50),
addr1 varchar2(200),
addr2 varchar2(100),
postcode varchar2(10),
birth date,
regdate date
);

insert into member values('admin', '1234', '관리자','010-1234-5678','admin@naver.com','대화1로 51', '대화동', '10218', '1998-01-16',sysdate);

select * from member;