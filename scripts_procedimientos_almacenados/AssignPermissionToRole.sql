--Procedimiento para Asignar Permisos a un Rol

CREATE PROCEDURE AssignPermissionToRole
    @RoleId BIGINT,           -- ID del rol al que se asigna el permiso
    @PermissionId BIGINT,     -- ID del permiso que se va a asignar
    @EntityCatalogId INT,  -- ID de la entidad sobre la que se asigna el permiso
    @Include BIT = 1          -- Indica si el permiso se incluye (1) o se excluye (0)
AS
BEGIN
    -- Inserta el permiso en la tabla PermiRole
    INSERT INTO PermiRole (role_id, permission_id, entitycatalog_id, perol_include)
    VALUES (@RoleId, @PermissionId, @EntityCatalogId, @Include);
END