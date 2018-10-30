
CREATE TABLE eleitor (
                cd_eleitor INTEGER NOT NULL,
                titulo_eleitor VARCHAR NOT NULL,
                ds_eleitor VARCHAR(60) NOT NULL,
                cpf_eleitor VARCHAR(11) NOT NULL,
                CONSTRAINT eleitor_pk PRIMARY KEY (cd_eleitor)
);

CREATE TABLE partido (
                cd_partido INTEGER NOT NULL,
                ds_partido VARCHAR(100) NOT NULL,
                sigla_partido CHAR(10) NOT NULL,
                CONSTRAINT partido_pk PRIMARY KEY (cd_partido)
);


CREATE TABLE candidato (
                cd_candidato INTEGER NOT NULL,
                nm_candidato CHAR(5) NOT NULL,
                ds_candidato VARCHAR(60) NOT NULL,
                cd_partido INTEGER NOT NULL,
                CONSTRAINT candidato_pk PRIMARY KEY (cd_candidato)
);


CREATE TABLE urna (
                cd_candidato INTEGER NOT NULL,
                cd_eleitor INTEGER NOT NULL,
                dt_urna TIMESTAMP,
                CONSTRAINT urna_pk PRIMARY KEY (cd_candidato, cd_eleitor)
);



ALTER TABLE urna ADD CONSTRAINT eleitor_urna_fk
FOREIGN KEY (cd_eleitor)
REFERENCES eleitor (cd_eleitor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE candidato ADD CONSTRAINT partido_candidato_fk
FOREIGN KEY (cd_partido)
REFERENCES partido (cd_partido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE urna ADD CONSTRAINT candidato_urna_fk
FOREIGN KEY (cd_candidato)
REFERENCES candidato (cd_candidato)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


insert into eleitor(cd_eleitor, titulo_eleitor, ds_eleitor, cpf_eleitor) 
          values(1, '123456789', 'Luana Cristina de Mora', '10393763986'),
		        (2, '456123456', 'Vitória dos Santos Novaes', '10254362152'),
                (3, '104596321', 'Rafael Henrique Vicente', '10256324563'); 


insert into partido(cd_partido, ds_partido, sigla_partido)
           values (1, 'Partido dos Trabalhadores', 'PT'),
		          (2, 'Partido Social Cristão', 'PSC'),
                  (3, 'Partido Democrático Trabalhista', 'PDT'); 

insert into candidato(cd_candidato, nm_candidato, ds_candidato, cd_partido)
           values(1, '13', 'Fernando Haddad', 1),
                 (2, '17', 'Jair Messias Bolsonaro', 2),
                 (3, '12', 'Ciro Gomes', 3); 						  
				