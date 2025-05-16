// Funciones
//Funcion del menu principal
SubProceso  menu_principal(opcion Por Referencia,total_eventos,total_personas)
Escribir "Que va a realizar?"
Escribir "1.Agregar evento"
Si total_eventos>0 Entonces
	Escribir "2. Registrar asistencia"
SiNo
	Escribir "2.No disponible ya que no hay eventos"
FinSi
Si total_eventos>0 O total_personas>0 Entonces
	Escribir "3. Ver registros"
SiNo
	Escribir "3.No disponible ya que no hay registros"
FinSi
Escribir "4.Salir (enter en blanco para terminar)"
Leer opcion
FinSubProceso

//Funcion de registro de evento
Función Registro_evento(evento,total_eventos Por Referencia,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti,Cupo_personas)
// Registro de eventos
Para i<-total_eventos+1 Hasta total_eventos+evento Hacer
		Escribir "Institución educativa"
		Leer Nombre_Insti[i]
		Escribir "Nombre del Evento"
		Leer Nombre_Ev[i]
		Escribir "Descripcion del evento"
		Leer Descripcion_Ev[i]
		Escribir "¿Cuantas personas vendran al evento?"
		Leer Cupo_personas[i]
		Escribir "Fecha de inicio"
		Leer Fecha_Ini[i]
		Escribir "Fecha final"
		Leer Fecha_Fin[i]
FinPara
total_eventos <- total_eventos+evento
Escribir "Total de eventos registrados hasta ahora: ", total_eventos
FinFunción

//Funcion de registro de las personas
Función Registro_personas(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,Numero_personas,Nombre_Ev,total_eventos,total_personas Por Referencia,Asistentes_Evento Por Referencia,Cupo_personas)
Para j<-total_personas+1 Hasta total_personas+Numero_personas Hacer
	Escribir "Ingrese nombre completo"
	Leer Nombre_persona[j]
	Escribir "Tipo de documento (CC:Cedula de Ciudadania TI:Targeta de Identidad CE:Cedula de Extrangeria"
	Leer Tipo_documento[j]
	Repetir
		Escribir "Ingrese numero de cedula (máximo 10 dígitos)"
		Leer Numero_ID[j]
		Si Longitud(ConvertirATexto(Numero_ID[j]))>10 Entonces
			Escribir "ERROR: El número debe tener máximo 10 dígitos. Intente nuevamente."
		FinSi
	Hasta Que Longitud(ConvertirATexto(Numero_ID[j]))<=10
	
	Escribir "Eventos disponibles"
	Para e<-1 Hasta total_eventos Hacer
		Escribir "Evento ", e, ": ", Nombre_Ev[e]
	FinPara
	Repetir
		Escribir "Ingrese el numero del evento al que va a ingresar (Entre 1 y ", total_eventos, "):"
		Leer Evento_pertenece[j]
		Si Evento_pertenece[j]<1 O Evento_pertenece[j]>total_eventos Entonces
			Escribir "El numero de evento ingresado no corresponde a ninguno. Intente nuevamente"
		SiNo
			Si Asistentes_Evento[Evento_pertenece[j]] >= Cupo_personas[Evento_pertenece[j]] Entonces
				Escribir "¡Este evento ya no tiene cupos disponibles!"
				Evento_pertenece[j] <- 0
			FinSi
		FinSi
	Hasta Que Evento_pertenece[j]>=1 Y Evento_pertenece[j]<=total_eventos
	Asistentes_Evento[Evento_pertenece[j]] <- Asistentes_Evento[Evento_pertenece[j]]+1
FinPara
total_personas <- total_personas+Numero_personas
Escribir "Total de personas registradas hasta ahora: ", total_personas
FinFunción

//Funcion que muestra el listado final de los eventos registrados
Función Lista_finalE(total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti)
Si total_eventos>0 Entonces
	Para i<-1 Hasta total_eventos Hacer
		Escribir "Evento ", i, ": "
		Escribir "Institucón: ", Nombre_Insti[i]
		Escribir "Nombre del evento: ", Nombre_Ev[i]
		Escribir "Descripcion del evento: ", Descripcion_Ev[i]
		Escribir "Fecha de inicio: ", Fecha_Ini[i]
		Escribir "Fecha final: ", Fecha_Fin[i]
		Escribir ""
	FinPara
SiNo
	Escribir "No hay eventos registrados"
