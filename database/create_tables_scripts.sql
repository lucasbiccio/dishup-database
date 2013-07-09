CREATE TABLE tipo_usuario(
       id_tipo_usuario INT NOT NULL,
       nm_tipo_usuario VARCHAR(100) NOT NULL,
       desc_tipo_usuario VARCHAR(200) NOT NULL,
       CONSTRAINT id_tipo_usuario_pk PRIMARY KEY(id_tipo_usuario),
       CONSTRAINT nm_tipo_usuario_check_size CHECK (CHAR_LENGTH(nm_tipo_usuario) > 0),
       CONSTRAINT desc_tipo_usuario_check_size CHECK (CHAR_LENGTH(desc_tipo_usuario) > 0)
);

CREATE TABLE status_usuario(
	id_status_usuario INT NOT NULL,
	nm_status_usuario VARCHAR(100) NOT NULL,
    desc_status_usuario VARCHAR(200) NOT NULL,
    CONSTRAINT id_status_pk PRIMARY KEY(id_status_usuario),
    CONSTRAINT nm_status_check_size CHECK (CHAR_LENGTH(nm_status_usuario) > 0),
    CONSTRAINT desc_status_check_size CHECK (CHAR_LENGTH(desc_status_usuario) > 0)
);

CREATE TABLE tipo_culinaria(
	id_tipo_culinaria INT NOT NULL,
	nm_tipo_culinaria VARCHAR(100) NOT NULL,
	desc_tipo_culinaria VARCHAR(200) NOT NULL,
	CONSTRAINT id_tipo_culinaria_pk PRIMARY KEY(id_tipo_culinaria),
	CONSTRAINT nm_tipo_culinaria_check_size CHECK(CHAR_LENGTH(nm_tipo_culinaria) > 0),
	CONSTRAINT desc_tipo_culinaria_check_size CHECK(CHAR_LENGTH(desc_tipo_culinaria) > 0)
);

CREATE TABLE status_restaurante(
	id_status_restaurante INT NOT NULL,
	nm_status_restaurante VARCHAR(100) NOT NULL,
    desc_status_restaurante VARCHAR(200) NOT NULL,
    CONSTRAINT id_status_restaurante_pk PRIMARY KEY(id_status_restaurante),
    CONSTRAINT nm_status_restaurante_check_size CHECK (CHAR_LENGTH(nm_status_restaurante) > 0),
    CONSTRAINT desc_status_restaurante_check_size CHECK (CHAR_LENGTH(desc_status_restaurante) > 0)
);

CREATE TABLE cargo(
	id_cargo INT NOT NULL,
	nm_cargo VARCHAR(100) NOT NULL,
	desc_cargo VARCHAR(200) NOT NULL,
	CONSTRAINT id_cargo_pk PRIMARY KEY(id_cargo),
	CONSTRAINT nm_cargo_size CHECK (CHAR_LENGTH(nm_cargo) > 0),
	CONSTRAINT desc_cargo_size CHECK (CHAR_LENGTH(desc_cargo) > 0)
);

CREATE TABLE status_proposta(
	id_status_proposta INT NOT NULL,
	nm_status_proposta VARCHAR(100) NOT NULL,
    desc_status_proposta VARCHAR(200) NOT NULL,
    CONSTRAINT id_status_proposta_pk PRIMARY KEY(id_status_proposta),
    CONSTRAINT nm_status_proposta_check_size CHECK (CHAR_LENGTH(nm_status_proposta) > 0),
    CONSTRAINT desc_status_proposta_check_size CHECK (CHAR_LENGTH(desc_status_proposta) > 0)
);

CREATE TABLE tipo_dia_semana(
	id_tipo_dia_semana INT NOT NULL,
	nm_tipo_dia_semana VARCHAR(60) NOT NULL,
	CONSTRAINT id_tipo_dia_semana_pk PRIMARY KEY(id_tipo_dia_semana),
	CONSTRAINT nm_tipo_dia_semana_size CHECK (CHAR_LENGTH(nm_tipo_dia_semana) > 0)
);

