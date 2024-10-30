--Procedimiento para Eliminar Permisos de un Usuario
CREATE PROCEDURE RemoveUserPermission
    @UserCompanyId BIGINT,    -- ID del usuario y compañía cuyo permiso se va a eliminar
    @PermissionId BIGINT,      -- ID del permiso que se va a eliminar
    @EntityCatalogId INT    -- ID de la entidad sobre la que se elimina el permiso
AS
BEGIN
    -- Elimina el permiso de la tabla PermiUser
    DELETE FROM PermiUser
    WHERE 
        usercompany_id = @UserCompanyId AND 
        permission_id = @PermissionId AND 
        entitycatalog_id = @EntityCatalogId;
END
