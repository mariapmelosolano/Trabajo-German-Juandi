import 'senamon.dart';

class Entrenador {
  String nombre, email;
  DateTime fechaNacimiento;
  int experiencia, batallasGanadas;
  List<Senamon> senamones;

  Entrenador({
    required this.nombre,
    required this.email,
    required this.fechaNacimiento,
    this.experiencia = 0,
    this.batallasGanadas = 0,
    required this.senamones,
  });

  void entrenarSenamon(int indice, int cantidad, bool esAtaque) {
    if (indice < 0 || indice >= senamones.length) {
      print('Índice de Senamon inválido.');
      return;
    }

    int puntosRequeridos = (cantidad / 20).toInt();
    if (experiencia >= puntosRequeridos) {
      if (esAtaque) {
        senamones[indice].setNivelAtaque(senamones[indice].getNivelAtaque() + cantidad);
        print('El nivel de ataque de ${senamones[indice].getNombre()} ha sido aumentado a ${senamones[indice].getNivelAtaque()}.');
      } else {
        senamones[indice].setPuntosSalud(senamones[indice].getPuntosSalud() + cantidad);
        print('Los puntos de salud de ${senamones[indice].getNombre()} ha sido aumentado a ${senamones[indice].getPuntosSalud()}.');
      }

      experiencia -= puntosRequeridos;
    } else {
      print('No puedes mejorar este senamon');
    }
  }
}

// Función para obtener entrenadores predeterminados
List<Entrenador> getEntrenadoresPredeterminados() {
  List<Senamon> senamones1 = getGenerarSenamonesPredeterminados(1);
  List<Senamon> senamones2 = getGenerarSenamonesPredeterminados(2);

  return [
    Entrenador(
      nombre: 'Juan Diego',
      email: 'Juandiego@gmail.com',
      fechaNacimiento: DateTime(2003, 3, 8),
      experiencia: 100,
      batallasGanadas: 2,
      senamones: senamones1,
    ),
    Entrenador(nombre: 'Juan José',email: 'Juanjose@gmail.com',fechaNacimiento: DateTime(2007, 1, 1),experiencia: 300,batallasGanadas: 4, senamones: senamones2, ),
   Entrenador( nombre: 'Juan Daniel', email: 'Juandaniel@gmail.com', fechaNacimiento: DateTime(2010, 3, 2), experiencia: 100, batallasGanadas: 2,senamones: senamones1,),
    Entrenador(nombre: ' Pablo',email: 'Pablo23@gmail.com',fechaNacimiento: DateTime(2002, 4, 10),experiencia: 40,batallasGanadas: 5, senamones: senamones2,),
    Entrenador(nombre: 'Alejandro',email: 'Alenjandoll@gmail.com',fechaNacimiento: DateTime(2003, 2, 11),experiencia: 150,batallasGanadas: 3,senamones: senamones1),
  ];
}


 