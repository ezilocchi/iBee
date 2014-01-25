
CREATE TABLE Actividad (
	idActividad     	int(15) NOT NULL,
	codTipoActividad	char(5) NOT NULL,
	denominacion    	varchar(25) NULL,
	descripcion     	varchar(100) NULL,
	fechaCreacion   	datetime NULL,
	fechaInicio     	datetime NULL,
	fechaFin        	datetime NULL,
	estado          	varchar(10) NULL,
	observaciones   	varchar(500) NULL,
	idApiar         	int(15) NULL,
	PRIMARY KEY(idActividad)
)
;
CREATE TABLE Agroquimico ( 
	idAgroquimico    	int(15) NOT NULL,
	idZona           	int(15) NOT NULL,
	idTipoAgroquimico	int(15) NOT NULL,
	denominacion     	varchar(25) NULL,
	descripcion      	varchar(100) NULL,
	observaciones    	varchar(500) NULL,
	PRIMARY KEY(idAgroquimico,idZona)
);
GO
CREATE TABLE Alarma ( 
	idAlarma      	int(15) NOT NULL,
	idZona        	int(15) NOT NULL,
	denominacion  	varchar(25) NULL,
	descripcion   	varchar(100) NULL,
	origen        	varchar(10) NULL,
	fechaCreacion 	datetime NULL,
	fechaInicio   	datetime NULL,
	fechaFin      	datetime NULL,
	idPeriodicidad	int(15) NULL,
	tipoAlarma    	int(15) NULL,
	PRIMARY KEY(idAlarma,idZona)
)
GO
CREATE TABLE Alza ( 
	numeroAlza   	int(15) NOT NULL,
	numeroCajon  	int(15) NOT NULL,
	descripcion  	varchar(100) NULL,
	estado       	varchar(10) NULL,
	tama?o       	varchar(25) NULL,
	observaciones	varchar(500) NULL,
	idTipoAlza   	int(15) NULL,
	PRIMARY KEY(numeroAlza,numeroCajon)
)
GO
CREATE TABLE Apiar ( 
	idApiar      	int(15) NOT NULL,
	denominacion 	varchar(100) NULL,
	fechaCreacion	datetime NULL,
	fechaAlta    	datetime NULL,
	fechaBaja    	datetime NULL,
	estado       	varchar(10) NULL,
	idLayout     	int(15) NULL,
	idUbicacion  	int(15) NULL,
	idZona       	int(15) NULL,
	PRIMARY KEY(idApiar)
)
GO
CREATE TABLE AsignacionColmena ( 
	idApiar      	int(15) NOT NULL,
	numeroColmena	int(15) NOT NULL,
	fechaDesde   	datetime NULL,
	fechaHasta   	datetime NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(idApiar,numeroColmena)
)
GO
CREATE TABLE Cajon ( 
	numeroCajon       	int(15) NOT NULL,
	descripcion       	varchar(100) NULL,
	estado            	varchar(10) NULL,
	tama?o            	varchar(25) NULL,
	usuarioFabricacion	varchar(25) NULL,
	fechafabricacion  	datetime NULL,
	observaciones     	varchar(500) NULL,
	PRIMARY KEY(numeroCajon)
)
GO
CREATE TABLE Cargo ( 
	idCargo     	int(15) NOT NULL,
	denominacion	varchar(25) NULL,
	descripcion 	varchar(100) NULL,
	PRIMARY KEY(idCargo)
)
GO
CREATE TABLE Clima ( 
	idFlora    	int(15) NOT NULL,
	idZona     	int(15) NOT NULL,
	fecha      	datetime NULL,
	itemDeClima	varchar(25) NULL,
	temperatura	decimal(15,5) NULL,
	humedad    	decimal(15,5) NULL,
	indiceUV   	decimal(15,5) NULL,
	vientos    	decimal(15,5) NULL,
	luna       	decimal(15,5) NULL,
	PRIMARY KEY(idFlora,idZona)
)
GO
CREATE TABLE Colmena ( 
	numeroColmena    	int(15) NOT NULL,
	denominacion     	varchar(100) NULL,
	fechaAlta        	datetime NULL,
	fechaBaja        	datetime NULL,
	numeroFamilia    	int(15) NULL,
	idColmenaOriginal	int(15) NULL,
	idTipoMiel       	int(15) NULL,
	numeroCajon      	int(15) NULL,
	idPosicion       	int(15) NULL,
	PRIMARY KEY(numeroColmena)
)
GO
CREATE TABLE Criticidad ( 
	idCriticidad	int(15) NOT NULL,
	denominacion	varchar(25) NULL,
	descripcion 	varchar(100) NULL,
	PRIMARY KEY(idCriticidad)
)
GO
CREATE TABLE DatoDeRecoleccion ( 
	codDatoDeRecoleccion	char(5) NOT NULL,
	codTipoTarea        	char(5) NOT NULL,
	codTipoActividad    	char(5) NOT NULL,
	nombreDato          	varchar(100) NULL,
	idTipoDato          	int(15) NULL,
	valoresPermitidos   	varchar(250) NULL,
	extension           	varchar(25) NULL,
	PRIMARY KEY(codTipoActividad,codTipoTarea,codDatoDeRecoleccion)
)
GO
CREATE TABLE Empleado ( 
	legajo       	int(15) NOT NULL,
	nombre       	varchar(50) NULL,
	apellido     	varchar(50) NULL,
	estado       	varchar(10) NULL,
	idCargo      	int(15) NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(legajo)
)
GO
CREATE TABLE Enfermedad ( 
	idEnfermedad      	int(15) NOT NULL,
	denominacion      	varchar(25) NULL,
	descripcion       	varchar(100) NULL,
	duracionAproximada	varchar(25) NULL,
	observaciones     	varchar(500) NULL,
	idCriticidad      	int(15) NULL,
	PRIMARY KEY(idEnfermedad)
)
GO
CREATE TABLE EnfermedadEnColmena ( 
	numeroColmena	int(15) NOT NULL,
	idEnfermedad 	int(15) NOT NULL,
	fechaDesde   	datetime NULL,
	fechaHasta   	datetime NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(numeroColmena,idEnfermedad)
)
GO
CREATE TABLE Especie ( 
	idEspecie   	int(15) NOT NULL,
	denominacion	varchar(10) NULL,
	descripcion 	varchar(100) NULL,
	PRIMARY KEY(idEspecie)
)
GO
CREATE TABLE EstadoColmena ( 
	idEstadocolmena	int(15) NOT NULL,
	denominacion   	varchar(10) NULL,
	descripcion    	varchar(100) NULL,
	PRIMARY KEY(idEstadocolmena)
)
GO
CREATE TABLE EstadoFamilia ( 
	idEstadoFamilia	int(15) NOT NULL,
	denominacion   	varchar(10) NULL,
	descripcion    	varchar(100) NULL,
	PRIMARY KEY(idEstadoFamilia)
)
GO
CREATE TABLE EstadoTarea ( 
	idEstadoTarea	int(15) NOT NULL,
	descripcion  	varchar(25) NULL,
	PRIMARY KEY(idEstadoTarea)
)
GO
CREATE TABLE Familia ( 
	numeroFamilia  	int(15) NOT NULL,
	caracteristicas	varchar(200) NULL,
	fechaAlta      	datetime NULL,
	idEspecie      	int(15) NULL,
	observaciones  	varchar(500) NULL,
	PRIMARY KEY(numeroFamilia)
)
GO
CREATE TABLE Flora ( 
	idFlora      	int(15) NOT NULL,
	idZona       	int(15) NOT NULL,
	idTipoFlora  	int(15) NOT NULL,
	denominacion 	varchar(25) NULL,
	descripcion  	varchar(100) NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(idFlora,idZona)
)
GO
CREATE TABLE HistorialEstadoColmena ( 
	idEstadoColmena	int(15) NOT NULL,
	numeroColmena  	int(15) NOT NULL,
	fecha          	datetime NULL,
	observaciones  	varchar(25) NULL,
	PRIMARY KEY(idEstadoColmena,numeroColmena)
)
GO
CREATE TABLE HistorialEstadoFamilia ( 
	numeroFamilia  	int(15) NOT NULL,
	idEstadoFamilia	int(15) NOT NULL,
	fecha          	datetime NULL,
	observaciones  	varchar(200) NULL,
	PRIMARY KEY(numeroFamilia,idEstadoFamilia)
)
GO
CREATE TABLE Layout ( 
	idLayout     	int(15) NOT NULL,
	denominacion 	varchar(100) NULL,
	dise?o       	varchar(10) NULL,
	ventaja      	varchar(150) NULL,
	observaciones	varchar(500) NULL,
	fechaCreacion	datetime NULL,
	idPosicion   	int(15) NULL,
	PRIMARY KEY(idLayout)
)
GO
CREATE TABLE Marco ( 
	numeroMarco  	int(15) NOT NULL,
	numeroAlza   	int(15) NOT NULL,
	numeroCajon  	int(15) NOT NULL,
	descripcion  	varchar(100) NULL,
	tama?o       	varchar(25) NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(numeroMarco,numeroAlza,numeroCajon)
)
GO
CREATE TABLE MiembroFamilia ( 
	idMiembroFamilia	int(15) NOT NULL,
	numeroFamilia   	int(15) NOT NULL,
	denominacion    	varchar(100) NULL,
	fechaNac        	datetime NULL,
	fechaAlta       	datetime NULL,
	fechaBaja       	datetime NULL,
	idTipoAbeja     	int(15) NULL,
	PRIMARY KEY(idMiembroFamilia,numeroFamilia)
)
GO
CREATE TABLE Periodicidad ( 
	idPeriodicidad	int(15) NULL,
	periodicidad  	varchar(25) NULL 
	)