CREATE TABLE pais(
	id_pais INT NOT NULL,
	sigla_pais CHAR(3) NOT NULL,
	nm_pais VARCHAR(50) NOT NULL,
	CONSTRAINT pais_pk PRIMARY KEY(id_pais),
	CONSTRAINT sigla_pais_unique UNIQUE(sigla_pais),
	CONSTRAINT sigla_pais_check_size CHECK (CHAR_LENGTH(sigla_pais) = 3),
	CONSTRAINT nm_pais_check_size CHECK (CHAR_LENGTH(nm_pais) > 0)
);

CREATE TABLE estado(
	id_estado INT NOT NULL,
	sigla_estado CHAR(2) NOT NULL,
	nm_estado VARCHAR(50) NOT NULL,
	id_pais INT NOT NULL,
	CONSTRAINT estado_pk PRIMARY KEY(id_estado),
	CONSTRAINT sigla_estado_unique UNIQUE(sigla_estado),
	CONSTRAINT pais_fk FOREIGN KEY(id_pais) REFERENCES pais(id_pais),
	CONSTRAINT sigla_estado_check_size CHECK (CHAR_LENGTH(sigla_estado) = 2),
	CONSTRAINT nm_estado_check_size CHECK (CHAR_LENGTH(nm_estado) > 0)
);

CREATE TABLE cidade(
	id_cidade INT NOT NULL,
	nm_cidade VARCHAR(50) NOT NULL,
	id_pais INT NOT NULL,
	id_estado INT NOT NULL,
	CONSTRAINT cidade_pk PRIMARY KEY(id_cidade),
	CONSTRAINT pais_fk FOREIGN KEY(id_pais) REFERENCES pais(id_pais),
	CONSTRAINT estado_fk FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
	CONSTRAINT nm_cidade_check_size CHECK (CHAR_LENGTH(nm_cidade) > 0)
);

CREATE TABLE usuario_consumidor(
       id_usuario_consumidor SERIAL NOT NULL,
       email_usuario_consumidor VARCHAR(100) NOT NULL,
       assinatura_usuario_consumidor VARCHAR(200) NOT NULL,
       id_status_usuario_consumidor INT NOT NULL,
       dt_inclusao_usuario_consumidor TIMESTAMP,
       CONSTRAINT usuario_consumidor_pk PRIMARY KEY(id_usuario_consumidor),
       CONSTRAINT email_consumidor_check_format CHECK (email_usuario_consumidor ~ '^(.+)@(.+)[.]([a-z]+)$'),
       CONSTRAINT assinatura_consumidor_check_size CHECK (CHAR_LENGTH(assinatura_usuario_consumidor) > 0),       
       CONSTRAINT email_consumidor_unique UNIQUE (email_usuario_consumidor),
       CONSTRAINT email_consumidor_check_size CHECK (CHAR_LENGTH(email_usuario_consumidor) <= 100),
       CONSTRAINT id_status_consumidor_fk FOREIGN KEY(id_status_usuario_consumidor) REFERENCES status_usuario(id_status_usuario)
);

CREATE TABLE usuario_restaurante(
       id_usuario_restaurante SERIAL NOT NULL,
       email_usuario_restaurante VARCHAR(100) NOT NULL,
       assinatura_usuario_restaurante VARCHAR(200) NOT NULL,       
       id_status_usuario_restaurante INT NOT NULL,
       dt_inclusao_usuario_restaurante TIMESTAMP,
       CONSTRAINT usuario_restaurante_pk PRIMARY KEY(id_usuario_restaurante),
       CONSTRAINT email_restaurante_check_format CHECK (email_usuario_restaurante ~ '^(.+)@(.+)[.]([a-z]+)$'),
       CONSTRAINT assinatura_restaurante_check_size CHECK (CHAR_LENGTH(assinatura_usuario_restaurante) > 0),       
       CONSTRAINT email_restaurante_unique UNIQUE (email_usuario_restaurante),
       CONSTRAINT email_restaurante_check_size CHECK (CHAR_LENGTH(email_usuario_restaurante) <= 100),
       CONSTRAINT id_status_restaurante_fk FOREIGN KEY(id_status_usuario_restaurante) REFERENCES status_usuario(id_status_usuario)
);

