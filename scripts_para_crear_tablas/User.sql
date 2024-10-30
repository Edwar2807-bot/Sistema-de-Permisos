/*Script para crear la tabla de los usuarios, contiene campos para gestionar la autenticaci�n 
y el control de acceso, adem�s de restricciones �nicas para el nombre de usuario y el correo electr�nico, 
lo que es esencial para asegurar que cada usuario tenga un identificador �nico en esos aspectos.*/

CREATE TABLE [User] (
    -- Primary Key
    id_user BIGINT IDENTITY(1,1) PRIMARY KEY,                 -- Identificador �nico para el usuario
    
    -- Authentication Information
    user_username NVARCHAR(255) NOT NULL,                     -- Nombre de usuario para iniciar sesi�n
    user_password NVARCHAR(255) NOT NULL,                     -- Contrase�a encriptada del usuario
    
    -- Contact Information
    user_email NVARCHAR(255) NOT NULL,                        -- Direcci�n de correo electr�nico del usuario
    user_phone NVARCHAR(255) NULL,                            -- N�mero de tel�fono del usuario
    
    -- Access Control
    user_is_admin BIT NOT NULL DEFAULT 0,                     -- Indica si el usuario es Administrador (1) o normal (0)
    user_is_active BIT NOT NULL DEFAULT 1,                    -- Indica si el usuario est� activo (1) o inactivo (0)
    
    -- Unique Constraints
    CONSTRAINT UQ_User_Username UNIQUE (user_username),
    CONSTRAINT UQ_User_Email UNIQUE (user_email)
);