GO
CREATE TABLE Posicion ( 
	idPosicion   	int(15) NOT NULL,
	posHorizontal	varchar(25) NULL,
	posVertical  	varchar(25) NULL,
	PRIMARY KEY(idPosicion)
)
GO
CREATE TABLE RecoleccionDato ( 
	idActividad         	int(15) NOT NULL,
	idTarea             	int(15) NOT NULL,
	idRecoleccionDato   	int(15) NOT NULL,
	codTipoActividad    	char(5) NOT NULL,
	codTipoTarea        	char(5) NOT NULL,
	codDatoDeRecoleccion	char(5) NOT NULL,
	valor               	varchar(250) NULL 
	)
GO
CREATE TABLE Sintoma ( 
	idSintoma    	int(15) NOT NULL,
	idEnfermedad 	int(15) NOT NULL,
	denominacion 	varchar(25) NULL,
	descripcion  	varchar(100) NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(idSintoma,idEnfermedad)
)
GO
CREATE TABLE Tarea ( 
	idActividad     	int(15) NOT NULL,
	idTarea         	int(15) NOT NULL,
	codTipoActividad	char(5) NOT NULL,
	codTipoTarea    	char(5) NOT NULL,
	descripcion     	varchar(25) NULL,
	idEstadoTarea   	int(15) NULL,
	fechaRealizacion	datetime NULL,
	fechaPrevista   	datetime NULL,
	observaciones   	datetime NULL,
	legajoEmpleado  	int(15) NULL,
	idColmena       	int(15) NULL,
	idResidente     	int(15) NULL,
	idFamilia       	int(15) NULL,
	idCajon         	int(15) NULL,
	idSintoma       	int(15) NULL,
	idTratamiento   	int(15) NULL,
	idEnfermedad    	int(15) NULL,
	PRIMARY KEY(idActividad,idTarea)
)
GO
CREATE TABLE TipoAbeja ( 
	idTipoAbeja      	int(15) NOT NULL,
	denominacion     	varchar(10) NULL,
	descripcion      	varchar(100) NULL,
	cuidados         	varchar(200) NULL,
	tiempoRecomendado	varchar(100) NULL,
	PRIMARY KEY(idTipoAbeja)
)
GO
CREATE TABLE TipoActividad ( 
	codTipoActividad	char(5) NOT NULL,
	denominacion    	varchar(25) NULL,
	descripcion     	varchar(100) NULL,
	PRIMARY KEY(codTipoActividad)
)
GO
CREATE TABLE TipoAgroquimico ( 
	idTipoAgroquimico	int(15) NOT NULL,
	denominacion     	varchar(25) NULL,
	descripcion      	varchar(100) NULL,
	PRIMARY KEY(idTipoAgroquimico)
)
GO
CREATE TABLE TipoAlarma ( 
	idTipoAlarma	int(15) NULL,
	denominacion	varchar(25) NULL,
	descripcion 	varchar(100) NULL,
	modoEnvio   	varchar(25) NULL 
	)
