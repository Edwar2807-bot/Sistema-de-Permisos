--Procedimiento para Verificar Permisos de un Usuario en un Registro Específico
CREATE PROCEDURE CheckUserRecordPermission
    @UserCompanyId BIGINT,    -- ID del usuario y compañía para verificar permisos
    @PermissionId BIGINT,      -- ID del permiso que se va a verificar
    @EntityCatalogId INT,   -- ID de la entidad sobre la que se verifica el permiso
    @RecordId BIGINT           -- ID del registro específico que se va a verificar
AS
BEGIN
    -- Selecciona si el permiso está incluido o no para el usuario en el registro específico
    SELECT 
        peusr_include
    FROM 
        PermiUserRecord
    WHERE 
        usercompany_id = @UserCompanyId AND 
        permission_id = @PermissionId AND 
        entitycatalog_id = @EntityCatalogId AND 
        peusr_record = @RecordId;
END
