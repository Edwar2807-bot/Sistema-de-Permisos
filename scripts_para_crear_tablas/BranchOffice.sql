--Creaci�n de la tabla para la sucursal (Branch Office)
CREATE TABLE BranchOffice (
    -- Primary Key
    id_broff BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para la sucursal

    -- Company Reference
    company_id BIGINT NOT NULL                                -- Compa��a a la que pertenece esta sucursal
        CONSTRAINT FK_BranchOffice_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    -- Branch Office Information
    broff_name NVARCHAR(255) NOT NULL,                        -- Nombre descriptivo de la sucursal
    broff_code NVARCHAR(255) NOT NULL,                        -- C�digo �nico que identifica la sucursal dentro de la empresa
    
    -- Location Information
    broff_address NVARCHAR(255) NOT NULL,                     -- Direcci�n f�sica de la sucursal
    broff_city NVARCHAR(255) NOT NULL,                        -- Ciudad donde est� ubicada la sucursal
    broff_state NVARCHAR(255) NOT NULL,                       -- Departamento o estado donde est� ubicada la sucursal
    broff_country NVARCHAR(255) NOT NULL,                     -- Pa�s donde est� ubicada la sucursal
    
    -- Contact Information
    broff_phone NVARCHAR(255) NOT NULL,                       -- N�mero de tel�fono de la sucursal
    broff_email NVARCHAR(255) NOT NULL,                       -- Direcci�n de correo electr�nico de la sucursal
    
    -- Status
    broff_active BIT NOT NULL DEFAULT 1,                      -- Indica si la sucursal est� activa (1) o inactiva (0)

    -- Unique constraint for company and branch code combination
    CONSTRAINT UQ_Company_BranchCode UNIQUE (company_id, broff_code)
);