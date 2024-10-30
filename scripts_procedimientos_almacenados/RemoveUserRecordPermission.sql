-- Procedimiento para eliminar permisos a nivel de registro específico para usuarios
CREATE PROCEDURE RemoveUserRecordPermission
    @UserCompanyId BIGINT,           -- Relación entre usuario y compañía
    @PermissionId BIGINT,             -- Permiso que se quiere eliminar
    @EntityCatalogId INT,             -- Entidad en la que se aplica el permiso
    @RecordId BIGINT                  -- Registro específico sobre el cual se quiere eliminar el permiso
AS
BEGIN
    -- Verificación de existencia del permiso antes de intentar eliminarlo
    IF EXISTS (
        SELECT 1 
        FROM PermiUserRecord 
        WHERE usercompany_id = @UserCompanyId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND peusr_record = @RecordId
    )
    BEGIN
        -- Eliminación del permiso
        DELETE FROM PermiUserRecord
        WHERE usercompany_id = @UserCompanyId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND peusr_record = @RecordId;

        PRINT 'Permiso específico para usuario eliminado con éxito.';
    END
    ELSE
    BEGIN
        PRINT 'El permiso especificado no existe para el usuario.';
    END
END;

