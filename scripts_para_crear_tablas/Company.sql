CREATE TABLE Company (
    -- Primary Key
    id_compa BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para la compa��a
    
    -- Company Information
    compa_name NVARCHAR(255) NOT NULL,                        -- Nombre legal completo de la compa��a
    compa_tradename NVARCHAR(255) NOT NULL,                   -- Nombre comercial o marca de la compa��a
    
    -- Document Information
    compa_doctype NVARCHAR(2) NOT NULL                        -- Tipo de documento de identificaci�n de la compa��a
        CONSTRAINT CK_Company_DocType 
        CHECK (compa_doctype IN ('NI', 'CC', 'CE', 'PP', 'OT')),
    compa_docnum NVARCHAR(255) NOT NULL,                      -- N�mero de identificaci�n fiscal o documento legal de la compa��a
    
    -- Location Information
    compa_address NVARCHAR(255) NOT NULL,                     -- Direcci�n f�sica de la compa��a
    compa_city NVARCHAR(255) NOT NULL,                        -- Ciudad donde est� ubicada la compa��a
    compa_state NVARCHAR(255) NOT NULL,                       -- Departamento o estado donde est� ubicada la compa��a
    compa_country NVARCHAR(255) NOT NULL,                     -- Pa�s donde est� ubicada la compa��a
    
    -- Contact Information
    compa_industry NVARCHAR(255) NOT NULL,                    -- Sector industrial al que pertenece la compa��a
    compa_phone NVARCHAR(255) NOT NULL,                       -- N�mero de tel�fono principal de la compa��a
    compa_email NVARCHAR(255) NOT NULL,                       -- Direcci�n de correo electr�nico principal de la compa��a
    compa_website NVARCHAR(255) NULL,                         -- Sitio web oficial de la compa��a
    
    -- Media
    compa_logo NVARCHAR(MAX) NULL,                           -- Logo oficial de la compa��a
    
    -- Status
    compa_active BIT NOT NULL DEFAULT 1                       -- Indica si la compa��a est� activa (1) o inactiva (0)
);