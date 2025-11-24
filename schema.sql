-- Criação da tabela PESSOA
CREATE TABLE PESSOA (
    cpf VARCHAR(14) PRIMARY KEY, -- Chave Primária (PK)
    nome VARCHAR(100)
);

-- Criação da tabela TIPO_PET
CREATE TABLE TIPO_PET (
    codigo INT PRIMARY KEY, -- Chave Primária (PK)
    descricao VARCHAR(50)
);

-- Criação da tabela PET, incluindo as Chaves Estrangeiras (FKs)
CREATE TABLE PET (
    codigo INT PRIMARY KEY, -- Chave Primária (PK)
    nome VARCHAR(100),
    data_nascimento DATE,
    
    -- Chave Estrangeira para TIPO_PET (Relacionamento 1:N 'pertencer')
    codigo_tipo_pet INT NOT NULL,
    FOREIGN KEY (codigo_tipo_pet) REFERENCES TIPO_PET(codigo),
    
    -- Chave Estrangeira para PESSOA (Relacionamento 1:N 'adotar')
    adotante VARCHAR(14),
    FOREIGN KEY (adotante) REFERENCES PESSOA(cpf)
);

-- Nota: A cardinalidade (0,n) em 'adotar' no DER permite que 'adotante' seja NULL, 
-- indicando um pet amparado que ainda não foi adotado.
