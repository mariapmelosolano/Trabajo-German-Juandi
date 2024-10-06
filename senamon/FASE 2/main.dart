import 'dart:io';
import 'entrenador.dart';
import 'senamon.dart';
import 'batalla.dart';

void main() {
  List<Entrenador> jugadores = [];
  print('¡Bienvenido al universo Senamon!');
  print("-" * 30);

  List<Entrenador> entrenadores = obtenerEntrenadoresDisponibles();

  for (int i = 0; i < 2; i++) {
    print('Jugador ${i + 1}:');
    print('Elige un entrenador:');
    for (int j = 0; j < entrenadores.length; j++) {
      print('${j + 1}. ${entrenadores[j].nombre}');
    }
    
    int eleccion = -1;
    while (eleccion < 0 || eleccion >= entrenadores.length) {
      print('Ingresa el número del entrenador que deseas:');
      eleccion = int.parse(stdin.readLineSync()!) - 1;
      if (eleccion < 0 || eleccion >= entrenadores.length) {
        print('Elección inválida. Por favor, elige un número válido.');
      }
    }
    
    jugadores.add(entrenadores[eleccion]);
    entrenadores.removeAt(eleccion);
    
    print('Has elegido a ${jugadores[i].nombre}');
    print("-" * 30);
  }

  if (jugadores.isNotEmpty) {
    menuPrincipal(jugadores);
  } else {
    print('No se han seleccionado entrenadores.');
  }
}

void menuPrincipal(List<Entrenador> jugadores) {
  while (true) {
    print('1.Comenzar combate');
    print('2. Entrenar Senamon');
    print('3. Ver estadísticas');
    print('4. Cambiar Senamon');
    print('5. Salir');
    print('¿Qué deseas realizar?:');
    String? opcion = stdin.readLineSync();
    switch (opcion) {
      case '1':
        iniciarCombate(jugadores);
        break;
      case '2':
        entrenarSenamones(jugadores);
        break;
      case '3':
        mostrarEstadisticas(jugadores);
        break;
      case '4':
        menuCambioSenamon(jugadores);
        break;
      case '5':
        print('¡Gracias por jugar!');
        exit(0);
      default:
        print('Opción no válida.');
    }
    print("-" * 30);
  }
}

void entrenarSenamones(List<Entrenador> jugadores) {
  for (Entrenador jugador in jugadores) {
    print('${jugador.nombre}, selecciona un Senamon para entrenar:');
    for (int i = 0; i < jugador.senamones.length; i++) {
      print('$i: ${jugador.senamones[i].getNombre()}');
    }
    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;
    if (indice >= 0 && indice < jugador.senamones.length) {
      print('¿Qué quieres mejorar? (1. Ataque, 2. Salud)');
      String? mejora = stdin.readLineSync();
      print('¿Cuántos puntos quieres añadir?');
      String? puntos = stdin.readLineSync();
      int cantidad = int.tryParse(puntos!) ?? 0;
      bool esAtaque = mejora == '1';
      jugador.entrenarSenamon(indice, cantidad, esAtaque);
    } else {
      print('Selección inválida.');
    }
  }
}

void menuCambioSenamon(List<Entrenador> jugadores) {
  print('Elige el jugador (1 o 2):');
  int jugadorIndex = int.tryParse(stdin.readLineSync()!)! - 1;
  if (jugadorIndex < 0 || jugadorIndex >= jugadores.length) {
    print('Jugador inválido.');
    return;
  }

  print('Elige la posición del Senamon a cambiar (0-4):');
  int senamonIndex = int.tryParse(stdin.readLineSync()!)!;

  print('Ingresa el nombre del nuevo Senamon:');
  String? nombre = stdin.readLineSync();
  print('Ingresa el nivel del nuevo Senamon:');
  int nivel = int.tryParse(stdin.readLineSync()!)!;
  print('Ingresa el tipo del nuevo Senamon:');
  String? tipo = stdin.readLineSync();
  print('Ingresa el peso del nuevo Senamon:');
  double peso = double.tryParse(stdin.readLineSync()!)!;
  print('Ingresa los puntos de salud del nuevo Senamon:');
  int puntosSalud = int.tryParse(stdin.readLineSync()!)!;
  print('Ingresa el nivel de ataque del nuevo Senamon:');
  int nivelAtaque = int.tryParse(stdin.readLineSync()!)!;
  print('Ingresa la fase del nuevo Senamon:');
  String? fase = stdin.readLineSync();
  print('Ingresa el nivel de energía del nuevo Senamon:');
  int nivelEnergia = int.tryParse(stdin.readLineSync()!)!;
  print('Ingresa la descripción del nuevo Senamon:');
  String? descripcion = stdin.readLineSync();

  Senamon nuevoSenamon = Senamon(
    nombre: nombre!,
    nivel: nivel,
    tipo: tipo!,
    peso: peso,
    puntosSalud: puntosSalud,
    nivelAtaque: nivelAtaque,
    fase: fase!,
    nivelEnergia: nivelEnergia,
    descripcion: descripcion!,
  );

  cambiarSenamon(jugadores[jugadorIndex], senamonIndex, nuevoSenamon);
}

void cambiarSenamon(Entrenador jugador, int indice, Senamon nuevoSenamon) {
  if (indice < 0 || indice >= jugador.senamones.length) {
    print('Índice inválido.');
    return;
  }
  jugador.senamones[indice] = nuevoSenamon;
  print('Senamon en la posición $indice reemplazado por ${nuevoSenamon.getNombre()}.');
}

// obtención de entrenadores predeterminados
List<Entrenador> obtenerEntrenadoresDisponibles() {
  return getEntrenadoresPredeterminados();
}