GO
CREATE TABLE TipoAlza ( 
	idTipoAlza  	int(15) NOT NULL,
	denominacion	varchar(25) NULL,
	descripcion 	varchar(100) NULL 
	)
GO
CREATE TABLE TipoDato ( 
	idTipoDato 	int(15) NOT NULL,
	descripcion	varchar(25) NULL,
	PRIMARY KEY(idTipoDato)
)
GO
CREATE TABLE TipoFlora ( 
	idTipoFlora 	int(15) NOT NULL,
	denominacion	varchar(25) NULL,
	descripcion 	varchar(100) NULL,
	PRIMARY KEY(idTipoFlora)
)
GO
CREATE TABLE TipoMiel ( 
	idTipoMiel  	int(15) NOT NULL,
	denominacion	varchar(5) NULL,
	descripcion 	varchar(100) NULL,
	PRIMARY KEY(idTipoMiel)
)
GO
CREATE TABLE TipoTarea ( 
	codTipoActividad	char(5) NOT NULL,
	codTipoTarea    	char(5) NOT NULL,
	denominacion    	varchar(25) NULL,
	descripcion     	varchar(100) NULL,
	usaActor        	bit(15) NULL,
	usaGrupo        	bit(15) NULL,
	usaCajon        	bit(15) NULL,
	usaTratamiento  	bit(15) NULL,
	usaEnfermedad   	bit(15) NULL,
	usaSintoma      	bit(15) NULL,
	PRIMARY KEY(codTipoTarea,codTipoActividad)
)
GO
CREATE TABLE Tratamiento ( 
	idTratamiento	int(15) NOT NULL,
	idEnfermedad 	int(15) NOT NULL,
	denominacion 	varchar(25) NULL,
	descripcion  	varchar(100) NULL,
	costeo       	money NULL,
	PRIMARY KEY(idTratamiento,idEnfermedad)
)
GO
CREATE TABLE Ubicacion ( 
	idUbicacion  	int(15) NOT NULL,
	latitud      	decimal(15,5) NULL,
	longitud     	decimal(15,5) NULL,
	observaciones	varchar(500) NULL,
	PRIMARY KEY(idUbicacion)
)
GO
CREATE TABLE UbicacionDeZona ( 
	idUbicacion  	int(15) NOT NULL,
	idZona       	int(15) NOT NULL,
	fecha        	datetime NULL,
	Observaciones	varchar(500) NULL,
	PRIMARY KEY(idUbicacion,idZona)
)
GO
CREATE TABLE Zona ( 
	idZona          	int(15) NOT NULL,
	zona            	varchar(100) NULL,
	estado          	varchar(10) NULL,
	fechaAlta       	datetime NULL,
	fechaBaja       	datetime NULL,
	usuarioAlta     	varchar(10) NULL,
	observaciones   	varchar(500) NULL,
	tieneAgroquimico	bit(15) NULL,
	tieneFlora      	bit(15) NULL,
	tieneClima      	bit(15) NULL,
	PRIMARY KEY(idZona)
)
GO
ALTER TABLE Tarea
	ADD CONSTRAINT REL_Act_Tar
	FOREIGN KEY(idActividad)
	REFERENCES Actividad(idActividad)
