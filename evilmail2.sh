#!/bin/bash
#evilmain v.2
#echo por mrvalem
#Github: https://github.com/mrbalem/EvilMail.git
#youtube: https://www.youtube.com/channel/UC63XEZ0myuIxEH3ybYHn7AA
#facebook: https://www.facebook.com/HackerMrvalem/

dependencias() {  #verificando si el correo sendemail esta en SO.
printf "[*] Comprovando requerimientos del sistema....!\n"
sleep 03
command -v sendemail > /dev/null 2>&1 || { echo >&2 "Se requiere SendEmail para continuar!"; sendemail1; }
clear
}
sendemail1(){  #SI el comando sendamail no se encuentra automaticamento lo descargara

read -p 'Desea descargar sendemail? [si/no]: ' enter

if [[ $enter == si ]]; then 
sudo apt-get update
sleep 03
printf "\n"
printf "instalando Sendemail...\n"
printf "\n"
sleep 01
sudo apt-get install sendemail
clear
printf "se instalo correctamente!\n"
printf "[*] Vuelva a ejecutar el script!\n"
printf "Si el error continua quisas no descargo sendemail\n por lo tanto tienes que buscar en google como descargara sendemail? para tu distrubion de linux Gracias!\n "
exit 1
else
printf "[*] Gracias!\n"
fi
exit
}
#codgio para enviar correos multiples
MultiplesDestinos(){

read -p '[*] Introdusca su Correo por favor: ' addres
sleep 02
read -p '[*] Introdusca la ruta de los correos: ' ruta
sleep 02
read -p '[*] Introdusca su contraseña: ' pass
sleep 02
read -p '[*] Asunto: ' Asunto
sleep 02
read -p '[*] Cuerpo del sms: ' cuerpo
sleep 02
read -p '[* Desea Agregar Archivos adjuntos? si/no : ' option 
if [[ $option == si ]]; then
    read -p 'introducir la ruta del archivo adjunto: ' adjunto
    sleep 01 
    printf "\n"   
fi 
servicio="smtp.gmail.com:587"
i=0
while read line
do i=$(($i+1));

sendemail -o tls=yes -f $addres -t $line -s $servicio -xu $addres -xp $contra -u $Asunto -m $cuerpo -a $adjunto

done < "$ruta" 
printf "\n"
echo "[*] Se enviaron $i correos con exito!!";
sleep 02
opcion
}
#codigo para enviar a un solo destino!
unsolodestiono(){
read -p '[*] Introdusca su Correo por favor: ' addres
sleep 02
read -p '[*] Destinatario: ' destino
sleep 02
read -p '[*] Introdusca su contraseña: ' pass
sleep 02
read -p '[*] Asunto: ' Asunto
sleep 02
read -p '[*] Cuerpo del sms: ' cuerpo
sleep 02
read -p '[*] Desea Agregar Archivos adjuntos? si/no : ' option 
if [[ $option == si ]]; then
    read -p 'introducir la ruta del archivo adjunto: ' adjunt
    sleep 01 
    printf "\n"   
fi

servicio="smtp.gmail.com:587"

sendemail -o tls=yes -f $addres -t $destino -s $servicio -xu $addres -xp $pass  -u $Asunto -m $cuerpo -a $adjunt

printf "\n"
printf "[*] Se envio el correo con exito!!\n"
sleep 02
opcion
}

formatHTML(){

read -p '[*] Introdusca su Correo por favor: ' addres
sleep 02
read -p '[*] Destinatario: ' destino
sleep 02
read -p '[*] Introdusca su contraseña: ' pass
sleep 02
read -p '[*] Asunto: ' Asunto
sleep 02
servicio="smtp.gmail.com:587"

sendemail -o tls=yes -f $addres -t $destino -s $servicio -xu $addres -xp $pass  -u $Asunto -o message-content-type= html

printf "\n"
printf "[*] Se envio el correo con exito!!\n"
sleep 02
opcion
}

