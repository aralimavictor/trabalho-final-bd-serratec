-- Criação das tabelas:
create table paciente (
	id serial primary key,
	nome_completo varchar(100) not null,
	cpf varchar(11) not null unique,
	data_nascimento date not null check(data_nascimento < current_date),
	telefone varchar(20) not null,
	email varchar(100) unique,
	endereco varchar(200)
);

create table dentista (
	id serial primary key,
	nome_completo varchar(100) not null,
	cpf varchar(11) not null unique,
	cro varchar(20) not null unique,
	especialidade varchar(80) not null,
	email varchar(100) unique
);

create table horario_atendimento (
	id serial primary key,
	id_dentista int not null,
	foreign key (id_dentista) references dentista(id) on delete cascade,
	dia_semana varchar(15) not null,
	hora_inicio time not null,
	hora_fim time not null check(hora_fim > hora_inicio)
);

create table consulta (
	id serial primary key,
	id_paciente int not null,
	foreign key (id_paciente) references paciente(id) on delete restrict,
	id_dentista int not null,
	foreign key (id_dentista) references dentista(id) on delete restrict,
	data_consulta timestamp not null,
	status varchar(20) not null,
	descricao_atendimento text,
	prescricao text
);

create table procedimento (
	id serial primary key,
	nome varchar(100) not null unique,
	descricao text,
	duracao_media_min int not null check(duracao_media_min > 0)
);

create table consulta_procedimento (
	id_consulta int not null,
	foreign key (id_consulta) references consulta(id) on delete cascade,
	id_procedimento int not null,
	foreign key (id_procedimento) references procedimento(id) on delete restrict,
	primary key (id_consulta, id_procedimento)
);

-- Adicionando registros às tabelas(Inserção de dados):
insert into paciente(nome_completo, cpf, data_nascimento, telefone, email, endereco)		
values			
('Lucas Almeida', '52918374620','1995-03-14', '(21)98874-3210', 'lucas.rocha95@email.com', 'Rua das Acácias, 145, Centro, Petrópolis - RJ'),
('Mariana Costa Ribeiro', '71462930588', '1988-07-22','(21)97712-5543', 'mariana.ribeiro88@email.com','Av. Barão do Rio Branco, 890, Centro, Petrópolis - RJ'),
('Rafael Souza Martins','08391547266','2000-11-09','(21)99231-6678','rafael.martins00@email.com','Rua Teresa, 320, Alto da Serra, Petrópolis - RJ'),
('Juliana Gomes','44802793155','1992-01-30','(21)98122-9034',null,'Rua Montecaseros, 210, Centro, Petrópolis - RJ'),
('Bruno Henrique Dias','39166082491','1985-05-17','(21)99678-1122','bruno.dias85@email.com',null),
('Camila Rodrigues','26599431704','1991-09-03','(21)98765-7788','camila.teixeira98@email.com',null),
('Felipe Andrade Ramos','90214456873','1990-12-25','(21)99123-4456',null,null),
('Aline Carvalho Mendonza','11830579962','1996-06-08','(21)98567-3344',null,'Rua Bingen, 670, Bingen, Petrópolis - RJ'),
('Gustavo Nogueira Jr','67329084115','1983-12-19','(21)99321-5566','gustavo.lopes83@email.com','Rua Mosela, 240, Mosela, Petrópolis - RJ'),
('Renata Pires','54781263908','1936-10-11','(21)98234-9988','renata.batista99@email.com',null),
('Eduardo Tabolo Silva','23470911542','1987-04-27','(21)99789-0011',null,'Rua Washington Luiz, 560, Centro, Petrópolis - RJ'),
('Patrícia Fernandes','80532147729','1993-08-05','(21)98990-2233',null,null);

insert into dentista(nome_completo, cpf, cro, especialidade, email)
values 
('Aldir da Silva Cordeiro', '11122233344', 'CRO-RJ 19841', 'Ortodontia', 'aldir.cordeiro@exemplo.com.br'),
('Beatriz Helena Bretz', '22233344455', 'CRO-RJ 20324', 'Ortodontia', 'beatriz.bretz@exemplo.com.br'),
('Marcelo da Rocha Barreira', '33344455566', 'CRO-RJ 34731', 'Implantodontia', 'marcelo.barreira@exemplo.com.br'),
('Eliza Vasques', '44455566677', 'CRO-RJ 55432', 'Dentística', 'eliza.vasques@exemplo.com.br'),
('Ricardo de Souza Tesch', '55566677788', 'CRO-RJ 44321', 'DTM', 'ricardo.tesch@exemplo.com.br'),
('Guilherme B. S. Carneiro', '66677788899', 'CRO-RJ 46195', 'Endodontia', 'guilherme.carneiro@exemplo.com.br'),
('Bolivar Simões', '77788899900', 'CRO-RJ 9749', 'Prótese', 'bolivar.simoes@exemplo.com.br'),
('Bianca Maria Garrido Bento', '88899900011', 'CRO-RJ 29618', 'Ortodontia', 'bianca.bento@exemplo.com.br'),
('Angela B. Figueiredo', '99900011122', 'CRO-RJ 10674', 'Ortodontia', 'angela.figueiredo@exemplo.com.br'),
('Luiz Claudio C. Pacheco', '00011122233', 'CRO-RJ 11340', 'Clínico Geral', 'luiz.pacheco@exemplo.com.br');