CREATE TABLE usuario_administrador(
       id_usuario_administrador SERIAL NOT NULL,
       email_usuario_administrador VARCHAR(100) NOT NULL,
       assinatura_usuario_administrador VARCHAR(200) NOT NULL,      
       id_status_usuario_administrador INT NOT NULL,
       dt_inclusao_usuario_administrador TIMESTAMP,
       CONSTRAINT usuario_administrador_pk PRIMARY KEY(id_usuario_administrador),
       CONSTRAINT email_administrador_check_format CHECK (email_usuario_administrador ~ '^(.+)@(.+)[.]([a-z]+)$'),
       CONSTRAINT assinatura_administrador_check_size CHECK (CHAR_LENGTH(assinatura_usuario_administrador) > 0),      
       CONSTRAINT email_administrador_unique UNIQUE (email_usuario_administrador),
       CONSTRAINT email_administrador_check_size CHECK (CHAR_LENGTH(email_usuario_administrador) <= 100),
       CONSTRAINT id_status_administrador_fk FOREIGN KEY(id_status_usuario_administrador) REFERENCES status_usuario(id_status_usuario)
);

CREATE TABLE restaurante(
	id_restaurante SERIAL NOT NULL,
	CNPJ_numero CHAR(8) NOT NULL,
	CNPJ_filial CHAR(4) NOT NULL,
	CNPJ_controle CHAR(2) NOT NULL,
	razao_social VARCHAR(100) NOT NULL,
	site VARCHAR(100),
	DDD_telefone CHAR(3) NOT NULL,
	telefone CHAR(9) NOT NULL,
	dt_inclusao TIMESTAMP,
	id_status_restaurante INT NOT NULL,
	CONSTRAINT restaurante_pk PRIMARY KEY(id_restaurante),
	CONSTRAINT cnpj_unique UNIQUE (CNPJ_numero, CNPJ_filial, CNPJ_controle),
	CONSTRAINT razao_social_size CHECK(CHAR_LENGTH(razao_social) > 0),
	CONSTRAINT ddd_telefone_size CHECK(CHAR_LENGTH(DDD_telefone) = 3),
	CONSTRAINT telefone_size CHECK(CHAR_LENGTH(telefone) >= 8),
	CONSTRAINT status_restaurante_fk FOREIGN KEY(id_status_restaurante) REFERENCES status_restaurante(id_status_restaurante) 
);

CREATE TABLE endereco_restaurante(
       id_restaurante INT NOT NULL REFERENCES restaurante(id_restaurante),
       CEP_prefixo CHAR(5) NOT NULL,
       CEP_sulfixo CHAR(3) NOT NULL,
       logradouro VARCHAR(100) NOT NULL,
       numero VARCHAR(20) ,
       bairro VARCHAR(80) NOT NULL,
       id_pais INT NOT NULL,
       id_estado INT NOT NULL,
       id_cidade INT NOT NULL,
       CONSTRAINT restaurante_endereco_pk PRIMARY KEY(id_restaurante),
       CONSTRAINT id_pais_fk FOREIGN KEY(id_pais) REFERENCES pais(id_pais),
       CONSTRAINT id_estado_fk FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
       CONSTRAINT id_cidade_fk FOREIGN KEY(id_cidade) REFERENCES cidade(id_cidade),
       CONSTRAINT cep_prefixo_check_size CHECK(CHAR_LENGTH(CEP_prefixo) = 5),
       CONSTRAINT cep_sulfixo_check_size CHECK(CHAR_LENGTH(CEP_sulfixo) = 3),
       CONSTRAINT logradouro_check_size CHECK(CHAR_LENGTH(logradouro) > 0),
       CONSTRAINT bairro_check_size CHECK(CHAR_LENGTH(bairro) > 0)
);

