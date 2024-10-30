-- Procedimiento para eliminar permisos a nivel de registro específico para roles
CREATE PROCEDURE RemoveRoleRecordPermission
    @RoleId BIGINT,                  -- Rol al que se asigna el permiso
    @PermissionId BIGINT,            -- Permiso que se quiere eliminar
    @EntityCatalogId INT,            -- Entidad en la que se aplica el permiso
    @RecordId BIGINT                 -- Registro específico sobre el cual se quiere eliminar el permiso
AS
BEGIN
    -- Verificación de existencia del permiso antes de intentar eliminarlo
    IF EXISTS (
        SELECT 1 
        FROM PermiRoleRecord 
        WHERE role_id = @RoleId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND perrc_record = @RecordId
    )
    BEGIN
        -- Eliminación del permiso
        DELETE FROM PermiRoleRecord
        WHERE role_id = @RoleId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND perrc_record = @RecordId;

        PRINT 'Permiso específico para rol eliminado con éxito.';
    END
    ELSE
    BEGIN
        PRINT 'El permiso especificado no existe para el rol.';
    END
END;