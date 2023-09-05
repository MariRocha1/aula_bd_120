create database filmes;
use filmes;
 
create table filmes(
id_filme int not null,
titulo varchar(60) default null,
genero varchar(45) default null,
duracao varchar(45) default null,
ano_lancamento int default null,
preco_aluguel double default null,
primary key(id_filme)
);


create table atuacoes(
id_protagonista int not null,
id_filme int default null,
id_ator int default null,
primary key(id_protagonista),
foreign key(id_filme) references filmes(id_filme),
foreign key(id_ator) references atores(id_ator)
);


create table atores(
id_ator int not null,
nome_ator varchar(60) default null,
ano_nascimento int default null,
nacionalidade varchar(20) default null,
sexo varchar(10) default null,
primary key(id_ator)
);

select f.titulo,f.genero,nome_ator,a.nacionalidade,a.sexo,f.ano_lancamento from atuacoes at
inner join filmes f
on f.id_filme= at.id_filme
inner join atores a 
on at.id_ator=a.id_ator;

select *from atuacoes;

select * from filmes 
where id_filme=37;
 
 select * from atores
 where id_ator=1;
 
 select f.genero,f.titulo, a.nome_ator from atuacoes at
inner join filmes f
on f.id_filme= at.id_filme
inner join atores a 
on at.id_ator=a.id_ator 
where f.titulo like 'r%';

select f.titulo,f.ano_lancamento from filmes f
inner join atuacoes a on f.id_filme= a.id_filme 
inner join atores at on a.id_ator=at.id_ator
where at.nome_ator like 'Al Pacino';

select at.nome_ator, at.ano_nascimento
from atores at
inner join atuacoes a on at.id_ator=a.id_ator
inner join filmes f on a.id_filme=f.id_filme
where f.titulo like "Jogos Vorazes";

select distinct at.nome_ator, at.nacionalidade
from atores at
inner join atuacoes a on at.id_ator=a.id_ator
inner join filmes f on a.id_filme= f.id_filme
where at.nacionalidade like 'Reino Unido'
and f.genero like 'drama';

select at.nome_ator,f.titulo 
from atores at
inner join atuacoes a on at.id_ator =a.id_ator
inner join filmes f on a.id_filme= f.id_filme
where f.ano_lancamento < 2010;