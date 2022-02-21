			create table board(
				no number primary key,
				refno number,
				title varchar2(100),
				writer varchar2(100),
				content varchar2(2000),
				regdte date,
				uptdte date,
				readcnt number
			);
			create sequence board_seq
				start with 1
				minvalue 1;
			insert into board values(board_seq.nextval, 0, '초기화면','홍길동',
				'내용', sysdate, sysdate, 0);
			select * 
			from board 
			where writer like '%%' and title like '%%'
			ORDER by no desc;	