CREATE TABLE responsavel_restaurante(
	id_restaurante INT NOT NULL REFERENCES restaurante(id_restaurante),
	cpf_numero_responsavel CHAR(9) NOT NULL,
	cpf_controle_responsavel CHAR(2) NOT NULL,
	nm_responsavel VARCHAR(100) NOT NULL,
	id_cargo_responsavel INT NOT NULL,
	ddd_tel_responsavel CHAR(03) NOT NULL,
	tel_responsavel CHAR(9) NOT NULL,
	CONSTRAINT restaurante_responsavel_pk PRIMARY KEY(id_restaurante),
	CONSTRAINT cpf_numero_size CHECK(CHAR_LENGTH(cpf_numero_responsavel) = 9),
	CONSTRAINT cpf_controle_size CHECK(CHAR_LENGTH(cpf_controle_responsavel) = 2),
	CONSTRAINT nm_responsavel_size CHECK(CHAR_LENGTH(nm_responsavel) > 0),
	CONSTRAINT id_cargo_fk FOREIGN KEY(id_cargo_responsavel) REFERENCES cargo(id_cargo),
	CONSTRAINT ddd_tel_responsavel_size CHECK (CHAR_LENGTH(ddd_tel_responsavel) = 3),
	CONSTRAINT tel_responsavel_size CHECK (CHAR_LENGTH(tel_responsavel) >= 8 and CHAR_LENGTH(tel_responsavel) <= 9)
);

CREATE TABLE dado_basico_restaurante(
	id_restaurante INT NOT NULL REFERENCES restaurante(id_restaurante),
	url_logo VARCHAR(200),
	desc_resumida VARCHAR(150),
	desc_completa VARCHAR(600),
	id_tipo_culinaria INT NOT NULL,
	CONSTRAINT id_dado_basico_pk PRIMARY KEY(id_restaurante),
	CONSTRAINT url_size CHECK(CHAR_LENGTH(url_logo) > 0),
	CONSTRAINT desc_resumida_size CHECK(CHAR_LENGTH(desc_resumida) > 0),
	CONSTRAINT desc_completa_size CHECK(CHAR_LENGTH(desc_completa) > 0),
	CONSTRAINT id_tipo_culinaria_fk FOREIGN KEY (id_tipo_culinaria) REFERENCES tipo_culinaria(id_tipo_culinaria)
);

CREATE TABLE imagem_restaurante(
	id_restaurante INT NOT NULL REFERENCES restaurante(id_restaurante),
	id_imagem INT NOT NULL,
	url_imagem VARCHAR(200),
	CONSTRAINT imagem_restaurante_pk PRIMARY KEY(id_restaurante,id_imagem),
	CONSTRAINT url_imagem_size CHECK (CHAR_LENGTH(url_imagem) > 0)
);

CREATE TABLE horario_restaurante(
	id_restaurante INT NOT NULL REFERENCES restaurante(id_restaurante),
	id_horario INT NOT NULL,
	id_tipo_dia_semana_ini INT NOT NULL,
	id_tipo_dia_semana_fim INT NOT NULL,
	hr_ini VARCHAR(10) NOT NULL,
	hr_fim VARCHAR(10) NOT NULL,
	CONSTRAINT id_horario_restaurante_pk PRIMARY KEY(id_restaurante, id_horario),
	CONSTRAINT id_tipo_dia_semana_ini_fk FOREIGN KEY(id_tipo_dia_semana_ini) REFERENCES tipo_dia_semana(id_tipo_dia_semana),
	CONSTRAINT id_tipo_dia_semana_fim_fk FOREIGN KEY(id_tipo_dia_semana_fim) REFERENCES tipo_dia_semana(id_tipo_dia_semana),
	CONSTRAINT hr_ini_size CHECK(CHAR_LENGTH(hr_ini) > 0),
	CONSTRAINT hr_fim_size CHECK(CHAR_LENGTH(hr_fim) > 0)
);

