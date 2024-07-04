#!/bin/bash
# Autor: Frank Tom

if [ $# -eq 4 ]; then
    startPort=$(echo $1 | tr '-' ' ' | awk '{print $1}')
    endPort=$(echo $1 | tr '-' ' ' | awk '{print $2}')
    rangePort=$(seq $startPort $endPort)
    host=$2
    sourcePort=$3
    decoy=$4

    # Cambio temporal de la dirección MAC de la interfaz de red
    interface=$(ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}')
    sudo macchanger -m $decoy $interface >/dev/null

    # Función para mostrar la barra de carga
    function show_loading() {
        local progress=$1
        local bar_length=50
        local num_blocks=$((progress * bar_length / 100))
        local loading=""
        for ((i=0; i<num_blocks; i++)); do loading+="#"; done
        for ((i=num_blocks; i<bar_length; i++)); do loading+=" "; done
        printf "\rSe está tensando la cosa. [%s] %3d%%" "$loading" "$progress"
    }

    # Escaneo de puertos con nmap para obtener información de servicios y versiones
    echo -e "\n~ Starting port scanning for $host with Source Port $sourcePort, Decoy $decoy, and Spoofed MAC...!\n"

    # Mostrar la barra de carga mientras se realiza el escaneo
    for port in $(seq $startPort $endPort); do
        # Calcular el progreso del escaneo
        progress=$((100 * ($port - $startPort + 1) / ($endPort - $startPort + 1)))
        show_loading $progress
        sleep 0.1
    done

    echo -e "\n"

    # Mostrar mensaje al llegar al 100% de progreso
    if [ $progress -eq 100 ]; then
        echo "Paciencia mi Dogor, se están generando y organizando los resultados 🐕‍🦺"
    fi

    nmap_output=$(nmap -p $startPort-$endPort -sV --source-port $sourcePort --spoof-mac $decoy $host)

    echo -e "\n$nmap_output\n"

    # Restauración de la dirección MAC original de la interfaz de red
    sudo macchanger -p $interface >/dev/null

    echo -e "\n~ ¡Escaneo completo!"
else
    # Mostrar mensaje de ayuda si se proporcionan argumentos incorrectos
    echo "### TCP Port Scanner ###"
    echo -e "\n[+] Uso: $0 <rango-de-puertos> <host> <source-port> <decoy-mac>"
    echo -e "\n~ Ejemplo:"
    echo -e "\t$ $0 1000-2000 192.168.1.100 12345 00:11:22:33:44:55"
    echo -e "\t$ $0 0-1000 172.17.0.2 54321 66:77:88:99:aa:bb"
    echo -e "\n~ ¡Vamos mi Dogor!"
fi
