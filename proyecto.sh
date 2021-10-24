#!/bin/bash
op=0
op3=0
sec_agile=("SCRUM" "X.P." "Kanban" "Crystral")
sec_tradi=(Cascada Espiral "Modelo V")
definicion=""
pwd=`pwd`
if [[ $1 == "-a" ]]; then
	while [[ $op != 5 ]]; do 
		op2=0
		clear
		echo "================================================="
		echo "     Bienvenido a la guía rápida de Agile"
		echo "================================================="
		echo "1. SCRUM"
		echo "2. X.P."
		echo "3. Kanban"
		echo "4. Crystal"
		echo "5. Salir"
	        read -p "para continuar seleccione un tema: " op
		if [[ $op != 5 ]]; then
			if ! [[ -f SCRUM.inf ]]; then
				touch SCRUM.inf
			fi
			if ! [[ -f X.P.inf ]]; then
				touch X.P.inf
			fi
			if ! [[ -f "Kanban.inf" ]]; then
				touch "Kanban.inf"
			fi
			if ! [[ -f "Crystal.inf" ]]; then
				touch "Crystal.inf"
			fi
			while [[ $op2 != 5 ]]; do 
				echo "=========================================================="
				echo "     Usted esta en la sección '${sec_agile[$((op-1))]}'"
				echo "=========================================================="
				echo "1. Agregar Información"
				echo "2. Buscar"
				echo "3. Eliminar información"
				echo "4. Leer base de información"
				echo "5. Salir"
				read -p "Seleccione la opción que desea utilizar: " op2
				if [[ $op2 == 1 ]]; then
					concepto_sin_formato=""
					concepto_con_formato=""
					clear
					read -p "Concepto: " concepto_sin_formato
					read -p "Definicion: " definicion
					concepto_con_formato="[$concepto_sin_formato].-"

					echo "$concepto_con_formato $definicion" >> "${sec_agile[$((op-1))]}.inf"
				fi
				if [[ $op2 == 4 ]]; then
					clear
					cat ${sec_agile[$((op-1))]}.inf
				fi
				done
		fi
	done
fi

if [[ $1 == "-t" ]]; then
	while [[ $op3 != 4 ]]; do 
		op4=0
		clear
		echo "================================================================="
		echo "     Bienvenido a la guía rápida de Metodologías tadicionales"
		echo "================================================================="
		echo "1. Cascada"
		echo "2. Espiral"
		echo "3. Modelo V"
		echo "4. Salir"
		read -p "para continuar seleccione un tema: " op3
		if [[ $op3 != 4 ]]; then
			while [[ $op4 != 5 ]]; do
				if ! [[ -f Cascada.inf ]]; then
					touch Cascada.inf
				fi
				if ! [[ -f Espiral.inf ]]; then
					touch Espiral.inf
				fi
				if ! [[ -f "Modelo V.inf" ]]; then
					touch "Modelo V.inf"
				fi

				echo "========================================================="
				echo "     Usted esta en la sección '${sec_tradi[$((op3-1))]}'"
				echo "=========================================================="
				echo "1. Agregar Información"
				echo "2. Buscar"
				echo "3. Eliminar información"
				echo "4. Leer base de información"
				echo "5. Salir"
				read -p "Seleccione la opción que desea utilizar: " op4
				if [[ $op4 == 1 ]]; then
					concepto_sin_formato=""
					concepto_con_formato=""
					clear
					read -p "Concepto: " concepto_sin_formato
					read -p "Definicion: " definicion
					concepto_con_formato="[$concepto_sin_formato].-"

					echo "$concepto_con_formato $definicion" >> "${sec_tradi[$((op3-1))]}.inf"
				fi
				if [[ $op4 == 4 ]]; then
					clear
					cat "${sec_tradi[$((op3-1))]}.inf"
				fi
			done
		fi
	done
fi


