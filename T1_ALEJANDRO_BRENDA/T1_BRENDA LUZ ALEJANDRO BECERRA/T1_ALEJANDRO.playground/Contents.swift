//Pregunta 01: Filtrar Números Pares

func NumeroPar(_ Numero: Int) -> Bool {
    return Numero % 2 == 0 // VERIFICACIÓN DE LOS NÚMEROS
}

func NumerosParesDelArreglo(_ Numeros: [Int]) -> [Int] {
    return Numeros.filter { NumeroPar($0) } // Filtra los números
}

// Ejecución DE PREGUNTA 01
let ArregloNumeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 13, 16, 15, 0, 20]
let NumerosPares = NumerosParesDelArreglo(ArregloNumeros)
print(NumerosPares) // Imprime los números pares






//Pregunta 02: Comprobar Primer y Último Elemento

func VerificarElementos(_ Numeros: [Int]) {
    guard Numeros.count >= 1 else {
        print("La lista está vacía.") // LISTADO
        return
    }

    let NumeroUno = Numeros.first! // PRIMER NÚMERO
    let NumeroUltimo = Numeros.last! // ÚLTIMO NÚMERO

    if NumeroUno == NumeroUltimo {
        print("El primer elemento (\(NumeroUno)) es igual al último elemento (\(NumeroUltimo)).")
    } else {
        print("El primer elemento (\(NumeroUno)) no es igual al último elemento (\(NumeroUltimo)).")
    }
}

// Ejecución: COMPRUEBA SI EL PRIMER Y ÚLTIMO NÚMERO SON IGUALES
let EjecucionDeAreglo = [1, 2, 3, 1, 2, 3, 4, 6, 4]
VerificarElementos(EjecucionDeAreglo)

