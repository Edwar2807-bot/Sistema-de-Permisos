-- Procedimiento para eliminar permisos a nivel de registro espec�fico para roles
CREATE PROCEDURE RemoveRoleRecordPermission
    @RoleId BIGINT,                  -- Rol al que se asigna el permiso
    @PermissionId BIGINT,            -- Permiso que se quiere eliminar
    @EntityCatalogId INT,            -- Entidad en la que se aplica el permiso
    @RecordId BIGINT                 -- Registro espec�fico sobre el cual se quiere eliminar el permiso
AS
BEGIN
    -- Verificaci�n de existencia del permiso antes de intentar eliminarlo
    IF EXISTS (
        SELECT 1 
        FROM PermiRoleRecord 
        WHERE role_id = @RoleId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND perrc_record = @RecordId
    )
    BEGIN
        -- Eliminaci�n del permiso
        DELETE FROM PermiRoleRecord
        WHERE role_id = @RoleId
          AND permission_id = @PermissionId
          AND entitycatalog_id = @EntityCatalogId
          AND perrc_record = @RecordId;

        PRINT 'Permiso espec�fico para rol eliminado con �xito.';
    END
    ELSE
    BEGIN
        PRINT 'El permiso especificado no existe para el rol.';
    END
END;