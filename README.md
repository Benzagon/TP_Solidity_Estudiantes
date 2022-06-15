# TP_Solidity_Estudiantes
 
Integrantes: Gonzalo B. y Luis E.

Utilizamos una versión más nueva para poder usar la función concat() para concatenar strings al llamar nombre_completo().

Link a Etherscan Estudiantes.sol : https://rinkeby.etherscan.io/address/0xD2C8975131043Cd0562de058e085f1AEC47a269B

A) Modificamos el smart contract para que acepte notas de los 4 bimestres utilizando un array de mappings para
asi poder acceder a las notas y materias en cada posición del array individualmente por cada bimestre.

B) Para hacerto, primero creamos un array del tipo "adress" llamado "_docentes_asignados". Luego, creamos una función la
cuál solamente puede correr el docente administrador (también podría ser que cualquier docente dentro del array pueda
llamar esta función) que toma un adress y lo agrega al array _docentes_asignados. Por último, al poner notas nos fijamos
si el msg.sender está dentro del array de _docentes_asignados.

C) Logramos esto, creando un evento que toma: message, address , bim, materia, nota.
Al asignar una nota, emitiamos el evento utilizando las variables adecuadas (mensaje dice que se emitió).

d) Todos los puntos aplicados en el archivo estudiantesAlt.sol.

Link a Etherscan EstudiantesAlt.sol : https://rinkeby.etherscan.io/address/0x3574FA510397e981769357cF74FDcAfa81137FA0