FinSi
FinFunción

//Funcion que muestra las personas que realizaron asistencia con el evento al que van
Función Lista_finalR(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,total_personas,Nombre_Ev)
Si total_personas>0 Entonces
	Para j<-1 Hasta total_personas Hacer
		Escribir "ID ", j, ": "
		Escribir "Nombre completo: ", Nombre_persona[j]
		Escribir "Tipo de documento: ", Tipo_documento[j]
		Escribir "Numero de identificación: ", Numero_ID[j]
		Escribir "Evento al que va a ingresar: ", Nombre_Ev[Evento_pertenece[j]]
		Escribir ""
	FinPara
SiNo
	Escribir "No hay personas registradas"
FinSi
FinFunción

//Función el cual muestra el evento en concreto que se quiere ver
Función Mostrar_evento_individual(numero_evento,total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti,Cupo_personas,Asistentes_Evento)
Si numero_evento>=1 Y numero_evento<=total_eventos Entonces
	Escribir "Evento ", numero_evento
	Escribir "Institucón: ", Nombre_Insti[numero_evento]
	Escribir "Nombre del evento: ", Nombre_Ev[numero_evento]
	Escribir "Descripcion del evento: ", Descripcion_Ev[numero_evento]
	Escribir "Fecha de inicio: ", Fecha_Ini[numero_evento]
	Escribir "Fecha final: ", Fecha_Fin[numero_evento]
	Escribir "Cupo total: ", Cupo_personas[numero_evento]
	Escribir "Personas que asistieron: ", Asistentes_Evento[numero_evento]
	Escribir "Personas que faltaron: ", Cupo_personas[numero_evento]-Asistentes_Evento[numero_evento]
	Escribir ""
SiNo
	Escribir "El numero de evento ingresado no es valido"
FinSi
FinFunción

//Funcion que muestra la asistencia en concreto de una persona que se quiera ver
Función Mostrar_persona_individual(ID_persona,total_personas,Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,Nombre_Ev)
Si ID_persona>=1 Y ID_persona<=total_personas Entonces
	Escribir "ID ", ID_persona
	Escribir "Nombre completo: ", Nombre_persona[ID_persona]
	Escribir "Tipo de documento: ", Tipo_documento[ID_persona]
	Escribir "Numero de identificación: ", Numero_ID[ID_persona]
	Escribir "Evento al que va a ingresar: ", Nombre_Ev[Evento_pertenece[ID_persona]]
	Escribir ""
SiNo
	Escribir "El ID de la persona ingresado no es valido"
FinSi
FinFunción

