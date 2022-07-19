use music;
select * from cd;
update cd
set data_lancamento = '2023/10/01'
where codigo_cd = 1;

update cd
set data_lancamento = '2022/10/01'
where codigo_cd = 2;

select codigo_cd, current_date(),data_lancamento,
data_lancamento + interval '10' day nova_data
from cd;    