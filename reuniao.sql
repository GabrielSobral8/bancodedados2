CREATE TABLE reuniao (
                cod_reuniao INTEGER NOT NULL,
                data_reuniao DATE NOT NULL,
                pauta_reuniao VARBINARY NOT NULL,
                CONSTRAINT cod_reuniao PRIMARY KEY (cod_reuniao)
);


CREATE TABLE proposta (
                cod_proposta INTEGER NOT NULL,
                cod_reuniao INTEGER NOT NULL,
                descricao VARCHAR,
                data_votacao DATE NOT NULL,
                CONSTRAINT cod_proposta PRIMARY KEY (cod_proposta, cod_reuniao)
);


CREATE TABLE comissao (
                cod_comissao INTEGER NOT NULL,
                cod_reuniao INTEGER NOT NULL,
                nome_comissao VARCHAR NOT NULL,
                atribuicoes_comissao VARCHAR,
                CONSTRAINT cod_comissao PRIMARY KEY (cod_comissao, cod_reuniao)
);


CREATE TABLE pessoa (
                cpf_pessoa INTEGER NOT NULL,
                cod_comissao INTEGER NOT NULL,
                cod_reuniao INTEGER NOT NULL,
                nome_pessoa VARCHAR NOT NULL,
                telefone_pessoa INTEGER,
                e-mail_pessoa VARCHAR NOT NULL,
                horario_chegada TIME NOT NULL,
                horario_saida TIME NOT NULL,
                CONSTRAINT cpf_pessoa PRIMARY KEY (cpf_pessoa, cod_comissao, cod_reuniao)
);


ALTER TABLE comissao ADD CONSTRAINT reuniao_comissao_fk
FOREIGN KEY (cod_reuniao)
REFERENCES reuniao (cod_reuniao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE proposta ADD CONSTRAINT reuniao_proposta_fk
FOREIGN KEY (cod_reuniao)
REFERENCES reuniao (cod_reuniao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pessoa ADD CONSTRAINT comissao_pessoa_fk
FOREIGN KEY (cod_comissao, cod_reuniao)
REFERENCES comissao (cod_comissao, cod_reuniao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
