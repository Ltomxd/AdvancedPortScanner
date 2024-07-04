# DecoyMACPortScanner

![Port Scanner](https://img.shields.io/badge/Port%20Scanner-Nmap-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## Descripción

**DecoyMACPortScanner** es un script avanzado para escanear puertos TCP en un host específico. Incorpora varias funcionalidades adicionales para mejorar la eficiencia y discreción del escaneo.

### Funcionalidades

- **Escaneo de Puertos TCP:** Escanea un rango de puertos TCP en un host específico utilizando la herramienta Nmap.
- **Cambio Temporal de Dirección MAC:** Temporalmente cambia la dirección MAC de la interfaz de red utilizando la herramienta macchanger.
- **Escaneo de Servicios y Versiones:** Utiliza la opción `-sV` de Nmap para detectar los servicios y versiones asociados a los puertos abiertos.
- **Restauración de Dirección MAC Original:** Después del escaneo, restaura la dirección MAC original de la interfaz de red.

### Parámetros de Entrada

El script toma cuatro parámetros de entrada:

- `<port-range>`: Rango de puertos a escanear.
- `<host>`: Dirección IP del host a escanear.
- `<source-port>`: Puerto de origen a utilizar en el escaneo.
- `<decoy-mac>`: Dirección MAC "señuelo" para el escaneo.

### Uso

```bash
./portScanner.sh <port-range> <host> <source-port> <decoy-mac>
