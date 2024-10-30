--Procedimiento para Verificar Permisos de un Usuario en una Entidad
CREATE PROCEDURE CheckUserPermission
    @UserCompanyId BIGINT,    -- ID del usuario y compañía para verificar permisos
    @PermissionId BIGINT,      -- ID del permiso que se va a verificar
    @EntityCatalogId INT    -- ID de la entidad sobre la que se verifica el permiso
AS
BEGIN
    -- Selecciona si el permiso está incluido o no para el usuario en la entidad
    SELECT 
        peusr_include
    FROM 
        PermiUser
    WHERE 
        usercompany_id = @UserCompanyId AND 
        permission_id = @PermissionId AND 
        entitycatalog_id = @EntityCatalogId;
END
