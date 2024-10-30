--Procedimiento para Eliminar Permisos de un Rol
CREATE PROCEDURE RemoveRolePermission
    @RoleId BIGINT,           -- ID del rol cuyo permiso se va a eliminar
    @PermissionId BIGINT,     -- ID del permiso que se va a eliminar
    @EntityCatalogId INT    -- ID de la entidad sobre la que se elimina el permiso
AS
BEGIN
    -- Elimina el permiso de la tabla PermiRole
    DELETE FROM PermiRole
    WHERE 
        role_id = @RoleId AND 
        permission_id = @PermissionId AND 
        entitycatalog_id = @EntityCatalogId;
END
