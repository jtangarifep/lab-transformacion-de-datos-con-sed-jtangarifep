# Escriba su código aquí
#! /bin/bash

#****************************************************************
# Fecha : 21.09.2019						*
# Estudiante : Juan David Tangarife Patiño			*
# Instituto : Universidad Nacional de Colombia			*
# Materia : Ciencia de Datos					*
# Profesor : Juan David Velasquez				*
# Subject : Taller transformación en SED			*	
#****************************************************************

#arreglo los primeros periodos
$(sed 's/\([0-9]\)\/\([0-9]\)\//0\1\/0\2\//' data.csv > out.01)

#arreglo el ultimo año
$(sed '$ s/\/2014/\/14/' out.01 > out.02)

# configuracion del año
$(sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\);/20\3\/\2\/\1;/' out.02 > out.03)

# Se arregla la N de la linea 4
$(sed '4 s/;[N]/;\\N/' out.03 > out.04)

#cambio los separadores de las fechas
$(sed 's/\//-/g' out.04 > out.05 )

#Paso a mayusculas todo el archivo
$(sed 's/[a-z]/\U&/g' out.05 > out.06)

#Se arreglan los campos nulos
$(sed 's/;;/;\\N;/g' out.06 | sed  '4 s/;[N]/;\\N/' > out.07 )

#finaliza los nulos al final del archivo
$(sed 's/;$/;\\N/' out.07 > out.08)

#termina la preparacion del nulo
$(sed 's/;N/;\\N/' out.08 > out.09 )

#prepara los separadores de decimales y separedores del formato del archivo
$(sed 's/\,/\./g' out.09 | sed 's/\;/\,/g' > data.csv)

$(rm -f out.*)

#echo final....


