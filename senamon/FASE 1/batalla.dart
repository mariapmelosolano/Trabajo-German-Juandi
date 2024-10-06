import 'dart:math';
import 'dart:io';
import 'entrenador.dart';
import 'senamon.dart';

void iniciarCombate(List<Entrenador> jugadores) {
  print('Preparando el campo de batalla');
  bool turnoInicial = decidirTurnoInicial();

  Entrenador primerJugador = turnoInicial ? jugadores[0] : jugadores[1];
  Entrenador segundoJugador = turnoInicial ? jugadores[1] : jugadores[0];
  print('${primerJugador.nombre} elegirá primero sus Senamones.');

  List<Senamon> opciones1 = getGenerarSenamonesPredeterminados(1);
  elegirSenamones(primerJugador, opciones1);

  print('${segundoJugador.nombre} elegirá ahora sus Senamones.');

  List<Senamon> opciones2 = getGenerarSenamonesPredeterminados(2);
  elegirSenamones(segundoJugador, opciones2);

  combatir(jugadores);
}

void elegirSenamones(Entrenador jugador, List<Senamon> opciones) {
  List<Senamon> seleccionados = [];
  print('${jugador.nombre}, elige 5 Senamones.');

  while (seleccionados.length < 5) {
    mostrarOpcionesSenamones(opciones);
    print('Elige el número del Senamon que quieres (${seleccionados.length + 1}/5):');
    String? input = stdin.readLineSync();
    int? indice = int.tryParse(input ?? '');

    if (indice != null && indice >= 0 && indice < opciones.length) {
      Senamon elegido = opciones[indice];
      seleccionados.add(elegido);
      opciones.removeAt(indice);
      print('Has elegido a ${elegido.getNombre()}.');
    } else {
      print('Elección no válida. Elige un número de la lista.');
    }
  }
  
  jugador.senamones = seleccionados;
  print('${jugador.nombre} ha elegido sus 5 Senamones:');
  for (var senamon in seleccionados) {
    print('- ${senamon.getNombre()}');
  }
}

void mostrarOpcionesSenamones(List<Senamon> senamones) {
  print('Senamones disponibles:');
  for (int i = 0; i < senamones.length; i++) {
    print('$i: ${senamones[i].getNombre()} (Tipo: ${senamones[i].getTipo()})');
  }
}

void combatir(List<Entrenador> jugadores) {
  Entrenador jugador1 = jugadores[0];
  Entrenador jugador2 = jugadores[1];
  print('\n¡Comienza el combate entre ${jugador1.nombre} y ${jugador2.nombre}!');

  bool turnoJugador1 = decidirTurnoInicial();
  Entrenador atacante = turnoJugador1 ? jugador1 : jugador2;
  Entrenador defensor = turnoJugador1 ? jugador2 : jugador1;

  int derrotasAtacante = 0;
  int derrotasDefensor = 0;

  while (derrotasAtacante < 3 && derrotasDefensor < 3) {
    print('Turno de ${atacante.nombre}');
    
    Senamon senamonAtacante = obtenerSenamonActivo(atacante);
    Senamon senamonDefensor = obtenerSenamonActivo(defensor);
    print('${senamonAtacante.getNombre()}: Salud ${senamonAtacante.getPuntosSalud()}');
    print('${senamonDefensor.getNombre()}: Salud ${senamonDefensor.getPuntosSalud()}');
    
    print('Elige: 1. Atacar 2. Cambiar Senamon');
    String? opcion = stdin.readLineSync();

    if (opcion == '1') {
      int danio = senamonAtacante.getNivelAtaque();
      senamonDefensor.setPuntosSalud(senamonDefensor.getPuntosSalud() - danio);
      print('${senamonAtacante.getNombre()} atacó a ${senamonDefensor.getNombre()} y causó $danio de daño.');
      if (senamonDefensor.getPuntosSalud() <= 0) {
        print('${senamonDefensor.getNombre()} ha sido derrotado.');
        derrotasDefensor++;
        if (derrotasDefensor < 3) {
          cambiarSenamonEnCombate(defensor);
        }
      } else {
        print('A ${senamonDefensor.getNombre()} le quedan ${senamonDefensor.getPuntosSalud()} puntos de salud.');
      }
    } else if (opcion == '2') {
      cambiarSenamonEnCombate(atacante);
    } else {
      print('Opción no válida. Pierdes el turno.');
    }

    Entrenador temp = atacante;
    atacante = defensor;
    defensor = temp;
  }

  String ganador = derrotasAtacante >= 3 ? defensor.nombre : atacante.nombre;
  print('¡${ganador} ha ganado el combate!');
  
  // Actualizar las batallas ganadas
  if (ganador == jugador1.nombre) {
    jugador1.batallasGanadas++;
  } else {
    jugador2.batallasGanadas++;
  }
}

Senamon obtenerSenamonActivo(Entrenador entrenador) {
  return entrenador.senamones.firstWhere((s) => s.getPuntosSalud() > 0);
}

void cambiarSenamonEnCombate(Entrenador entrenador) {
  print('${entrenador.nombre}, elige otro Senamon con vida:');
  for (int i = 0; i < entrenador.senamones.length; i++) {
    Senamon senamon = entrenador.senamones[i];
    if (senamon.getPuntosSalud() > 0) {
      print('$i: ${senamon.getNombre()} (Salud: ${senamon.getPuntosSalud()})');
    }
  }

  String? seleccion = stdin.readLineSync();
  int indice = int.tryParse(seleccion ?? '') ?? -1;

  if (indice >= 0 && indice < entrenador.senamones.length && entrenador.senamones[indice].getPuntosSalud() > 0) {
    print('${entrenador.nombre} ha elegido a ${entrenador.senamones[indice].getNombre()}.');
  } else {
    print('Elección inválida.');
  }
}

void mostrarEstadisticas(List<Entrenador> jugadores) {
  for (Entrenador jugador in jugadores) {
    print('Entrenador: ${jugador.nombre}');
    print('Victorias: ${jugador.batallasGanadas}');
    print("-" * 30);
  }
  if (jugadores[0].batallasGanadas > jugadores[1].batallasGanadas) {
    print('${jugadores[0].nombre} lidera en victorias.');
  } else if (jugadores[1].batallasGanadas > jugadores[0].batallasGanadas) {
    print('${jugadores[1].nombre} lidera en victorias.');
  } else {
    print('Ambos jugadores están empatados en victorias.');
  }
}

bool decidirTurnoInicial() {
  print('Lanzando una moneda para decidir el orden...');
  bool resultado = Random().nextBool();
  print(resultado ? '¡Ha salido cara!' : '¡Ha salido cruz!');
  return resultado;
}