insert into horario_atendimento(id_dentista, dia_semana, hora_inicio, hora_fim)
values
(1, 'Segunda-feira', '08:00', '12:00'), -- Aldir
(2, 'Segunda-feira', '13:00', '17:00'), -- Beatriz
(3, 'Terça-feira', '08:30', '12:30'),   -- Marcelo
(4, 'Terça-feira', '14:00', '18:00'),   -- Eliza
(5, 'Quarta-feira', '09:00', '13:00'),  -- Ricardo
(6, 'Quarta-feira', '14:00', '18:00'),  -- Guilherme
(7, 'Quinta-feira', '08:00', '12:00'),  -- Bolivar
(8, 'Quinta-feira', '13:30', '17:30'),  -- Bianca
(9, 'Sexta-feira', '08:00', '12:00'),   -- Angela
(10, 'Sexta-feira', '14:00', '18:00');  -- Luiz Claudio

insert into consulta(id_paciente, id_dentista, data_consulta, status, descricao_atendimento)
values
(1, 2, '2026-03-01 14:00:00', 'Concluída', 'Instalação de Aparelho Metálico'),
(2, 1, '2026-03-02 09:30:00', 'Agendada', 'Manutenção de Aparelho Ortodôntico'),
(3, 3, '2026-03-03 10:00:00', 'Cancelada', 'Instalação de Implante Dentário'),
(4, 6, '2026-03-04 14:00:00', 'Concluída', 'Tratamento de Canal Unirradicular'),
(5, 6, '2026-03-05 16:30:00', 'Agendada', 'Retratamento Endodôntico'),
(6, 5, '2026-03-06 11:00:00', 'Concluída', 'Placa Oclusal para DTM'),
(7, 4, '2026-03-07 15:30:00', 'Agendada', 'Restauração Estética Avançada'),
(8, 3, '2026-03-08 10:30:00', 'Concluída', 'Instalação de Implante Dentário'),
(9, 10, '2026-03-09 14:30:00', 'Cancelada', 'Restauração em Resina'),
(10, 8, '2026-03-10 15:00:00', 'Agendada', 'Manutenção de Aparelho Ortodôntico'),
(11, 9, '2026-03-11 09:00:00', 'Concluída', 'Remoção de Aparelho Ortodôntico'),
(12, 7, '2026-03-12 08:30:00', 'Agendada', 'Confecção de Coroa Protética');

insert into procedimento(nome, descricao, duracao_media_min)
values
-- Ortodontia
('Instalação de Aparelho Metálico', 'Colocação de aparelho fixo metálico para correção dental.', 90),
('Manutenção de Aparelho Ortodôntico', 'Ajustes periódicos e ativação do aparelho.', 30),
('Remoção de Aparelho Ortodôntico', 'Retirada do aparelho e finalização do tratamento.', 60),
-- Implantodontia
('Instalação de Implante Dentário', 'Colocação de implante de titânio para substituição dental.', 120),
-- Prótese
('Confecção de Coroa Protética', 'Produção e adaptação de coroa sobre dente ou implante.', 90),
('Prótese Parcial Removível', 'Confecção de prótese para substituição de múltiplos dentes.', 100),
-- Endodontia
('Tratamento de Canal Unirradicular', 'Tratamento endodôntico em dentes com uma raiz.', 90),
('Tratamento de Canal Multirradicular', 'Tratamento endodôntico em dentes com múltiplas raízes.', 120),
('Retratamento Endodôntico', 'Reintervenção em canal previamente tratado com falha.', 120),
-- Clínico Geral
('Consulta Clínica Geral', 'Avaliação odontológica completa com diagnóstico e plano de tratamento.', 30),
('Limpeza e Profilaxia', 'Remoção de placa bacteriana, tártaro e polimento dental.', 45),
('Restauração em Resina', 'Tratamento de cáries com material restaurador estético.', 40),
-- DTM
('Avaliação de DTM', 'Exame clínico da articulação temporomandibular e análise de sintomas.', 40),
('Placa Oclusal para DTM', 'Confecção e ajuste de placa para controle de bruxismo e dores articulares.', 60),
-- Dentística
('Restauração Estética Avançada', 'Reconstrução dental com foco em estética e função.', 60);

