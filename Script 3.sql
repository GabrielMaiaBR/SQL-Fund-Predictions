-- Criação da Tabela de Dimensão Tempo
CREATE TABLE DWFI.dbo.Dimensao_Tempo (
    Tempo_ID INT IDENTITY(1,1) PRIMARY KEY,
    Data_ID INT NULL,
    Dia INT NULL,
    Mes INT NULL,
    Ano INT NULL
);

-- Criação da Tabela de Dimensão Fundo
CREATE TABLE DWFI.dbo.Dimensao_Fundo (
    Fundo_ID INT IDENTITY(1,1) PRIMARY KEY,
    CNPJ_FUNDO VARCHAR(20) NULL,
    TP_FUNDO VARCHAR(50) NULL
);

-- Criação da Tabela de Dimensão Cotista
CREATE TABLE DWFI.dbo.Dimensao_Cotista (
    Cotista_ID INT IDENTITY(1,1) PRIMARY KEY,
    NR_COTST INT NULL
);

-- Criação da Tabela de Fatos
CREATE TABLE DWFI.dbo.Fatos_Fundos (
    Fato_ID INT IDENTITY(1,1) PRIMARY KEY,
    Tempo_ID INT NULL,
    Fundo_ID INT NULL,
    Cotista_ID INT NULL,
    VL_TOTAL DECIMAL(18, 2) NULL,
    VL_QUOTA DECIMAL(18, 6) NULL,
    VL_PATRIM_LIQ DECIMAL(18, 2) NULL,
    CAPTC_DIA DECIMAL(18, 2) NULL,
    RESG_DIA DECIMAL(18, 2) NULL,
    FOREIGN KEY (Tempo_ID) REFERENCES DWFI.dbo.Dimensao_Tempo (Tempo_ID),
    FOREIGN KEY (Fundo_ID) REFERENCES DWFI.dbo.Dimensao_Fundo (Fundo_ID),
    FOREIGN KEY (Cotista_ID) REFERENCES DWFI.dbo.Dimensao_Cotista (Cotista_ID)
);
