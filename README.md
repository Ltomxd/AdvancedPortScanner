un scrip que hice apartir de uno que encontre y le agregue mas detallitos, Escaneo de Puertos TCP: El script escanea un rango de puertos TCP en un host específico utilizando la herramienta Nmap.

Cambio Temporal de Dirección MAC: Temporalmente cambia la dirección MAC de la interfaz de red utilizando la herramienta macchanger.

Escaneo de Servicios y Versiones: Utiliza la opción -sV de Nmap para detectar los servicios y versiones asociados a los puertos abiertos.

Parámetros de Entrada: Toma cuatro parámetros de entrada:

<port-range>: Rango de puertos a escanear.
<host>: Dirección IP del host a escanear.
<source-port>: Puerto de origen a utilizar en el escaneo.
<decoy-mac>: Dirección MAC "señuelo" para el escaneo.
Mensaje de Ayuda: Si no se proporcionan los parámetros correctos, muestra un mensaje de ayuda que describe cómo utilizar el script, incluyendo ejemplos de uso.

Restauración de Dirección MAC Original: Después del escaneo, restaura la dirección MAC original de la interfaz de red.    #./portScanner.sh <port-range> <host> <source-port> <decoy-mac>

entre oreas cosas xD