//Inicio del algoritmo y definicón de variables
Algoritmo Registro
	// Declaración de variables
	Definir Numero_CC, evento, i, j, opcion_registros, opcion_volver, Numero_ID, Evento_pertenece, opcion_seguir, numero_evento, ID_persona, opcion_buscar Como Entero
	Definir Nombre_U, Nombre_persona, opcion Como Cadena
	Definir total_eventos, total_personas, Numero_personas Como Entero
	total_eventos <- 0
	total_personas <- 0
	Dimensionar Asistentes_Evento(10000)
	Para i<-1 Hasta 10000 Hacer
		Asistentes_Evento[i] <- 0
	FinPara
	Dimension Nombre_Insti(10000)
	Dimension Nombre_Ev(10000)
	Dimension Descripcion_Ev(10000)
	Dimension Fecha_Ini(10000)
	Dimension Fecha_Fin(10000)
	Dimension Nombre_persona(10000)
	Dimension Tipo_documento(10000)
	Dimension Numero_ID(10000)
	Dimension Evento_pertenece(10000)
	Dimension Cupo_personas(10000)
	
	// Se llama el menu principal
	menu_principal(opcion,total_eventos,total_personas)
	
	// Agregar evento
	
	Mientras opcion <> "4" Hacer
		Si opcion="1" Entonces
			Escribir "Cuantos eventos va a ingresar"
			Leer evento
			Si evento<=0 Entonces
				Escribir "Debe registrar al menos 1 evento"
			SiNo
				Registro_evento(evento,total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti,Cupo_personas)
			Fin si
			Si evento>0 Entonces
				Escribir "¿Que desear hacer?"
				Escribir "1.Eventos registrados"
				Escribir "2. Seguir registrando"
				Escribir "3. Volver al menu principal"
				Leer opcion_registros
				Si opcion_registros=1 Entonces
					Lista_finalE(total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti)
					menu_principal(opcion,total_eventos,total_personas)
				SiNo
					Si opcion_registros=2 Entonces
						Escribir "¿Cuántos eventos desea volver a registrar?"
						Leer evento
						Si evento>0 Entonces
							Registro_evento(evento,total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti,Cupo_personas)
							Escribir "Registros guardados"
							Lista_finalE(total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti)
							menu_principal(opcion,total_eventos,total_personas)
						SiNo
							Escribir "Debe de ingresar al menos un evento"
						FinSi
					SiNo
						Si opcion_registros=3 Entonces
							menu_principal(opcion,total_eventos,total_personas)
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
		
		// Agregar registro de personas
		Si opcion="2" Entonces
			Si total_eventos=0 Entonces
				Escribir "No se puede registrar asistencia porque no hay eventos registrados"
				menu_principal(opcion,total_eventos,total_personas)
			SiNo
				Repetir
					Escribir "¿Cuantas personas va a ingresar?"
					Leer Numero_personas
					Si Numero_personas<=0 Entonces
						Escribir "Debe registrar al menos 1 persona"
					Finsi
				Hasta Que Numero_personas > 0
				Registro_personas(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,Numero_personas,Nombre_Ev,total_eventos,total_personas,Asistentes_Evento,Cupo_personas)
					Escribir "¿Que desear hacer?"
					Escribir "1.Ver registros de personas"
					Escribir "2. Seguir registrando"
					Escribir "3. Volver al menu principal"
					Leer opcion_seguir
					Si opcion_seguir=1 Entonces
						Lista_finalR(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,total_personas,Nombre_Ev)
						menu_principal(opcion,total_eventos,total_personas)
					SiNo
						Si opcion_seguir=2 Entonces
							Escribir "¿Cuantas personas va a ingresar?"
							Leer Numero_personas
							Si Numero_personas>0 Entonces 
								Registro_personas(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,Numero_personas,Nombre_Ev,total_eventos,total_personas,Asistentes_Evento,Cupo_personas)
								Escribir "Registros guardados"
								Lista_finalR(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,total_personas,Nombre_Ev)
								menu_principal(opcion,total_eventos,total_personas)
							SiNo
								Escribir "Debe de ingresar al menos una persona"
							FinSi
						SiNo
							Si opcion_seguir=3 Entonces
								menu_principal(opcion,total_eventos,total_personas)
							FinSi
						FinSi
					FinSi
			FinSi
		FinSi
		
		// Ver el registro
		Si opcion="3" Entonces
			Si total_eventos>0 O total_personas>0 Entonces
				Escribir "¿Desea ver todos los registros o uno en especifico?"
				Escribir "1.Ver todos"
				Escribir "2.Ver solo un evento o registro"
				Leer opcion_volver
				Si opcion_volver=1 Entonces
					Escribir "Registro de eventos"
					Lista_finalE(total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti)
					Escribir "Registro de personas"
					Lista_finalR(Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,total_personas,Nombre_Ev)
					menu_principal(opcion,total_eventos,total_personas)
				SiNo
					Si opcion_volver=2 Entonces
						Escribir "¿Cuál desea consultar?"
						Escribir "1. Evento"
						Escribir "2. Registro de la persona"
						Leer opcion_buscar
						Si opcion_buscar=1 Entonces
							Escribir "Ingrese el numero de evento (1 a ", total_eventos, "):"
							Leer numero_evento
							Mostrar_evento_individual(numero_evento,total_eventos,Nombre_Ev,Descripcion_Ev,Fecha_Ini,Fecha_Fin,Nombre_Insti,Cupo_personas,Asistentes_Evento)
							menu_principal(opcion,total_eventos,total_personas)
						SiNo
							Si opcion_buscar=2 Entonces
								Escribir "Ingrese el ID del usuario (1 a ", total_personas, "):"
								Leer ID_persona
								Mostrar_persona_individual(ID_persona,total_personas,Nombre_persona,Numero_ID,Evento_pertenece,Tipo_documento,Nombre_Ev)
								menu_principal(opcion,total_eventos,total_personas)
							FinSi
						FinSi
					FinSi
				FinSi
			SiNo
				Escribir "No se pueden ver los registros ya que no hay eventos o personas registradas"
			FinSi
		FinSi
	FinMientras
FinAlgoritmo