insert into consulta_procedimento(id_consulta, id_procedimento)
values
-- Consulta 1: Beatriz (Instalação de Aparelho)
(1, 1), 
-- Consulta 2: Aldir (Manutenção)
(2, 2), 
-- Consulta 3: Marcelo (Instalação de Implante - mesmo cancelada, o vínculo existe no histórico)
(3, 4), 
-- Consulta 4: Guilherme (Canal Unirradicular + Limpeza de rotina)
(4, 7),
(4, 11), 
-- Consulta 5: Guilherme (Retratamento Endodôntico)
(5, 9), 
-- Consulta 6: Ricardo (Avaliação de DTM + Placa Oclusal)
(6, 13),
(6, 14), 
-- Consulta 7: Eliza (Restauração Estética Avançada)
(7, 15), 
-- Consulta 8: Marcelo (Instalação de Implante)
(8, 4), 
-- Consulta 9: Luiz Claudio (Restauração em Resina)
(9, 12), 
-- Consulta 10: Bianca (Manutenção de Aparelho)
(10, 2), 
-- Consulta 11: Angela (Remoção de Aparelho + Limpeza/Profilaxia)
(11, 3),
(11, 11),
-- Consulta 12: Bolivar (Confecção de Coroa Protética)
(12, 5);

-- Adicionando os índices:
-- Índice sobre CPF do paciente: acelera buscas por CPF na recepção (campo frequentemente usado para localizar pacientes)
create index idx_paciente_cpf on paciente(cpf);

-- Índice sobre data da consulta: acelera filtros de agenda por período (consultas do dia, da semana, do mês etc.)
create index idx_consulta_data on consulta(data_consulta);

-- Índice sobre id_dentista em consulta: acelera a listagem de consultas de um dentista específico
create index idx_consulta_dentista on consulta(id_dentista);

-- Manipulando os dados:
update paciente
set email = 'felipe.andrade@email.com'
where nome_completo like 'Felipe Andrade%';

update consulta
set status = 'Cancelada'
where id = 10;

update horario_atendimento
set dia_semana = 'Sábado'
where dia_semana = 'Sexta-feira';

delete from horario_atendimento
where id_dentista = 10;

delete from procedimento
where id = 6;

delete from consulta
where id_dentista = 3 and status = 'Cancelada';

-- Consultando os dados:
-- 1. Quantidade de consultas por especialidade
select d.especialidade, count(c.id) as total_consultas
from dentista d
left join consulta c
on d.id = c.id_dentista
group by d.especialidade
order by total_consultas desc;

-- 2. Quantidade de consultas por dentista (ordem decrescente)
select d.nome_completo, count(c.id) as total_consultas
from dentista d
left join consulta c
on d.id = c.id_dentista
group by d.nome_completo
order by total_consultas desc;

-- 3. Pacientes com maior número de consultas
select p.nome_completo as paciente, count(c.id) as total_consultas
from paciente p
left join consulta c 
on c.id_paciente = p.id
group by p.nome_completo
order by total_consultas desc;

-- 4. VIEW — Lista de consultas ordenadas por data 
create view vw_consultas as
select 
    c.id as id_consulta, 
    p.nome_completo as nome_paciente, 
    d.nome_completo as nome_dentista, 
    c.data_consulta, 
    c.status, 
    pr.nome as procedimentos_realizados
from consulta c
join paciente p on p.id = c.id_paciente
join dentista d on d.id = c.id_dentista
left join consulta_procedimento cp on cp.id_consulta = c.id
left join procedimento pr on pr.id = cp.id_procedimento
order by c.data_consulta desc;

-- Para consultar a view:
select * from vw_consultas;

-- 5. Média de consultas por dentista
select avg(total) as media_consultas_por_dentista
from (select d.id as id_dentista, count(c.id) as total
      from dentista d
      left join consulta c
      on c.id_dentista = d.id
      group by d.id) as contagem_por_dentista;

-- Extra 1: Procedimentos que nunca foram realizados
select p.nome, count(cp.id_procedimento) as total_realizado
from procedimento p
left join consulta_procedimento cp
on p.id = cp.id_procedimento
group by p.nome
having count(cp.id_procedimento) = 0;

-- Extra 2: Consultas na segunda-feira
select p.nome_completo, c.data_consulta
from paciente p
join consulta c
on p.id = c.id_paciente
where extract(dow from c.data_consulta) = 1
order by c.data_consulta;

-- Extra 3: Pacientes onde a consulta foi cancelada
select p.nome_completo, c.data_consulta, c.status
from paciente p
left join consulta c
on c.id_paciente = p.id
where status = 'Cancelada';