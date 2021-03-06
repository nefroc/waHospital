USE [Hospital]
GO
/****** Object:  UserDefinedFunction [dbo].[f_edad]    Script Date: 9/21/2021 3:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_edad]
 (
	@fecha date
 )
 returns int
 as
 begin 
   declare @edad int
   
	Select @edad = floor(
	(cast(convert(varchar(8),getdate(),112) as int)-
	cast(convert(varchar(8),@fecha,112) as int) ) / 10000
	)

   return @edad
 end;
GO
/****** Object:  Table [dbo].[log_table_tblMedico]    Script Date: 9/21/2021 3:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_table_tblMedico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](70) NULL,
	[Apellidos] [nvarchar](100) NULL,
	[Edad] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[Especialidad] [nvarchar](100) NULL,
	[IdMedico] [int] NULL,
	[FechaEliminacion] [datetime] NULL,
	[UsuarioBD] [nvarchar](50) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[tblMedico]    Script Date: 9/21/2021 3:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](70) NULL,
	[Apellidos] [nvarchar](100) NULL,
	[Edad] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[Especialidad] [nvarchar](100) NULL
) ON [PRIMARY]
GO


CREATE TRIGGER [dbo].[eliminar] 
   ON  [dbo].[tblMedico]
   AFTER DELETE
AS 
BEGIN
	insert into dbo.log_table_tblMedico (Nombre, Apellidos, Edad, FechaNacimiento, Especialidad, IdMedico, FechaEliminacion, UsuarioBD)
	select Nombre, Apellidos, Edad, FechaNacimiento, Especialidad, Id, getdate(), SYSTEM_USER
	from deleted

END
GO




/****** Object:  StoredProcedure [dbo].[eliminarMedico]    Script Date: 9/21/2021 3:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarMedico]
@Id int
AS

DELETE FROM tblMedico WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[insertarMedico]    Script Date: 9/21/2021 3:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertarMedico]
	@nombre nvarchar(70),
	@apellidos nvarchar(100),
	@fechaNacimiento date,
	@especialidad nvarchar(50)
 as
	declare @result nvarchar(50)
	declare @edad int
  if dbo.f_edad(@fechaNacimiento) >= 25 
  begin
	insert into tblMedico (Nombre, Apellidos, Edad, FechaNacimiento, Especialidad)
	values (@nombre, @apellidos, dbo.f_edad(@fechaNacimiento), @fechaNacimiento, @especialidad)
	set @result = cast( IDENT_CURRENT('tblMedico') as nvarchar(4))
	end 
  else
  begin
	set @result = 'El médico tiene menos de 25 años'
	end
select @result

GO
