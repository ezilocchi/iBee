/*
Script generado por Aqua Data Studio 7.5.11 en may-25-2009 07:35:54 PM
Base de datos: null
Esquema: <Todos los esquemas>
*/

ALTER TABLE "Tarea"
	DROP CONSTRAINT "REL_Act_Tar"
GO
ALTER TABLE "Marco"
	DROP CONSTRAINT "REL_Alza_Marco"
GO
ALTER TABLE "AsignacionColmena"
	DROP CONSTRAINT "REL_AsigCol_Apiar"
GO
ALTER TABLE "Colmena"
	DROP CONSTRAINT "REL_Colmena_Cajon"
GO
ALTER TABLE "Alza"
	DROP CONSTRAINT "REL_Cajon_Alza"
GO
ALTER TABLE "Empleado"
	DROP CONSTRAINT "REL_Cargo_Emp"
GO
ALTER TABLE "HistorialEstadoColmena"
	DROP CONSTRAINT "REL_HistEstadoCol_Colmena"
GO
ALTER TABLE "AsignacionColmena"
	DROP CONSTRAINT "REL_AsigCol_Colmena"
GO
ALTER TABLE "Colmena"
	DROP CONSTRAINT "REL_Colmena_ColmenaOrig"
GO
ALTER TABLE "EnfermedadEnColmena"
	DROP CONSTRAINT "REL_EnfEnCol_Colmena"
GO
ALTER TABLE "Enfermedad"
	DROP CONSTRAINT "REL_Enf_Crit"
GO
ALTER TABLE "RecoleccionDato"
	DROP CONSTRAINT "REL_DatoRecolec_RecolecDato"
GO
ALTER TABLE "Tarea"
	DROP CONSTRAINT "REL_Emp_Tar"
GO
ALTER TABLE "EnfermedadEnColmena"
	DROP CONSTRAINT "REL_EnfEnCol_Enfermedad"
GO
ALTER TABLE "Sintoma"
	DROP CONSTRAINT "REL_Enf_Sint"
GO
ALTER TABLE "Tratamiento"
	DROP CONSTRAINT "REL_Enf_Trat"
GO
ALTER TABLE "Familia"
	DROP CONSTRAINT "REL_Fam_Esp"
GO
ALTER TABLE "HistorialEstadoColmena"
	DROP CONSTRAINT "REL_HistEStadoCol_Estado"
GO
ALTER TABLE "HistorialEstadoFamilia"
	DROP CONSTRAINT "REL_HistEstFam_EstFam"
GO
ALTER TABLE "Tarea"
	DROP CONSTRAINT "REL_EstTar_Tar"
GO
ALTER TABLE "HistorialEstadoFamilia"
	DROP CONSTRAINT "REL_HistEstFam_Fam"
GO
ALTER TABLE "Colmena"
	DROP CONSTRAINT "REL_Colmena_Familia"
GO
ALTER TABLE "Apiar"
	DROP CONSTRAINT "REL_Col_Layout"
GO
ALTER TABLE "Familia"
	DROP CONSTRAINT "REL_Fam_MiembroFam"
GO
ALTER TABLE "Alarma"
	DROP CONSTRAINT "REL_Period_Alarma"
GO
ALTER TABLE "Layout"
	DROP CONSTRAINT "REL_Lay_Pos"
GO
ALTER TABLE "Colmena"
	DROP CONSTRAINT "REL_Col_Pos"
GO
ALTER TABLE "RecoleccionDato"
	DROP CONSTRAINT "REL_Tar_RecDato"
GO
ALTER TABLE "MiembroFamilia"
	DROP CONSTRAINT "REL_MiembroFam_TipoAbeja"
GO
ALTER TABLE "TipoTarea"
	DROP CONSTRAINT "REL_TpoAct_TpoTar"
GO
ALTER TABLE "Actividad"
	DROP CONSTRAINT "REL_TpoAct_Act"
GO
ALTER TABLE "Agroquimico"
	DROP CONSTRAINT "REL_TipoAgro_Agro"
GO
ALTER TABLE "Alarma"
	DROP CONSTRAINT "REL_TpoAlar_Alarma"
GO
ALTER TABLE "Alza"
	DROP CONSTRAINT "REL_Alza_TipoAlza"
GO
ALTER TABLE "DatoDeRecoleccion"
	DROP CONSTRAINT "REL_TpoDat_DatDeRec"
GO
ALTER TABLE "Flora"
	DROP CONSTRAINT "REL_TpoFlora_Flora"
