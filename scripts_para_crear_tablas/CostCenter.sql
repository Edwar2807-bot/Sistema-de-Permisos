--script para crear la tabla Centro de Costos (Cost Center)

CREATE TABLE CostCenter (
    -- Primary Key
    id_cosce BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para el centro de costo
    
    -- Foreign Keys
    company_id BIGINT NOT NULL                                -- Compa��a a la que pertenece este centro de costo
        CONSTRAINT FK_CostCenter_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    cosce_parent_id BIGINT NULL                               -- Centro de costo superior en la jerarqu�a organizacional
        CONSTRAINT FK_CostCenter_Parent 
        FOREIGN KEY REFERENCES CostCenter(id_cosce),
    
    -- Basic Information
    cosce_code NVARCHAR(255) NOT NULL,                        -- C�digo �nico que identifica el centro de costo
    cosce_name NVARCHAR(255) NOT NULL,                        -- Nombre descriptivo del centro de costo
    cosce_description NVARCHAR(MAX) NULL,                     -- Descripci�n detallada del centro de costo y su prop�sito
    
    -- Financial Information
    cosce_budget DECIMAL(15,2) NOT NULL DEFAULT 0,            -- Presupuesto asignado al centro de costo
    
    -- Hierarchical Information
    cosce_level SMALLINT NOT NULL DEFAULT 1                   -- Nivel en la jerarqu�a de centros de costo (1 para nivel superior)
        CONSTRAINT CK_CostCenter_Level 
        CHECK (cosce_level > 0),
    
    -- Status
    cosce_active BIT NOT NULL DEFAULT 1,                      -- Indica si el centro de costo est� activo (1) o inactivo (0)
    
    -- Unique constraint for company and cost center code combination
    CONSTRAINT UQ_Company_CostCenterCode UNIQUE (company_id, cosce_code)
);