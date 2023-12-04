-- Inserir dados na tabela Dimensao_Tempo no DWFI
INSERT INTO DWFI.dbo.Dimensao_Tempo (Dia, Mes, Ano)
SELECT DISTINCT
    DAY(DT_COMPTC) AS Dia,
    MONTH(DT_COMPTC) AS Mes,
    YEAR(DT_COMPTC) AS Ano
FROM FI.dbo.InfDiarioFI;


-- Inserir dados na tabela Dimensao_Fundo no DWFI
INSERT INTO DWFI.dbo.Dimensao_Fundo (CNPJ_FUNDO, TP_FUNDO)
SELECT DISTINCT
    CNPJ_FUNDO,
    TP_FUNDO
FROM FI.dbo.InfDiarioFI;

-- Inserir dados na tabela Dimensao_Cotista no DWFI
INSERT INTO DWFI.dbo.Dimensao_Cotista (NR_COTST)
SELECT DISTINCT
    NR_COTST
FROM FI.dbo.InfDiarioFI;

-- Inserir dados na tabela Fatos_Fundos no DWFI
INSERT INTO DWFI.dbo.Fatos_Fundos (Tempo_ID, Fundo_ID, Cotista_ID, VL_TOTAL, VL_QUOTA, VL_PATRIM_LIQ, CAPTC_DIA, RESG_DIA)
SELECT 
    D.Tempo_ID,
    F.Fundo_ID,
    C.Cotista_ID,
    I.VL_TOTAL,
    I.VL_QUOTA,
    I.VL_PATRIM_LIQ,
    I.CAPTC_DIA,
    I.RESG_DIA
FROM 
    FI.dbo.InfDiarioFI I
INNER JOIN 
    DWFI.dbo.Dimensao_Tempo D ON D.Dia = DAY(I.DT_COMPTC) AND D.Mes = MONTH(I.DT_COMPTC) AND D.Ano = YEAR(I.DT_COMPTC)
INNER JOIN 
    DWFI.dbo.Dimensao_Fundo F ON F.CNPJ_FUNDO = I.CNPJ_FUNDO
INNER JOIN 
    DWFI.dbo.Dimensao_Cotista C ON C.NR_COTST = I.NR_COTST;
