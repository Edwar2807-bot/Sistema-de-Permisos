--Procedimiento para Verificar Permisos de un Rol en un Registro Espec�fico
CREATE PROCEDURE CheckRoleRecordPermission
    @RoleId BIGINT,           -- ID del rol para verificar permisos
    @PermissionId BIGINT,     -- ID del permiso que se va a verificar
    @EntityCatalogId INT,  -- ID de la entidad sobre la que se verifica el permiso
    @RecordId BIGINT          -- ID del registro espec�fico que se va a verificar
AS
BEGIN
    -- Selecciona si el permiso est� incluido o no para el rol en el registro espec�fico
    SELECT 
        perrc_include
    FROM 
        PermiRoleRecord
    WHERE 
        role_id = @RoleId AND 
        permission_id = @PermissionId AND 
        entitycatalog_id = @EntityCatalogId AND 
        perrc_record = @RecordId;
END