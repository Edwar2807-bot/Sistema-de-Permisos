CREATE TABLE UserCompanyRole (
    -- Primary Key
    id_ucrole BIGINT IDENTITY(1,1) PRIMARY KEY,                -- Identificador �nico para la relaci�n usuario-compa��a-rol

    -- Foreign Keys
    usercompany_id BIGINT NOT NULL                              -- Relaci�n usuario-compa��a a la que se asigna el rol
        CONSTRAINT FK_UserCompanyRole_UserCompany
        FOREIGN KEY REFERENCES UserCompany(id_useco),
        
    role_id BIGINT NOT NULL                                     -- Rol asignado al usuario en esa compa��a
        CONSTRAINT FK_UserCompanyRole_Role
        FOREIGN KEY REFERENCES Role(id_role),
    
    -- Status
    ucrole_active BIT NOT NULL DEFAULT 1,                       -- Indica si la relaci�n usuario-compa��a-rol est� activa (1) o inactiva (0)

    -- Unique constraint for user-company and role combination
    CONSTRAINT UQ_UserCompany_Role UNIQUE (usercompany_id, role_id)
);