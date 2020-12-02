CREATE TABLE hospitals
	(id   		  serial PRIMARY KEY,
	 abbreviation varchar(10) NOT NULL,
	 name		  varchar(35) unique NOT NULL);

CREATE TABLE ufs
	(id			serial PRIMARY KEY,
	 name		varchar(2) unique NOT NULL);
	 
CREATE TABLE cities
	(id			   serial PRIMARY KEY,
	 name		   varchar(45) NOT NULL,
	 uf_id         integer NOT NULL,
     FOREIGN KEY (uf_id) references ufs(id));
	 
CREATE TABLE districts
	(id			   serial PRIMARY KEY,
	 name		   varchar(45) NOT NULL,
	 city_id     integer NOT NULL,
     FOREIGN KEY (city_id) references cities(id));
	
CREATE TABLE addresses
	(id			 	 serial PRIMARY KEY,
	 cep         	 varchar(20) NOT NULL,
	 street      	 varchar(45) NOT NULL,
	 number		 	 integer NOT NULL,
	 complement  	 varchar(45),
	 district_id     integer NOT NULL,
     FOREIGN KEY (district_id) references districts(id));
	 
CREATE TABLE units
	(id 		  serial PRIMARY KEY,
	 name		  varchar(45) NOT NULL,
	 hospital_id  integer NOT NULL,
	 address_id   integer NOT NULL,
     FOREIGN KEY (hospital_id) references hospitals(id),
	 FOREIGN KEY (address_id) references addresses(id));
	 
CREATE TABLE attendants
	(cpf		         varchar(45) PRIMARY KEY,
	 name		         varchar(45) NOT NULL,
	 birth_date          date NOT NULL,
	 hiring_date         date NOT NULL,
	 unit_id             integer NOT NULL,
	 FOREIGN KEY (unit_id) references hospitals(id));

CREATE TABLE telephones
	(id			     serial PRIMARY KEY,
	 cell_phone		 varchar(45) NOT NULL,
	 home_phone 	 varchar(45) NOT NULL);

CREATE TABLE users
	(cpf		     varchar(45) PRIMARY KEY,
	 name		     varchar(45) NOT NULL, 
     email		     varchar(45) NOT NULL,
	 birth_date      date NOT NULL,
	 telephone_id    integer NOT NULL,
	 FOREIGN KEY (telephone_id) references telephones(id));
	
CREATE TABLE health_conditions
	(id			serial PRIMARY KEY,
	 name   	varchar(45) NOT NULL,
	 priority   integer NOT NULL);
	 
CREATE TABLE specializations
	(id			serial PRIMARY KEY,
	 name		varchar(45) NOT NULL);
	 
CREATE TABLE doctors
	(crm		varchar(45) PRIMARY KEY,
	 name		varchar(45) NOT NULL,
	 room		varchar(45) NOT NULL,
	 unit_id    integer NOT NULL,
	 FOREIGN KEY (unit_id) references units(id));
	 
CREATE TABLE doctor_has_specialization
 	(doctor_crm         varchar(45) NOT NULL,
 	 specialization_id  integer NOT NULL,
	 PRIMARY KEY(doctor_crm, specialization_id),
     FOREIGN KEY (doctor_crm) references doctors(crm),
     FOREIGN KEY (specialization_id) references specializations(id));
 
CREATE TABLE entries
	(id		 	     serial PRIMARY KEY,
	 was_attended    boolean NOT NULL DEFAULT false,
	 arrival_time    timestamp default current_timestamp NOT NULL,
	 user_cpf        varchar(45) NOT NULL,
     doctor_crm      varchar(45) NOT NULL,
	 health_condition_id integer NOT NULL,
	 FOREIGN KEY (user_cpf) references users(cpf),
	 FOREIGN KEY (doctor_crm) references doctors(crm),
	 FOREIGN KEY (health_condition_id) references health_conditions(id));

CREATE TABLE symptoms
	(id			serial PRIMARY KEY,
	 name		varchar(45) NOT NULL);

CREATE TABLE entry_has_symptom
	(entry_id			 integer NOT NULL,
     symptom_id			 integer NOT NULL,
	 PRIMARY KEY(entry_id, symptom_id),
     FOREIGN KEY (entry_id) references entries(id),
     FOREIGN KEY (symptom_id) references symptoms(id));

CREATE TABLE notifications
	(id			serial PRIMARY KEY,
	 message    varchar(100) NOT NULL,
	 sent_at    timestamp default current_timestamp NOT NULL,
	 user_cpf   varchar(45) NOT NULL,
	 entry_id   integer,
	 FOREIGN KEY (user_cpf) references users(cpf),
	 FOREIGN KEY (entry_id) references entries(id));

