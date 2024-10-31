--Procedimiento para obtener registros por usuario y entitycatalog

Create Procedure RegistrosUserCatalog
	@User_id bigint, -- Id de usuario
	@entitycatalog_id int -- Id de la entidad
as
begin
	
	declare @UserCompany_id BIGINT

	select @UserCompany_id = id_useco  -- Variable para almacenar el id de UserCompany
	from UserCompany
	where user_id = @User_id

	if @UserCompany_id is null  --Validación si existe el usuario en la compañia
	begin
		Print 'Usuario no encontrado'
		return;
	end

	select peusr_record, peusr_include   --Obtiene los registros ya sea con permiso o sin permiso
	from PermiUserRecord
	where entitycatalog_id = @entitycatalog_id and usercompany_id = @UserCompany_id 
end
