--Procedimiento para Verificar Permisos de un Rol en una Entidad
CREATE PROCEDURE CheckRolePermission
    @RoleId BIGINT,           -- ID del rol para verificar permisos
    @PermissionId BIGINT,     -- ID del permiso que se va a verificar
    @EntityCatalogId INT    -- ID de la entidad sobre la que se verifica el permiso
AS
BEGIN
    -- Selecciona si el permiso está incluido o no para el rol en la entidad
    SELECT 
        perol_include
    FROM 
        PermiRole
    WHERE 
        role_id = @RoleId AND 
        permission_id = @PermissionId AND 
        entitycatalog_id = @EntityCatalogId;
END
