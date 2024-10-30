--Procedimiento para Asignar Permisos a un Usuario en un Registro Espec�fico

CREATE PROCEDURE AssignRecordPermissionToUser
    @UserCompanyId BIGINT,    -- ID del usuario y compa��a al que se asigna el permiso
    @PermissionId BIGINT,      -- ID del permiso que se va a asignar
    @EntityCatalogId INT,   -- ID de la entidad sobre la que se asigna el permiso
    @RecordId BIGINT,          -- ID del registro espec�fico al que se aplica el permiso
    @Include BIT = 1           -- Indica si el permiso se incluye (1) o se excluye (0)
AS
BEGIN
    -- Inserta el permiso en la tabla PermiUserRecord
    INSERT INTO PermiUserRecord (usercompany_id, permission_id, entitycatalog_id, peusr_record, peusr_include)
    VALUES (@UserCompanyId, @PermissionId, @EntityCatalogId, @RecordId, @Include);
END