insert into hospitals(abbreviation, name) values('HR', 'Hospital Regional');
insert into hospitals(abbreviation, name) values('HSH', 'Hospital Santa Helena');

insert into ufs(name) values ('DF');
insert into ufs(name) values ('SP');
insert into ufs(name) values ('MG');

insert into cities(name, uf_id) values ('Brasilia', 1);
insert into cities(name, uf_id) values ('Campinas', 2);
insert into cities(name, uf_id) values ('Patos de Minas', 3);

insert into districts(name, city_id) values ('Asa Sul', 1);
insert into districts(name, city_id) values ('Bonfim', 2);
insert into districts(name, city_id) values ('Cidade Nova', 3);
	
insert into addresses(cep, street, number, complement, district_id) values('70037900', 'SAUS', '21', 'Quadra 6 Bloco A', 1);
insert into addresses(cep, street, number, complement, district_id) values('13070728', 'Rua Antônio José Ribeiro Júnior', '103', 'Condominio Antonietta Bloco C Apartamento', 2);
insert into addresses(cep, street, number, complement, district_id) values('38706400', 'Avenida Presidente Tancredo Neves', '5', 'Casa', 3);

insert into units(name, hospital_id, address_id) values('Asa Norte', 1, 2);
insert into units(name, hospital_id, address_id) values('Asa Sul', 2, 1);

insert into attendants(cpf, name, birth_date, hiring_date, unit_id) values('14097435949', 'Helenovisky Santa', '1960-06-01', '1980-04-21', 1);
insert into attendants(cpf, name, birth_date, hiring_date, unit_id) values('15308150613', 'Josefino das Claras', '1978-10-21', '2000-10-01', 2);

insert into telephones(home_phone, cell_phone) values('33218181', '229828222');
insert into telephones(home_phone, cell_phone) values('32552393', '982232322');
insert into telephones(home_phone, cell_phone) values('31522394', '934263322');

insert into users(cpf, name, email, birth_date, telephone_id) values('23761211678', 'Ricardo José Filho', 'ricardito@gmail.com', '1940-04-21', 1);
insert into users(cpf, name, email, birth_date, telephone_id) values('71568006128', 'Marinette Luiza', 'marinettel@gmail.com', '1965-12-01', 2);
insert into users(cpf, name, email, birth_date, telephone_id) values('93780251027', 'Melina Serios', 'melmel@gmail.com', '1949-12-01', 3);
insert into users(cpf, name, email, birth_date, telephone_id) values('90405574894', 'Gabie Junior Lays', 'gabiejl@gmail.com', '2000-09-25', 3);

insert into health_conditions(name, priority) values('Leve', 3);
insert into health_conditions(name, priority) values('Grave', 1);

insert into specializations(name) values('Psiquiatria');
insert into specializations(name) values('Pediatria');

insert into doctors(crm, name, room, unit_id) values('1603-AC', 'Thiago Chaves Couto', 4, 1);
insert into doctors(crm, name, room, unit_id) values('1232-DF', 'Gabrielly de Souza', 6, 2);

insert into entries(user_cpf, doctor_crm, health_condition_id) values('71568006128', '1232-DF', 2);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('23761211678', '1603-AC', 2);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('23761211678', '1232-DF', 1);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('23761211678', '1232-DF', 1);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('93780251027', '1232-DF', 1);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('71568006128', '1232-DF', 1);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('23761211678', '1232-DF', 2);
insert into entries(user_cpf, doctor_crm, health_condition_id) values('90405574894', '1603-AC', 2);

update entries set arrival_time = '2020-01-10 04:03:13.00000', was_attended = true where id = 1;
update entries set arrival_time = '2020-01-11 12:04:23.00000', was_attended = true where id = 2;
update entries set arrival_time = '2020-03-10 13:05:20.00000', was_attended = true where id = 3;
update entries set arrival_time = '2020-03-12 18:20:02.00000', was_attended = true where id = 4;
update entries set arrival_time = '2020-05-26 04:03:13.00000' where id = 5;
update entries set arrival_time = '2020-05-26 04:29:03.00000' where id = 6;
update entries set arrival_time = '2020-05-26 04:30:42.00000' where id = 7;
update entries set arrival_time = '2020-05-26 06:04:20.00000' where id = 8;

insert into symptoms(name) values('Febre');
insert into symptoms(name) values('Tosse');