GO
ALTER TABLE Marco
	ADD CONSTRAINT REL_Alza_Marco
	FOREIGN KEY(numeroAlza, numeroCajon)
	REFERENCES Alza(numeroAlza, numeroCajon)
GO
ALTER TABLE AsignacionColmena
	ADD CONSTRAINT REL_AsigCol_Apiar
	FOREIGN KEY(idApiar)
	REFERENCES Apiar(idApiar)
GO
ALTER TABLE Colmena
	ADD CONSTRAINT REL_Colmena_Cajon
	FOREIGN KEY(numeroCajon)
	REFERENCES Cajon(numeroCajon)
GO
ALTER TABLE Alza
	ADD CONSTRAINT REL_Cajon_Alza
	FOREIGN KEY(numeroCajon)
	REFERENCES Cajon(numeroCajon)
GO
ALTER TABLE Empleado
	ADD CONSTRAINT REL_Cargo_Emp
	FOREIGN KEY(idCargo)
	REFERENCES Cargo(idCargo)
GO
ALTER TABLE HistorialEstadoColmena
	ADD CONSTRAINT REL_HistEstadoCol_Colmena
	FOREIGN KEY(numeroColmena)
	REFERENCES Colmena(numeroColmena)
GO
ALTER TABLE AsignacionColmena
	ADD CONSTRAINT REL_AsigCol_Colmena
	FOREIGN KEY(numeroColmena)
	REFERENCES Colmena(numeroColmena)