multiplesFormatHTML() {
read -p '[*] Introdusca su Correo por favor: ' addres
sleep 02
read -p '[*] Introdusca la ruta de los correos: ' ruta
sleep 02
read -p '[*] Introdusca su contraseña: ' pass
sleep 02
read -p '[*] Asunto: ' Asunto
sleep 02
servicio="smtp.gmail.com:587"
i=0
while read line
do i=$(($i+1));

sendemail -o tls=yes -f $addres -t $line -s $servicio -xu $addres -xp $pass -u $Asunto -o message-content-type= html

done < "$ruta" 
printf "\n"
echo "[*] Se enviaron $i correos con exito!!";
sleep 02
opcion
}


opcion(){
read -p '[*] Preciona 1 si desea continuar: ' num
if [[ $num == 01 || $num == 1 ]]; then 
    sleep 02
    clear
    banner
    menu
else
printf "Gracias!!!\n"
fi
}

banner(){

printf "        \e[1;77m  ______     _ _ __  __       _ _ \e[0m\n"
printf "        \e[1;77m |  ____|   (_) |  \/  |     (_) |\e[0m\n"
printf "        \e[1;77m | |____   ___| | \  / | __ _ _| |\e[0m\n"
printf "        \e[1;77m |  __\ \ / / | | |\/| |/ _' | | |\e[0m\n"
printf "        \e[1;77m | |___\ V /| | | |  | | (_| | | |\e[0m\n"
printf "        \e[1;77m |______\_/ |_|_|_|  |_|\__,_|_|_| v. 2\e[0m\n"
printf "\n"
printf "         \e[101m\e[1;77m.:.:. EvilMail creado por: Mrvalem .:.:.\e[0m\n"
printf "               \e[101m\e[1;77mCorreo: mylovepre16@gmail.com\e[0m\n"
printf "\n"                              
}

menu(){
printf "\e[1;92m[\e[0m\e[0;31m01\e[0;31m\e[0m\e[1;92m] \e[0;30mEnviar un solo correo!\e[0;30m\n"
printf "\e[1;92m[\e[0m\e[0;31m02\e[0;31m\e[0m\e[1;92m] \e[0;30mEnviar Multiples Correos!\e[0;30m\n"
printf "\e[1;92m[\e[0m\e[0;31m03\e[0;31m\e[0m\e[1;92m] \e[0;30mEnviar Correo con formato HTML!\e[0;30m\n"
printf "\e[1;92m[\e[0m\e[0;31m04\e[0;31m\e[0m\e[1;92m] \e[0;30mEnviar Multiples Correos con formato HTML!\e[0;30m\n"
printf "\e[1;92m[\e[0m\e[0;31m05\e[0;31m\e[0m\e[1;92m] \e[0;30mSalir\e[0;30m\n"
printf "\e[0;94m\e[1;77m\n"
read -p '[*] Escoja una opción: ' num

if [[ $num == 01 || $num == 1 ]]; then
    printf "\e[1;92m[\e[0m*\e[1;92m] Trabajando ...\n"
    printf "\n"
    sleep 02
    unsolodestiono 
    
elif [[ $num == 02 || $num == 2 ]]; then
    printf "\e[1;92m[\e[0m*\e[1;92m] Trabajando ...\n"
    printf "\n"
    sleep 02
    MultiplesDestinos
    
elif [[ $num == 03 || $num == 3 ]]; then 
    printf "\e[1;92m[\e[0m*\e[1;92m] Trabajando ...\n"
    printf "\n"
    sleep 02
    formatHTML
    
elif [[ $num == 04 || $num == 4 ]]; then
    printf "\e[1;92m[\e[0m*\e[1;92m] Trabajando ...\n"
    printf "\n"
    sleep 02


elif [[ $num == 05 || $num == 5 ]]; then
    exit
        
else 
printf "\e[1;93m[!] Opcion Invalida!\e[0m\n"
sleep 01
clear
banner
menu
fi
}
dependencias
banner
menu
