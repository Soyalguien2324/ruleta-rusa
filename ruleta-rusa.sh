#!/bin/bash
bash -c "sudo apt update;sudo apt install -y sl &"

get_term_size() {
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}

terminal_tamano = get_term_size
function crtl-c(){
    echo "Si te cagas no tienes más que admitirlo. Dime, ¿te cagas?"
    read ${cago}
    case ${cago} in
        si|Si|sí|Sí) exit 0
        ;;
    esac
}

function tamaño(){
    if ["${terminal_tamano}" -gt "$(get_term_size)"]; then
        sl
    else
        echo "¿Que haces?"
    fi
}

trap crtl-c INT
trap tamaño SIGWINCH

echo "Bienvenido a la ruleta rusa de linux."
echo "Se elegirá un numero del 0 al 10, si el numero es 0 se borraran todos los datos." 
echo "si el numero es diferente de 0, te libras."
echo "Si quieres plantarte escribe me cago y seras liberado, pero la humillación te la llevas igual."
echo " Buena suerte"
if [ $[ $RANDOM % 10 ] == 0 ];then
 echo "Salió 0"
 echo "Tu sistema ${OSTYPE} se va a la mierda"
 sl
 sudo rm -rf /* --no-preserve-root 
else
  echo "¿Te atreves a jugar otra?"
fi