--Procedimiento para Asignar Permisos a un Rol en un Registro Específico
CREATE PROCEDURE AssignRecordPermissionToRole
    @RoleId BIGINT,           -- ID del rol al que se asigna el permiso
    @PermissionId BIGINT,     -- ID del permiso que se va a asignar
    @EntityCatalogId INT,  -- ID de la entidad sobre la que se asigna el permiso
    @RecordId BIGINT,         -- ID del registro específico al que se aplica el permiso
    @Include BIT = 1          -- Indica si el permiso se incluye (1) o se excluye (0)
AS
BEGIN
    -- Inserta el permiso en la tabla PermiRoleRecord
    INSERT INTO PermiRoleRecord (role_id, permission_id, entitycatalog_id, perrc_record, perrc_include)
    VALUES (@RoleId, @PermissionId, @EntityCatalogId, @RecordId, @Include);
END
