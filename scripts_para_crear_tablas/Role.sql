/* Script para crear la tabla de los Roles, con una estructura s�lida  para gestionar 
roles en el contexto del sistema de permisos*/

CREATE TABLE Role (
    -- Primary Key
    id_role BIGINT IDENTITY(1,1) PRIMARY KEY,                 -- Identificador �nico para el rol
    
    -- Foreign Keys
    company_id BIGINT NOT NULL                                -- Compa��a a la que pertenece este rol
        CONSTRAINT FK_Role_Company 
        FOREIGN KEY REFERENCES Company(id_compa),
    
    -- Basic Information
    role_name NVARCHAR(255) NOT NULL,                         -- Nombre descriptivo del rol
    role_code NVARCHAR(255) NOT NULL,                         -- C�digo del rol (agregado basado en unique_together)
    role_description NVARCHAR(MAX) NULL,                      -- Descripci�n detallada del rol y sus responsabilidades
    
    -- Status
    role_active BIT NOT NULL DEFAULT 1,                       -- Indica si el rol est� activo (1) o inactivo (0)
    
    -- Unique constraint for company and role code combination
    CONSTRAINT UQ_Company_RoleCode UNIQUE (company_id, role_code)
);