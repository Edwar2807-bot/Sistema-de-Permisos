--Script para crear la tabla de permisos, estructurada para gestionar los permisos dentro del sistema

CREATE TABLE Permission (
    -- Primary Key
    id_permi BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para el permiso
    
    -- Basic Information
    name NVARCHAR(255) NOT NULL,                              -- Nombre descriptivo del permiso
    description NVARCHAR(MAX) NULL,                           -- Descripci�n detallada del permiso y su prop�sito
    
    -- CRUD Permissions
    can_create BIT NOT NULL DEFAULT 0,                        -- Permite crear nuevos registros
    can_read BIT NOT NULL DEFAULT 0,                          -- Permite ver registros existentes
    can_update BIT NOT NULL DEFAULT 0,                        -- Permite modificar registros existentes
    can_delete BIT NOT NULL DEFAULT 0,                        -- Permite eliminar registros existentes
    
    -- Data Transfer Permissions
    can_import BIT NOT NULL DEFAULT 0,                        -- Permite importar datos masivamente
    can_export BIT NOT NULL DEFAULT 0                         -- Permite exportar datos del sistema
);