-- Procedimiento para eliminar permisos a nivel de registro espec�fico para usuarios
CREATE PROCEDURE RemoveUserRecordPermission
    @UserCompanyId BIGINT,           -- Relaci�n entre usuario y compa��a
    @PermissionId BIGINT,             -- Permiso que se quiere eliminar
    @EntityCatalogId INT,             -- Entidad en la que se aplica el permiso
    @RecordId BIGINT                  -- Registro espec�fico sobre el cual se quiere eliminar el permiso
AS
BEGIN
    -- Verificaci�n de existencia del permiso antes de intentar eliminarlo
    IF EXISTS (
        SELECT 1 
        FROM PermiUserRecord 
        WHERE usercompany_id = @UserCompanyId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND peusr_record = @RecordId
    )
    BEGIN
        -- Eliminaci�n del permiso
        DELETE FROM PermiUserRecord
        WHERE usercompany_id = @UserCompanyId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND peusr_record = @RecordId;

        PRINT 'Permiso espec�fico para usuario eliminado con �xito.';
    END
    ELSE
    BEGIN
        PRINT 'El permiso especificado no existe para el usuario.';
    END
END;