insert into notifications(user_cpf, message, entry_id) values ('23761211678',
															   'Existem 2 pessoas na sua frente na fila de espera. Aguarde a sua vez nos arredores do Hospital.',
															    7);
																
-- Select
-- 1) Conta quantos usuários estão esperando atendimento para um médico específico
SELECT DISTINCT doctors.name as medico, count(entries.id) as pacientes_na_fila
FROM entries, users, doctors
WHERE entries.user_CPF = users.CPF and entries.doctor_CRM = doctors.CRM 
      and entries.was_attended = false
GROUP BY doctors.name

-- 2)  Busca a fila de usuários por ordem de chegada para um médico específico
SELECT distinct doctors.name as medico, users.cpf cpf_paciente, 
                users.name as nome_paciente, entries.arrival_time as horario_chegada, 
				health_conditions.name as estado_saude
FROM entries, users, doctors, health_conditions
WHERE entries.user_cpf = users.cpf and entries.doctor_crm = doctors.crm 
      and entries.health_condition_id = health_conditions.id
	  and doctors.crm = '1232-DF' and entries.was_attended = false
ORDER BY entries.arrival_time ASC

-- 3) Busca todos os usuários que ainda não foram atendidos em uma determinada Unidade de um Hospital
SELECT DISTINCT hospitals.name as hospital, 
                units.name as unidade, users.name as nome 
FROM entries, doctors, units, hospitals, users
WHERE entries.was_attended = false and entries.doctor_crm = doctors.crm
      and units.id = doctors.unit_id and units.hospital_id = hospitals.id 
	  and entries.user_cpf = users.cpf 
ORDER BY hospitals.name ASC

-- 4) Conta quantos casos graves e que ainda não foram atendidos em uma determinada Unidade de um Hospital
SELECT DISTINCT hospitals.name as hospital, units.name as unidade, count(*) as casos_graves
FROM entries, units, health_conditions, doctors, hospitals, users
WHERE doctors.crm = entries.doctor_crm and doctors.unit_id = units.id 
	  and units.hospital_id = hospitals.id
      and entries.user_cpf = users.cpf and health_conditions.name = 'Grave'
	  and entries.health_condition_id = health_conditions.id
	  and entries.was_attended = false
GROUP BY hospitals.name, units.name

-- 5) Pesquisa quantas entradas, de acordo com o estado de saúde, cada usuário teve
SELECT DISTINCT users.name as nome, count(entries) as entradas, health_conditions.name as estado_saude
FROM entries, users, health_conditions
WHERE entries.user_cpf = users.cpf and entries.health_condition_id = health_conditions.id
GROUP BY users.name, health_conditions.name
ORDER BY users.name ASC

-- 6) Pesquisa quantas pessoas estão na sua frente na fila de espera
SELECT distinct count(*) as pessoas_na_sua_frente
FROM entries, users, doctors
WHERE entries.id > ANY (select distinct entries.id
					    from entries, users 
					    where users.cpf = '23761211678' 
						      and entries.user_cpf = users.cpf)
      and users.cpf != '23761211678' and entries.user_cpf = users.cpf
      and doctors.crm = '1232-DF' and entries.doctor_crm = doctors.crm 
	  and entries.was_attended = false

-- View que busca todos os usuários que estão esperando atendimento para o médico a partir de determinada data
CREATE VIEW users_view AS
	SELECT DISTINCT  users.name as paciente, entries.arrival_time as horario_chegada,
	CASE WHEN entries.was_attended = false
		THEN concat('Está esperando atendimento ')
		ELSE concat('Já foi atendido ') 
	END
	AS estado,
	concat(doctors.name) as médico 
	FROM entries, users, doctors
	WHERE entries.user_cpf = users.cpf and entries.arrival_time <= '2020-05-26 04:03:13.00000'
		  and entries.doctor_crm = doctors.crm 
	ORDER BY entries.arrival_time DESC

SELECT * FROM users_view;
	  
-- Procedure para buscar todos os usuários que possuem a inicial do nome igual a 'M'
CREATE OR REPLACE PROCEDURE user_information(inicial varchar(2)) 
LANGUAGE plpgsql 
AS $$
DECLARE
info_users users;
BEGIN
	RAISE NOTICE 'Dados atualizados de %', current_timestamp;
	FOR info_users IN (SELECT users.cpf, users.name, users.email from users order by users.name ASC)
	LOOP
 		IF info_users.name LIKE inicial THEN
			RAISE NOTICE 'Nome: %, CPF: %, Email: %', info_users.name, info_users.cpf, info_users.email;
		END IF;
	END LOOP;
END;
$$ ;

CALL user_information('M%')
