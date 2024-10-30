--Procedimiento para Asignar Permisos a un Usuario

CREATE PROCEDURE AssignPermissionToUser
    @UserCompanyId BIGINT,    -- ID del usuario y compañía al que se asigna el permiso
    @PermissionId BIGINT,      -- ID del permiso que se va a asignar
    @EntityCatalogId INT,   -- ID de la entidad sobre la que se asigna el permiso
    @Include BIT = 1           -- Indica si el permiso se incluye (1) o se excluye (0)
AS
BEGIN
    -- Inserta el permiso en la tabla PermiUser
    INSERT INTO PermiUser (usercompany_id, permission_id, entitycatalog_id, peusr_include)
    VALUES (@UserCompanyId, @PermissionId, @EntityCatalogId, @Include);
END