GO
ALTER TABLE Colmena
	ADD CONSTRAINT REL_Colmena_ColmenaOrig
	FOREIGN KEY(idColmenaOriginal)
	REFERENCES Colmena(numeroColmena)
GO
ALTER TABLE EnfermedadEnColmena
	ADD CONSTRAINT REL_EnfEnCol_Colmena
	FOREIGN KEY(numeroColmena)
	REFERENCES Colmena(numeroColmena)
GO
ALTER TABLE Enfermedad
	ADD CONSTRAINT REL_Enf_Crit
	FOREIGN KEY(idCriticidad)
	REFERENCES Criticidad(idCriticidad)
GO
ALTER TABLE RecoleccionDato
	ADD CONSTRAINT REL_DatoRecolec_RecolecDato
	FOREIGN KEY(codTipoActividad, codTipoTarea, codDatoDeRecoleccion)
	REFERENCES DatoDeRecoleccion(codDatoDeRecoleccion, codTipoTarea, codTipoActividad)
GO
ALTER TABLE Tarea
	ADD CONSTRAINT REL_Emp_Tar
	FOREIGN KEY(legajoEmpleado)
	REFERENCES Empleado(legajo)
GO
ALTER TABLE EnfermedadEnColmena
	ADD CONSTRAINT REL_EnfEnCol_Enfermedad
	FOREIGN KEY(idEnfermedad)
	REFERENCES Enfermedad(idEnfermedad)
GO
ALTER TABLE Sintoma
	ADD CONSTRAINT REL_Enf_Sint
	FOREIGN KEY(idEnfermedad)
	REFERENCES Enfermedad(idEnfermedad)
GO
ALTER TABLE Tratamiento
	ADD CONSTRAINT REL_Enf_Trat
	FOREIGN KEY(idEnfermedad)
	REFERENCES Enfermedad(idEnfermedad)
GO
ALTER TABLE Familia
	ADD CONSTRAINT REL_Fam_Esp
	FOREIGN KEY(idEspecie)
	REFERENCES Especie(idEspecie)
GO
ALTER TABLE HistorialEstadoColmena
	ADD CONSTRAINT REL_HistEStadoCol_Estado
	FOREIGN KEY(idEstadoColmena)
	REFERENCES EstadoColmena(idEstadocolmena)
GO
ALTER TABLE HistorialEstadoFamilia
	ADD CONSTRAINT REL_HistEstFam_EstFam
	FOREIGN KEY(idEstadoFamilia)
	REFERENCES EstadoFamilia(idEstadoFamilia)
GO
ALTER TABLE Tarea
	ADD CONSTRAINT REL_EstTar_Tar
	FOREIGN KEY(idEstadoTarea)
	REFERENCES EstadoTarea(idEstadoTarea)
GO
ALTER TABLE HistorialEstadoFamilia
	ADD CONSTRAINT REL_HistEstFam_Fam
	FOREIGN KEY(numeroFamilia)
	REFERENCES Familia(numeroFamilia)
GO
ALTER TABLE Colmena
	ADD CONSTRAINT REL_Colmena_Familia
	FOREIGN KEY(numeroFamilia)
	REFERENCES Familia(numeroFamilia)
GO
ALTER TABLE Apiar
	ADD CONSTRAINT REL_Col_Layout
	FOREIGN KEY(idLayout)
	REFERENCES Layout(idLayout)
GO
ALTER TABLE Familia
	ADD CONSTRAINT REL_Fam_MiembroFam
	FOREIGN KEY(numeroFamilia)
	REFERENCES MiembroFamilia(numeroFamilia)
GO
ALTER TABLE Alarma
	ADD CONSTRAINT REL_Period_Alarma
	FOREIGN KEY(idPeriodicidad)
	REFERENCES Periodicidad(idPeriodicidad)
GO
ALTER TABLE Layout
	ADD CONSTRAINT REL_Lay_Pos
	FOREIGN KEY(idPosicion)
	REFERENCES Posicion(idPosicion)