CREATE TABLE grupo_usuario_restaurante(
	id_restaurante INT NOT NULL REFERENCES restaurante(id_restaurante),
	id_usuario_restaurante INT NOT NULL,
	id_tipo_usuario INT NOT NULL,
	CONSTRAINT grupo_restaurante_pk PRIMARY KEY(id_restaurante, id_usuario_restaurante),
	CONSTRAINT id_tipo_usuario_grupo_fk FOREIGN KEY(id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
);
		
CREATE TABLE proposta_restaurante(
	id_proposta SERIAL NOT NULL,
	dt_inclusao TIMESTAMP NOT NULL,
	id_status_proposta INT NOT NULL,
	id_usuario_aprovacao INT,
	dt_avaliacao TIMESTAMP,
	email_restaurante VARCHAR(100) NOT NULL,
	cnpj_numero CHAR(9) NOT NULL,
	cnpj_filial CHAR(4) NOT NULL,
	cnpj_controle CHAR(2) NOT NULL,
	razao_social_restaurante VARCHAR(100) NOT NULL,
	cep_restaurante CHAR(8) NOT NULL,
	logradouro_restaurante VARCHAR(100) NOT NULL,
	num_restaurante VARCHAR(20),
	compl_restaurante VARCHAR(100),
	bairro_restaurante VARCHAR (100) NOT NULL,
	id_cidade_restaurante INT NOT NULL,
	id_estado_restaurante INT NOT NULL,
	id_pais_restaurante INT NOT NULL,
	ddd_tel_comecial_restaurante CHAR(3) NOT NULL, 
	tel_comecial_restaurante CHAR(11) NOT NULL,
	site_restaurante VARCHAR(100),
	id_tipo_culinaria INT NOT NULL,
	cpf_numero_contato CHAR(9) NOT NULL,
	cpf_controle_contato CHAR(2) NOT NULL,
	nm_contato VARCHAR(100) NOT NULL,
	id_cargo_contato INT NOT NULL,
	ddd_tel_contato CHAR(03) NOT NULL,
	tel_contato CHAR(9) NOT NULL,
	CONSTRAINT id_proposta_pk PRIMARY KEY(id_proposta),
	CONSTRAINT cnpj_numero_size CHECK(CHAR_LENGTH(cnpj_numero) = 8 ),
	CONSTRAINT cnpj_filial_size CHECK(CHAR_LENGTH(cnpj_filial) = 4),
	CONSTRAINT cnpj_controle_size CHECK(CHAR_LENGTH(cnpj_controle) = 2),
	CONSTRAINT razao_social_restaurante_size CHECK (CHAR_LENGTH(razao_social_restaurante) > 0),
	CONSTRAINT cep_restaurante_size CHECK (CHAR_LENGTH(cep_restaurante) = 8),
	CONSTRAINT logradouro_restaurante_size CHECK (CHAR_LENGTH(logradouro_restaurante) > 0),
	CONSTRAINT bairro_restaurante_size CHECK (CHAR_LENGTH(bairro_restaurante) > 0),
	CONSTRAINT ddd_tel_comecial_restaurante CHECK (CHAR_LENGTH(ddd_tel_comecial_restaurante) = 3),
	CONSTRAINT tel_comecial_restaurante CHECK (CHAR_LENGTH(tel_comecial_restaurante) >= 8 ),
	CONSTRAINT cpf_numero_contato_size CHECK(CHAR_LENGTH(cpf_numero_contato) = 9),
	CONSTRAINT cpf_controle_contato_size CHECK(CHAR_LENGTH(cpf_controle_contato) = 2),
	CONSTRAINT nm_contato_size CHECK (CHAR_LENGTH(nm_contato) > 0),
	CONSTRAINT ddd_tel_contato_size CHECK (CHAR_LENGTH(ddd_tel_contato) = 3),
	CONSTRAINT tel_contato_size CHECK (CHAR_LENGTH(tel_contato) >= 8 and CHAR_LENGTH(tel_contato) <= 9),
	CONSTRAINT id_cidade_restaurante_fk FOREIGN KEY(id_cidade_restaurante) REFERENCES cidade(id_cidade),
	CONSTRAINT id_estado_restaurante_fk FOREIGN KEY(id_estado_restaurante) REFERENCES estado(id_estado),
	CONSTRAINT id_pais_restaurante_fk FOREIGN KEY(id_pais_restaurante) REFERENCES pais(id_pais),
	CONSTRAINT id_tipo_culinaria_fk FOREIGN KEY(id_tipo_culinaria) REFERENCES tipo_culinaria(id_tipo_culinaria),
	CONSTRAINT id_cargo_fk FOREIGN KEY(id_cargo_contato) REFERENCES cargo(id_cargo),
	CONSTRAINT id_status_proposta_fk FOREIGN KEY(id_status_proposta) REFERENCES status_proposta(id_status_proposta),
	CONSTRAINT id_usuario_aprovacao_fk FOREIGN KEY (id_usuario_aprovacao) REFERENCES usuario_administrador(id_usuario_administrador),
	CONSTRAINT email_restaurante_check_format CHECK (email_restaurante ~ '^(.+)@(.+)[.]([a-z]+)$')
);