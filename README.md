# Configuración de Clúster Consul + Balanceador de carga HAProxy + Artillery en Vagrant

Este repositorio contiene un entorno de Vagrant que te permite configurar un clúster Consul, un balanceador de carga usando HAProxy y realizar pruebas de carga con Artillery.

## Requisitos previos

- [Vagrant](https://www.vagrantup.com/) instalado en tu sistema.
- [VirtualBox](https://www.virtualbox.org/) u otro proveedor de virtualización compatible con Vagrant.
- Conexión a internet estable para la descarga de las imágenes de las máquinas virtuales y las dependencias.

## Instrucciones de Uso

1. Clona este repositorio en tu máquina local:

    git clone https://github.com/anyiramirez/microProyectoCloud.git

2. Navega al directorio del repositorio:

   
    cd microProyectoCloud
   

3. Inicia el entorno de Vagrant:

    vagrant up nodeOne 
    vagrant up nodeTwo
    vagrant up haproxy

4. Una vez que las máquinas virtuales estén provisionadas, accede a la máquina del balanceador de carga:
   
    vagrant ssh haproxy
 
5. Los siguiente archivos provisionan cada una de las maquinas, contienen las librerías y demas ejecutables para que  la máquina del balanceador de carga, ejecute bien el proceso:
    
    provisionN1.sh
    provisionN2.sh
    haproxy.sh

 Adicionalmente, los siguientes archivos tienen configurados la inicializacion para la creación  de los cluster:
   
   consulN2.service
   instance_con_1.service
   instance_con_2.service



6. Después de configurar el balanceador de carga, puedes ejecutar pruebas de carga con Artillery. Ejecuta las pruebas desde tu máquina local:

   
    npm install -g artillery

    Para ejecutar:
    npx artillery run .\clusterBalanced-load-test.yml 
    
    Para guardar la salida:
    npx artillery run --output prueba-escenario.json .\clusterBalanced-load-test.yml 
 

    Asegúrate de tener un archivo de configuración de prueba válido en formato YAML para Artillery.

## Estructura del Repositorio

- `Vagrantfile`: Archivo de configuración de Vagrant para definir las máquinas virtuales y su configuración.
- `haproxy.cfg`: Archivo de configuración de HAProxy.
- Carpeta de aprovisionamiento NodeOne CONSUL_N1
- Carpeta de aprovisionamiento NodeTwo CONSUL_N2
- Carpteta de aprovisionamiento HAPROXY Haproxy
- Carpeta de test con Artillery LoadTest


## Notas

- El clúster Consul se configura automáticamente dentro de la red privada de Vagrant.
- Asegúrate de ajustar la configuración de HAProxy según tus necesidades específicas.
- Las pruebas de carga con Artillery deben ser configuradas adecuadamente para tu aplicación.

¡Disfruta utilizando este entorno para probar y experimentar con tu aplicación distribuida!
