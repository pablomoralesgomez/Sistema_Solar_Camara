# Sistema Solar Camara

Autor: Pablo Morales Gómez

Asignatura: Creando Interfaces de Usuario

Curso: 4º

## Introducción

En este trabajo hemos tomado como base el proyecto hecho con anterioridad donde, valiéndonos de las rotaciones, traslaciones y escalados que nos proporciona processing, construimos un pequeño sistema solar con sus planetas girando entorno a una estrella y algunos de ellos con sus propios satelites orbitando a su vez alrededor de ellos. Partiendo de este punto, hemos incorporado la opción de cambiar la cámara que se usa para visualizar el conjunto.


## Desarrollo

Para este trabajo hemos trabajado con dos cámaras, una estática con la que no se puede producir ninguna interacción (a la que en el código nos referimos como general) y otra que simula el movimiento de una nave con la que los usuarios pueden interactuar cambiándola de posición y de ángulo.

Para gestionar los movimientos de esta cámara (que en el código recibe la denominación de subjetiva), hemos creado la clase *UpdateCamaraPosition* donde tratamos con todos los cambios de posición y rotaciones a las que el cliente someta este punto de vista. En lo respectivo al movimiento hemos tenido que añadir una serie de controles:

* La tecla **C** para cambiar el modo de la cámara (alternar entre subjetiva y general).
* Las teclas **W**, **A**, **S**, **D** para modificar el ángulo de la cámara.
* La flecha ***UP*** para mover la nave hacia adelante.
* La flecha ***DOWN*** para mover la nave hacia detrás.

Debemos añadir que en lo relativo al movimiento, una vez se pare de mover la embarcación hacia adelante o hacia detrás, la "nave aeroespacial" no se detendrá automáticamente, en cambio, avanzará un corto espacio simulando ligeramente la inercia que sufriría uno de estos aparatos en la realidad. Además, hemos añadido que cuando se visualice el plano general de los planetas se muestre un cubo blanco en la posición en la que hemos dejado la nave para que el usuario pueda hacerse una idea de a que altura dejó el plano subjetivo. Inicialmente, en el plano general no se podrá apreciar el cubo, ya que la posición de partida de la cámara subjetiva es la misma que la del plano general, por este motivo no se puede observar (no esta aún dentro del plano general).  

Finalmente, se ha decidido añadir un menú de pausa donde se muestran los controles de los que dispone la aplicación (se debe pulsar la tecla **H**), además de un mensaje que indica como acceder a él junto con otro que nos recuerda en que modo de cámara nos encontramos.


## Previsualización de la Aplicación

<p align="center"> <img src="animacion.gif" alt="gif animado" /> </p>