GO
ALTER TABLE "Colmena"
	DROP CONSTRAINT "REL_Colmena_TipoMiel"
GO
ALTER TABLE "DatoDeRecoleccion"
	DROP CONSTRAINT "REL_TpoTar_DatDeRec"
GO
ALTER TABLE "Tarea"
	DROP CONSTRAINT "REL_TpoTar_Tar"
GO
ALTER TABLE "Apiar"
	DROP CONSTRAINT "REL_Apiar_Ubic"
GO
ALTER TABLE "UbicacionDeZona"
	DROP CONSTRAINT "REL_Ubic_UbicDeZona"
GO
ALTER TABLE "UbicacionDeZona"
	DROP CONSTRAINT "REL_UbicDeZona_Zona"
GO
ALTER TABLE "Agroquimico"
	DROP CONSTRAINT "REL_Zona_Agro"
GO
ALTER TABLE "Flora"
	DROP CONSTRAINT "REL_Zona_Flora"
GO
ALTER TABLE "Clima"
	DROP CONSTRAINT "REL_Zona_Clima"
GO
ALTER TABLE "Alarma"
	DROP CONSTRAINT "REL_Zona_Alarma"
GO
DROP TABLE "Actividad"
GO
DROP TABLE "Agroquimico"
GO
DROP TABLE "Alarma"
GO
DROP TABLE "Alza"
GO
DROP TABLE "Apiar"
GO
DROP TABLE "AsignacionColmena"
GO
DROP TABLE "Cajon"
GO
DROP TABLE "Cargo"
GO
DROP TABLE "Clima"
GO
DROP TABLE "Colmena"
GO
DROP TABLE "Criticidad"
GO
DROP TABLE "DatoDeRecoleccion"
GO
DROP TABLE "Empleado"
GO
DROP TABLE "Enfermedad"
GO
DROP TABLE "EnfermedadEnColmena"
GO
DROP TABLE "Especie"
GO
DROP TABLE "EstadoColmena"
GO
DROP TABLE "EstadoFamilia"
GO
DROP TABLE "EstadoTarea"
GO
DROP TABLE "Familia"
GO
DROP TABLE "Flora"
GO
DROP TABLE "HistorialEstadoColmena"
GO
DROP TABLE "HistorialEstadoFamilia"
GO
DROP TABLE "Layout"
GO
DROP TABLE "Marco"
GO
DROP TABLE "MiembroFamilia"
GO
DROP TABLE "Periodicidad"
GO
DROP TABLE "Posicion"
GO
DROP TABLE "RecoleccionDato"
GO
DROP TABLE "Sintoma"
GO
DROP TABLE "Tarea"
GO
DROP TABLE "TipoAbeja"
GO
DROP TABLE "TipoActividad"
GO
DROP TABLE "TipoAgroquimico"
GO
DROP TABLE "TipoAlarma"
GO
DROP TABLE "TipoAlza"
GO
DROP TABLE "TipoDato"
GO
DROP TABLE "TipoFlora"
GO
DROP TABLE "TipoMiel"
GO
DROP TABLE "TipoTarea"
GO
DROP TABLE "Tratamiento"
GO
DROP TABLE "Ubicacion"
GO
DROP TABLE "UbicacionDeZona"
GO
DROP TABLE "Zona"
GO
CREATE TABLE "Actividad" ( 
	"idActividad"     	int NOT NULL,
	"codTipoActividad"	char(5) NOT NULL,
	"denominacion"    	varchar(25) NULL,
	"descripcion"     	varchar(100) NULL,
	"fechaCreacion"   	datetime NULL,
	"fechaInicio"     	datetime NULL,
	"fechaFin"        	datetime NULL,
	"estado"          	varchar(10) NULL,
	"observaciones"   	varchar(500) NULL,
	"idApiar"         	int NULL,
	CONSTRAINT "PK_Actividad_01" PRIMARY KEY NONCLUSTERED("idActividad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Agroquimico" ( 
	"idAgroquimico"    	int NOT NULL,
	"idZona"           	int NOT NULL,
	"idTipoAgroquimico"	int NOT NULL,
	"denominacion"     	varchar(25) NULL,
	"descripcion"      	varchar(100) NULL,
	"observaciones"    	varchar(500) NULL,
	CONSTRAINT "PK_Agroquimico_01" PRIMARY KEY NONCLUSTERED("idAgroquimico","idZona")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Alarma" ( 
	"idAlarma"      	int NOT NULL,
	"idZona"        	int NOT NULL,
	"denominacion"  	varchar(25) NULL,
	"descripcion"   	varchar(100) NULL,
	"origen"        	varchar(10) NULL,
	"fechaCreacion" 	datetime NULL,
	"fechaInicio"   	datetime NULL,
	"fechaFin"      	datetime NULL,
	"idPeriodicidad"	int NULL,
	"tipoAlarma"    	int NULL,
	CONSTRAINT "PK_Alarma_01" PRIMARY KEY NONCLUSTERED("idAlarma","idZona")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Alza" ( 
	"numeroAlza"   	int NOT NULL,
	"numeroCajon"  	int NOT NULL,
	"descripcion"  	varchar(100) NULL,
	"estado"       	varchar(10) NULL,
	"tama?o"       	varchar(25) NULL,
	"observaciones"	varchar(500) NULL,
	"idTipoAlza"   	int NULL,
	CONSTRAINT "PK_Alza_01" PRIMARY KEY NONCLUSTERED("numeroAlza","numeroCajon")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Apiar" ( 
	"idApiar"      	int NOT NULL,
	"denominacion" 	varchar(100) NULL,
	"fechaCreacion"	datetime NULL,
	"fechaAlta"    	datetime NULL,
	"fechaBaja"    	datetime NULL,
	"estado"       	varchar(10) NULL,
	"idLayout"     	int NULL,
	"idUbicacion"  	int NULL,
	"idZona"       	int NULL,
	CONSTRAINT "PK_Apiar_01" PRIMARY KEY NONCLUSTERED("idApiar")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "AsignacionColmena" ( 
	"idApiar"      	int NOT NULL,
	"numeroColmena"	int NOT NULL,
	"fechaDesde"   	datetime NULL,
	"fechaHasta"   	datetime NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_AsigCol_01" PRIMARY KEY NONCLUSTERED("idApiar","numeroColmena")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Cajon" ( 
	"numeroCajon"       	int NOT NULL,
	"descripcion"       	varchar(100) NULL,
	"estado"            	varchar(10) NULL,
	"tama?o"            	varchar(25) NULL,
	"usuarioFabricacion"	varchar(25) NULL,
	"fechafabricacion"  	datetime NULL,
	"observaciones"     	varchar(500) NULL,
	CONSTRAINT "PK_Cajon_01" PRIMARY KEY NONCLUSTERED("numeroCajon")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Cargo" ( 
	"idCargo"     	int NOT NULL,
	"denominacion"	varchar(25) NULL,
	"descripcion" 	varchar(100) NULL,
	CONSTRAINT "PK_Cargo_01" PRIMARY KEY NONCLUSTERED("idCargo")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Clima" ( 
	"idFlora"    	int NOT NULL,
	"idZona"     	int NOT NULL,
	"fecha"      	datetime NULL,
	"itemDeClima"	varchar(25) NULL,
	"temperatura"	decimal(15,5) NULL,
	"humedad"    	decimal(15,5) NULL,
	"indiceUV"   	decimal(15,5) NULL,
	"vientos"    	decimal(15,5) NULL,
	"luna"       	decimal(15,5) NULL,
	CONSTRAINT "PK_Clima_01" PRIMARY KEY NONCLUSTERED("idFlora","idZona")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Colmena" ( 
	"numeroColmena"    	int NOT NULL,
	"denominacion"     	varchar(100) NULL,
	"fechaAlta"        	datetime NULL,
	"fechaBaja"        	datetime NULL,
	"numeroFamilia"    	int NULL,
	"idColmenaOriginal"	int NULL,
	"idTipoMiel"       	int NULL,
	"numeroCajon"      	int NULL,
	"idPosicion"       	int NULL,
	CONSTRAINT "PK_Colmena_01" PRIMARY KEY NONCLUSTERED("numeroColmena")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Criticidad" ( 
	"idCriticidad"	int NOT NULL,
	"denominacion"	varchar(25) NULL,
	"descripcion" 	varchar(100) NULL,
	CONSTRAINT "PK_Criticidad_01" PRIMARY KEY NONCLUSTERED("idCriticidad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "DatoDeRecoleccion" ( 
	"codDatoDeRecoleccion"	char(5) NOT NULL,
	"codTipoTarea"        	char(5) NOT NULL,
	"codTipoActividad"    	char(5) NOT NULL,
	"nombreDato"          	varchar(100) NULL,
	"idTipoDato"          	int NULL,
	"valoresPermitidos"   	varchar(250) NULL,
	"extension"           	varchar(25) NULL,
	CONSTRAINT "PK_DatoDeRecoleccion_01" PRIMARY KEY NONCLUSTERED("codTipoActividad","codTipoTarea","codDatoDeRecoleccion")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Empleado" ( 
	"legajo"       	int NOT NULL,
	"nombre"       	varchar(50) NULL,
	"apellido"     	varchar(50) NULL,
	"estado"       	varchar(10) NULL,
	"idCargo"      	int NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_Empleado_01" PRIMARY KEY NONCLUSTERED("legajo")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Enfermedad" ( 
	"idEnfermedad"      	int NOT NULL,
	"denominacion"      	varchar(25) NULL,
	"descripcion"       	varchar(100) NULL,
	"duracionAproximada"	varchar(25) NULL,
	"observaciones"     	varchar(500) NULL,
	"idCriticidad"      	int NULL,
	CONSTRAINT "PK_Enfermedad_01" PRIMARY KEY NONCLUSTERED("idEnfermedad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "EnfermedadEnColmena" ( 
	"numeroColmena"	int NOT NULL,
	"idEnfermedad" 	int NOT NULL,
	"fechaDesde"   	datetime NULL,
	"fechaHasta"   	datetime NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_EnfermedadEnColmena_01" PRIMARY KEY NONCLUSTERED("numeroColmena","idEnfermedad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Especie" ( 
	"idEspecie"   	int NOT NULL,
	"denominacion"	varchar(10) NULL,
	"descripcion" 	varchar(100) NULL,
	CONSTRAINT "PK_Especie_01" PRIMARY KEY NONCLUSTERED("idEspecie")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "EstadoColmena" ( 
	"idEstadocolmena"	int NOT NULL,
	"denominacion"   	varchar(10) NULL,
	"descripcion"    	varchar(100) NULL,
	CONSTRAINT "PK_EstadoColmena_01" PRIMARY KEY NONCLUSTERED("idEstadocolmena")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "EstadoFamilia" ( 
	"idEstadoFamilia"	int NOT NULL,
	"denominacion"   	varchar(10) NULL,
	"descripcion"    	varchar(100) NULL,
	CONSTRAINT "PK_EstadoFamilia_01" PRIMARY KEY NONCLUSTERED("idEstadoFamilia")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "EstadoTarea" ( 
	"idEstadoTarea"	int NOT NULL,
	"descripcion"  	varchar(25) NULL,
	CONSTRAINT "PK_EstadoTarea" PRIMARY KEY NONCLUSTERED("idEstadoTarea")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Familia" ( 
	"numeroFamilia"  	int NOT NULL,
	"caracteristicas"	varchar(200) NULL,
	"fechaAlta"      	datetime NULL,
	"idEspecie"      	int NULL,
	"observaciones"  	varchar(500) NULL,
	CONSTRAINT "PK_Familia_01" PRIMARY KEY NONCLUSTERED("numeroFamilia")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Flora" ( 
	"idFlora"      	int NOT NULL,
	"idZona"       	int NOT NULL,
	"idTipoFlora"  	int NOT NULL,
	"denominacion" 	varchar(25) NULL,
	"descripcion"  	varchar(100) NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_Flora_01" PRIMARY KEY NONCLUSTERED("idFlora","idZona")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "HistorialEstadoColmena" ( 
	"idEstadoColmena"	int NOT NULL,
	"numeroColmena"  	int NOT NULL,
	"fecha"          	datetime NULL,
	"observaciones"  	varchar(25) NULL,
	CONSTRAINT "PK_HistEstadoColmena" PRIMARY KEY NONCLUSTERED("idEstadoColmena","numeroColmena")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "HistorialEstadoFamilia" ( 
	"numeroFamilia"  	int NOT NULL,
	"idEstadoFamilia"	int NOT NULL,
	"fecha"          	datetime NULL,
	"observaciones"  	varchar(200) NULL,
	CONSTRAINT "PK_HistEstFam_01" PRIMARY KEY NONCLUSTERED("numeroFamilia","idEstadoFamilia")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Layout" ( 
	"idLayout"     	int NOT NULL,
	"denominacion" 	varchar(100) NULL,
	"dise?o"       	varchar(10) NULL,
	"ventaja"      	varchar(150) NULL,
	"observaciones"	varchar(500) NULL,
	"fechaCreacion"	datetime NULL,
	"idPosicion"   	int NULL,
	CONSTRAINT "PK_Layout_01" PRIMARY KEY NONCLUSTERED("idLayout")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Marco" ( 
	"numeroMarco"  	int NOT NULL,
	"numeroAlza"   	int NOT NULL,
	"numeroCajon"  	int NOT NULL,
	"descripcion"  	varchar(100) NULL,
	"tama?o"       	varchar(25) NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_Marco_01" PRIMARY KEY NONCLUSTERED("numeroMarco","numeroAlza","numeroCajon")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "MiembroFamilia" ( 
	"idMiembroFamilia"	int NOT NULL,
	"numeroFamilia"   	int NOT NULL,
	"denominacion"    	varchar(100) NULL,
	"fechaNac"        	datetime NULL,
	"fechaAlta"       	datetime NULL,
	"fechaBaja"       	datetime NULL,
	"idTipoAbeja"     	int NULL,
	CONSTRAINT "PK_MiembroFamilia_01" PRIMARY KEY NONCLUSTERED("idMiembroFamilia","numeroFamilia")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Periodicidad" ( 
	"idPeriodicidad"	int NULL,
	"periodicidad"  	varchar(25) NULL 
	)
GO
CREATE TABLE "Posicion" ( 
	"idPosicion"   	int NOT NULL,
	"posHorizontal"	varchar(25) NULL,
	"posVertical"  	varchar(25) NULL,
	CONSTRAINT "PK_Posicion_01" PRIMARY KEY NONCLUSTERED("idPosicion")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "RecoleccionDato" ( 
	"idActividad"         	int NOT NULL,
	"idTarea"             	int NOT NULL,
	"idRecoleccionDato"   	int NOT NULL,
	"codTipoActividad"    	char(5) NOT NULL,
	"codTipoTarea"        	char(5) NOT NULL,
	"codDatoDeRecoleccion"	char(5) NOT NULL,
	"valor"               	varchar(250) NULL 
	)
GO
CREATE TABLE "Sintoma" ( 
	"idSintoma"    	int NOT NULL,
	"idEnfermedad" 	int NOT NULL,
	"denominacion" 	varchar(25) NULL,
	"descripcion"  	varchar(100) NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_Sintoma_01" PRIMARY KEY NONCLUSTERED("idSintoma","idEnfermedad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Tarea" ( 
	"idActividad"     	int NOT NULL,
	"idTarea"         	int NOT NULL,
	"codTipoActividad"	char(5) NOT NULL,
	"codTipoTarea"    	char(5) NOT NULL,
	"descripcion"     	varchar(25) NULL,
	"idEstadoTarea"   	int NULL,
	"fechaRealizacion"	datetime NULL,
	"fechaPrevista"   	datetime NULL,
	"observaciones"   	datetime NULL,
	"legajoEmpleado"  	int NULL,
	"idColmena"       	int NULL,
	"idResidente"     	int NULL,
	"idFamilia"       	int NULL,
	"idCajon"         	int NULL,
	"idSintoma"       	int NULL,
	"idTratamiento"   	int NULL,
	"idEnfermedad"    	int NULL,
	CONSTRAINT "PK_Tarea_01" PRIMARY KEY NONCLUSTERED("idActividad","idTarea")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoAbeja" ( 
	"idTipoAbeja"      	int NOT NULL,
	"denominacion"     	varchar(10) NULL,
	"descripcion"      	varchar(100) NULL,
	"cuidados"         	varchar(200) NULL,
	"tiempoRecomendado"	varchar(100) NULL,
	CONSTRAINT "PK_TipoAbeja_01" PRIMARY KEY NONCLUSTERED("idTipoAbeja")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoActividad" ( 
	"codTipoActividad"	char(5) NOT NULL,
	"denominacion"    	varchar(25) NULL,
	"descripcion"     	varchar(100) NULL,
	CONSTRAINT "PK_TipoActividad_01" PRIMARY KEY NONCLUSTERED("codTipoActividad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoAgroquimico" ( 
	"idTipoAgroquimico"	int NOT NULL,
	"denominacion"     	varchar(25) NULL,
	"descripcion"      	varchar(100) NULL,
	CONSTRAINT "PK_TipoAgroquimico_01" PRIMARY KEY NONCLUSTERED("idTipoAgroquimico")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoAlarma" ( 
	"idTipoAlarma"	int NULL,
	"denominacion"	varchar(25) NULL,
	"descripcion" 	varchar(100) NULL,
	"modoEnvio"   	varchar(25) NULL 
	)
GO
CREATE TABLE "TipoAlza" ( 
	"idTipoAlza"  	int NOT NULL,
	"denominacion"	varchar(25) NULL,
	"descripcion" 	varchar(100) NULL 
	)
GO
CREATE TABLE "TipoDato" ( 
	"idTipoDato" 	int NOT NULL,
	"descripcion"	varchar(25) NULL,
	CONSTRAINT "PK_TipoDato_01" PRIMARY KEY NONCLUSTERED("idTipoDato")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoFlora" ( 
	"idTipoFlora" 	int NOT NULL,
	"denominacion"	varchar(25) NULL,
	"descripcion" 	varchar(100) NULL,
	CONSTRAINT "PK_TipoFlora_01" PRIMARY KEY NONCLUSTERED("idTipoFlora")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoMiel" ( 
	"idTipoMiel"  	int NOT NULL,
	"denominacion"	varchar(5) NULL,
	"descripcion" 	varchar(100) NULL,
	CONSTRAINT "PK_TipoMiel_01" PRIMARY KEY NONCLUSTERED("idTipoMiel")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "TipoTarea" ( 
	"codTipoActividad"	char(5) NOT NULL,
	"codTipoTarea"    	char(5) NOT NULL,
	"denominacion"    	varchar(25) NULL,
	"descripcion"     	varchar(100) NULL,
	"usaActor"        	bit NULL,
	"usaGrupo"        	bit NULL,
	"usaCajon"        	bit NULL,
	"usaTratamiento"  	bit NULL,
	"usaEnfermedad"   	bit NULL,
	"usaSintoma"      	bit NULL,
	CONSTRAINT "PK_TipoTarea_01" PRIMARY KEY NONCLUSTERED("codTipoTarea","codTipoActividad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Tratamiento" ( 
	"idTratamiento"	int NOT NULL,
	"idEnfermedad" 	int NOT NULL,
	"denominacion" 	varchar(25) NULL,
	"descripcion"  	varchar(100) NULL,
	"costeo"       	money NULL,
	CONSTRAINT "PK_Tratamiento_01" PRIMARY KEY NONCLUSTERED("idTratamiento","idEnfermedad")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Ubicacion" ( 
	"idUbicacion"  	int NOT NULL,
	"latitud"      	decimal(15,5) NULL,
	"longitud"     	decimal(15,5) NULL,
	"observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_Ubicacion_01" PRIMARY KEY NONCLUSTERED("idUbicacion")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "UbicacionDeZona" ( 
	"idUbicacion"  	int NOT NULL,
	"idZona"       	int NOT NULL,
	"fecha"        	datetime NULL,
	"Observaciones"	varchar(500) NULL,
	CONSTRAINT "PK_UbicacionDeZona_01" PRIMARY KEY NONCLUSTERED("idUbicacion","idZona")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
CREATE TABLE "Zona" ( 
	"idZona"          	int NOT NULL,
	"zona"            	varchar(100) NULL,
	"estado"          	varchar(10) NULL,
	"fechaAlta"       	datetime NULL,
	"fechaBaja"       	datetime NULL,
	"usuarioAlta"     	varchar(10) NULL,
	"observaciones"   	varchar(500) NULL,
	"tieneAgroquimico"	bit NULL,
	"tieneFlora"      	bit NULL,
	"tieneClima"      	bit NULL,
	CONSTRAINT "PK_Zona_01" PRIMARY KEY NONCLUSTERED("idZona")
	WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
	)
GO
ALTER TABLE "Tarea"
	ADD CONSTRAINT "REL_Act_Tar"
	FOREIGN KEY("idActividad")
	REFERENCES "Actividad"("idActividad")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Marco"
	ADD CONSTRAINT "REL_Alza_Marco"
	FOREIGN KEY("numeroAlza", "numeroCajon")
	REFERENCES "Alza"("numeroAlza", "numeroCajon")
GO
ALTER TABLE "AsignacionColmena"
	ADD CONSTRAINT "REL_AsigCol_Apiar"
	FOREIGN KEY("idApiar")
	REFERENCES "Apiar"("idApiar")
GO
ALTER TABLE "Colmena"
	ADD CONSTRAINT "REL_Colmena_Cajon"
	FOREIGN KEY("numeroCajon")
	REFERENCES "Cajon"("numeroCajon")
GO
ALTER TABLE "Alza"
	ADD CONSTRAINT "REL_Cajon_Alza"
	FOREIGN KEY("numeroCajon")
	REFERENCES "Cajon"("numeroCajon")
GO
ALTER TABLE "Empleado"
	ADD CONSTRAINT "REL_Cargo_Emp"
	FOREIGN KEY("idCargo")
	REFERENCES "Cargo"("idCargo")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "HistorialEstadoColmena"
	ADD CONSTRAINT "REL_HistEstadoCol_Colmena"
	FOREIGN KEY("numeroColmena")
	REFERENCES "Colmena"("numeroColmena")
GO
ALTER TABLE "AsignacionColmena"
	ADD CONSTRAINT "REL_AsigCol_Colmena"
	FOREIGN KEY("numeroColmena")
	REFERENCES "Colmena"("numeroColmena")
GO
ALTER TABLE "Colmena"
	ADD CONSTRAINT "REL_Colmena_ColmenaOrig"
	FOREIGN KEY("idColmenaOriginal")
	REFERENCES "Colmena"("numeroColmena")
GO
ALTER TABLE "EnfermedadEnColmena"
	ADD CONSTRAINT "REL_EnfEnCol_Colmena"
	FOREIGN KEY("numeroColmena")
	REFERENCES "Colmena"("numeroColmena")
GO
ALTER TABLE "Enfermedad"
	ADD CONSTRAINT "REL_Enf_Crit"
	FOREIGN KEY("idCriticidad")
	REFERENCES "Criticidad"("idCriticidad")
GO
ALTER TABLE "RecoleccionDato"
	ADD CONSTRAINT "REL_DatoRecolec_RecolecDato"
	FOREIGN KEY("codTipoActividad", "codTipoTarea", "codDatoDeRecoleccion")
	REFERENCES "DatoDeRecoleccion"("codDatoDeRecoleccion", "codTipoTarea", "codTipoActividad")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Tarea"
	ADD CONSTRAINT "REL_Emp_Tar"
	FOREIGN KEY("legajoEmpleado")
	REFERENCES "Empleado"("legajo")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "EnfermedadEnColmena"
	ADD CONSTRAINT "REL_EnfEnCol_Enfermedad"
	FOREIGN KEY("idEnfermedad")
	REFERENCES "Enfermedad"("idEnfermedad")
GO
ALTER TABLE "Sintoma"
	ADD CONSTRAINT "REL_Enf_Sint"
	FOREIGN KEY("idEnfermedad")
	REFERENCES "Enfermedad"("idEnfermedad")
GO
ALTER TABLE "Tratamiento"
	ADD CONSTRAINT "REL_Enf_Trat"
	FOREIGN KEY("idEnfermedad")
	REFERENCES "Enfermedad"("idEnfermedad")
GO
ALTER TABLE "Familia"
	ADD CONSTRAINT "REL_Fam_Esp"
	FOREIGN KEY("idEspecie")
	REFERENCES "Especie"("idEspecie")
GO
ALTER TABLE "HistorialEstadoColmena"
	ADD CONSTRAINT "REL_HistEStadoCol_Estado"
	FOREIGN KEY("idEstadoColmena")
	REFERENCES "EstadoColmena"("idEstadocolmena")
GO
ALTER TABLE "HistorialEstadoFamilia"
	ADD CONSTRAINT "REL_HistEstFam_EstFam"
	FOREIGN KEY("idEstadoFamilia")
	REFERENCES "EstadoFamilia"("idEstadoFamilia")
GO
ALTER TABLE "Tarea"
	ADD CONSTRAINT "REL_EstTar_Tar"
	FOREIGN KEY("idEstadoTarea")
	REFERENCES "EstadoTarea"("idEstadoTarea")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "HistorialEstadoFamilia"
	ADD CONSTRAINT "REL_HistEstFam_Fam"
	FOREIGN KEY("numeroFamilia")
	REFERENCES "Familia"("numeroFamilia")
GO
ALTER TABLE "Colmena"
	ADD CONSTRAINT "REL_Colmena_Familia"
	FOREIGN KEY("numeroFamilia")
	REFERENCES "Familia"("numeroFamilia")
GO
ALTER TABLE "Apiar"
	ADD CONSTRAINT "REL_Col_Layout"
	FOREIGN KEY("idLayout")
	REFERENCES "Layout"("idLayout")
GO
ALTER TABLE "Familia"
	ADD CONSTRAINT "REL_Fam_MiembroFam"
	FOREIGN KEY("numeroFamilia")
	REFERENCES "MiembroFamilia"("numeroFamilia")
GO
ALTER TABLE "Alarma"
	ADD CONSTRAINT "REL_Period_Alarma"
	FOREIGN KEY("idPeriodicidad")
	REFERENCES "Periodicidad"("idPeriodicidad")
GO
ALTER TABLE "Layout"
	ADD CONSTRAINT "REL_Lay_Pos"
	FOREIGN KEY("idPosicion")
	REFERENCES "Posicion"("idPosicion")
GO
ALTER TABLE "Colmena"
	ADD CONSTRAINT "REL_Col_Pos"
	FOREIGN KEY("idPosicion")
	REFERENCES "Posicion"("idPosicion")
GO
ALTER TABLE "RecoleccionDato"
	ADD CONSTRAINT "REL_Tar_RecDato"
	FOREIGN KEY("idActividad", "idTarea")
	REFERENCES "Tarea"("idActividad", "idTarea")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "MiembroFamilia"
	ADD CONSTRAINT "REL_MiembroFam_TipoAbeja"
	FOREIGN KEY("idTipoAbeja")
	REFERENCES "TipoAbeja"("idTipoAbeja")
GO
ALTER TABLE "TipoTarea"
	ADD CONSTRAINT "REL_TpoAct_TpoTar"
	FOREIGN KEY("codTipoActividad")
	REFERENCES "TipoActividad"("codTipoActividad")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Actividad"
	ADD CONSTRAINT "REL_TpoAct_Act"
	FOREIGN KEY("codTipoActividad")
	REFERENCES "TipoActividad"("codTipoActividad")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Agroquimico"
	ADD CONSTRAINT "REL_TipoAgro_Agro"
	FOREIGN KEY("idTipoAgroquimico")
	REFERENCES "TipoAgroquimico"("idTipoAgroquimico")
GO
ALTER TABLE "Alarma"
	ADD CONSTRAINT "REL_TpoAlar_Alarma"
	FOREIGN KEY("tipoAlarma")
	REFERENCES "TipoAlarma"("idTipoAlarma")
GO
ALTER TABLE "Alza"
	ADD CONSTRAINT "REL_Alza_TipoAlza"
	FOREIGN KEY("idTipoAlza")
	REFERENCES "TipoAlza"("idTipoAlza")
GO
ALTER TABLE "DatoDeRecoleccion"
	ADD CONSTRAINT "REL_TpoDat_DatDeRec"
	FOREIGN KEY("idTipoDato")
	REFERENCES "TipoDato"("idTipoDato")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Flora"
	ADD CONSTRAINT "REL_TpoFlora_Flora"
	FOREIGN KEY("idTipoFlora")
	REFERENCES "TipoFlora"("idTipoFlora")
GO
ALTER TABLE "Colmena"
	ADD CONSTRAINT "REL_Colmena_TipoMiel"
	FOREIGN KEY("idTipoMiel")
	REFERENCES "TipoMiel"("idTipoMiel")
GO
ALTER TABLE "DatoDeRecoleccion"
	ADD CONSTRAINT "REL_TpoTar_DatDeRec"
	FOREIGN KEY("codTipoTarea", "codTipoActividad")
	REFERENCES "TipoTarea"("codTipoTarea", "codTipoActividad")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Tarea"
	ADD CONSTRAINT "REL_TpoTar_Tar"
	FOREIGN KEY("codTipoActividad", "codTipoTarea")
	REFERENCES "TipoTarea"("codTipoActividad", "codTipoTarea")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "Apiar"
	ADD CONSTRAINT "REL_Apiar_Ubic"
	FOREIGN KEY("idUbicacion")
	REFERENCES "Ubicacion"("idUbicacion")
GO
ALTER TABLE "UbicacionDeZona"
	ADD CONSTRAINT "REL_Ubic_UbicDeZona"
	FOREIGN KEY("idUbicacion")
	REFERENCES "Ubicacion"("idUbicacion")
GO
ALTER TABLE "UbicacionDeZona"
	ADD CONSTRAINT "REL_UbicDeZona_Zona"
	FOREIGN KEY("idZona")
	REFERENCES "Zona"("idZona")
GO
ALTER TABLE "Agroquimico"
	ADD CONSTRAINT "REL_Zona_Agro"
	FOREIGN KEY("idZona")
	REFERENCES "Zona"("idZona")
GO
ALTER TABLE "Flora"
	ADD CONSTRAINT "REL_Zona_Flora"
	FOREIGN KEY("idZona")
	REFERENCES "Zona"("idZona")
GO
ALTER TABLE "Clima"
	ADD CONSTRAINT "REL_Zona_Clima"
	FOREIGN KEY("idZona")
	REFERENCES "Zona"("idZona")
GO
ALTER TABLE "Alarma"
	ADD CONSTRAINT "REL_Zona_Alarma"
	FOREIGN KEY("idZona")
	REFERENCES "Zona"("idZona")
GO