GO
ALTER TABLE Colmena
	ADD CONSTRAINT REL_Col_Pos
	FOREIGN KEY(idPosicion)
	REFERENCES Posicion(idPosicion)
GO
ALTER TABLE RecoleccionDato
	ADD CONSTRAINT REL_Tar_RecDato
	FOREIGN KEY(idActividad, idTarea)
	REFERENCES Tarea(idActividad, idTarea)
GO
ALTER TABLE MiembroFamilia
	ADD CONSTRAINT REL_MiembroFam_TipoAbeja
	FOREIGN KEY(idTipoAbeja)
	REFERENCES TipoAbeja(idTipoAbeja)
GO
ALTER TABLE TipoTarea
	ADD CONSTRAINT REL_TpoAct_TpoTar
	FOREIGN KEY(codTipoActividad)
	REFERENCES TipoActividad(codTipoActividad)
GO
ALTER TABLE Actividad
	ADD CONSTRAINT REL_TpoAct_Act
	FOREIGN KEY(codTipoActividad)
	REFERENCES TipoActividad(codTipoActividad)
GO
ALTER TABLE Agroquimico
	ADD CONSTRAINT REL_TipoAgro_Agro
	FOREIGN KEY(idTipoAgroquimico)
	REFERENCES TipoAgroquimico(idTipoAgroquimico)
GO
ALTER TABLE Alarma
	ADD CONSTRAINT REL_TpoAlar_Alarma
	FOREIGN KEY(tipoAlarma)
	REFERENCES TipoAlarma(idTipoAlarma)
GO
ALTER TABLE Alza
	ADD CONSTRAINT REL_Alza_TipoAlza
	FOREIGN KEY(idTipoAlza)
	REFERENCES TipoAlza(idTipoAlza)
GO
ALTER TABLE DatoDeRecoleccion
	ADD CONSTRAINT REL_TpoDat_DatDeRec
	FOREIGN KEY(idTipoDato)
	REFERENCES TipoDato(idTipoDato)
GO
ALTER TABLE Flora
	ADD CONSTRAINT REL_TpoFlora_Flora
	FOREIGN KEY(idTipoFlora)
	REFERENCES TipoFlora(idTipoFlora)
GO
ALTER TABLE Colmena
	ADD CONSTRAINT REL_Colmena_TipoMiel
	FOREIGN KEY(idTipoMiel)
	REFERENCES TipoMiel(idTipoMiel)
GO
ALTER TABLE DatoDeRecoleccion
	ADD CONSTRAINT REL_TpoTar_DatDeRec
	FOREIGN KEY(codTipoTarea, codTipoActividad)
	REFERENCES TipoTarea(codTipoTarea, codTipoActividad)
GO
ALTER TABLE Tarea
	ADD CONSTRAINT REL_TpoTar_Tar
	FOREIGN KEY(codTipoActividad, codTipoTarea)
	REFERENCES TipoTarea(codTipoActividad, codTipoTarea)
GO
ALTER TABLE Apiar
	ADD CONSTRAINT REL_Apiar_Ubic
	FOREIGN KEY(idUbicacion)
	REFERENCES Ubicacion(idUbicacion)
GO
ALTER TABLE UbicacionDeZona
	ADD CONSTRAINT REL_Ubic_UbicDeZona
	FOREIGN KEY(idUbicacion)
	REFERENCES Ubicacion(idUbicacion)
GO
ALTER TABLE UbicacionDeZona
	ADD CONSTRAINT REL_UbicDeZona_Zona
	FOREIGN KEY(idZona)
	REFERENCES Zona(idZona)
GO
ALTER TABLE Agroquimico
	ADD CONSTRAINT REL_Zona_Agro
	FOREIGN KEY(idZona)
	REFERENCES Zona(idZona)
GO
ALTER TABLE Flora
	ADD CONSTRAINT REL_Zona_Flora
	FOREIGN KEY(idZona)
	REFERENCES Zona(idZona)
GO
ALTER TABLE Clima
	ADD CONSTRAINT REL_Zona_Clima
	FOREIGN KEY(idZona)
	REFERENCES Zona(idZona)
GO
ALTER TABLE Alarma
	ADD CONSTRAINT REL_Zona_Alarma
	FOREIGN KEY(idZona)
	REFERENCES Zona(idZona)
GO