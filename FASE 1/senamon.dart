class Senamon {
  // Atributos privados
  String _nombre, _fase, _descripcion, _tipo;
  int _nivel, _puntosSalud, _nivelAtaque, _nivelEnergia;
  double _peso;

  // Constructor
  Senamon({
    required String nombre,
    required int nivel,
    required String tipo,
    required double peso,
    required int puntosSalud,
    required int nivelAtaque,
    required String fase,
    required int nivelEnergia,
    required String descripcion,
  })  : _nombre = nombre,
        _nivel = nivel,
        _tipo = tipo,
        _peso = peso,
        _puntosSalud = puntosSalud,
        _nivelAtaque = nivelAtaque,
        _fase = fase,
        _nivelEnergia = nivelEnergia,
        _descripcion = descripcion;

  // Setters y getters
  void setNombre(String nombre) => _nombre = nombre;
  String getNombre() => _nombre;

  void setNivel(int nivel) => _nivel = nivel;
  int getNivel() => _nivel;

  void setTipo(String tipo) => _tipo = tipo;
  String getTipo() => _tipo;

  void setPeso(double peso) => _peso = peso;
  double getPeso() => _peso;

  void setPuntosSalud(int puntosSalud) => _puntosSalud = puntosSalud;
  int getPuntosSalud() => _puntosSalud;

  void setNivelAtaque(int nivelAtaque) => _nivelAtaque = nivelAtaque;
  int getNivelAtaque() => _nivelAtaque;

  void setFase(String fase) => _fase = fase;
  String getFase() => _fase;

  void setNivelEnergia(int nivelEnergia) => _nivelEnergia = nivelEnergia;
  int getNivelEnergia() => _nivelEnergia;

  void setDescripcion(String descripcion) => _descripcion = descripcion;
  String getDescripcion() => _descripcion;
}

// Función para obtener los Senamones predeterminados
List<Senamon> getGenerarSenamonesPredeterminados(int entrenadorId) {
  if (entrenadorId == 1) {
    return [

      Senamon( nombre: 'Aguators', nivel: 2, tipo: 'Agua', peso: 13.20, puntosSalud: 110, nivelAtaque: 80, fase: 'Normal', nivelEnergia: 90, descripcion: 'Es de tipo agua, pequeño y azul.',),
      Senamon( nombre: 'Fuegman', nivel: 6, tipo: 'Fuego', peso: 11.20, puntosSalud: 100,nivelAtaque: 70, fase: 'Normal', nivelEnergia: 80, descripcion: 'Es de tipo fuego, color amarillo y de 4 patas', ),
      Senamon(nombre: 'Piedmoan', nivel: 1, tipo: 'Tierra', peso: 11.30, puntosSalud: 90, nivelAtaque: 50, fase: 'Juvenil', nivelEnergia: 60, descripcion: 'Es de color cafe combinado con rojo con espinas'),
      Senamon(nombre: 'Pidramen', nivel: 1, tipo: 'Piedra', peso: 30.0, puntosSalud: 95, nivelAtaque: 60, fase: 'juvenil', nivelEnergia: 90, descripcion: 'Senamon de color gris de tipo piedra'),
      Senamon(nombre: 'Squirtle',nivel:  5, tipo: 'hielo', peso: 12.0, puntosSalud: 80, nivelAtaque: 35, fase: "Inicial", nivelEnergia: 60, descripcion: "Senamon familiar de los de agua."),
      Senamon(nombre: 'Pikachu',nivel:  5, tipo: 'Electrico', peso: 5.0, puntosSalud: 85, nivelAtaque: 50, fase: "Juvenil", nivelEnergia: 90, descripcion: "senamon amarillo de electricidad"),
      Senamon(nombre: 'Eevee',nivel:  6, tipo: 'Aire', peso: 6.0, puntosSalud: 60, nivelAtaque: 50, fase: "Inicial", nivelEnergia: 80, descripcion: "Es de color rosado, senamon volador"),

    
      
    ];
  } else {
    return [
    Senamon( nombre: 'Fuegozard', nivel: 3, tipo: 'Fuego', peso: 12.5, puntosSalud: 100, nivelAtaque: 30, fase: 'Normal', nivelEnergia: 50, descripcion: 'Un dragón de fuego.'),
    Senamon(nombre: 'Terrazz', nivel: 3, tipo: 'Tierra', peso: 11.2, puntosSalud: 85, nivelAtaque: 29, fase: "Inicial", nivelEnergia: 50, descripcion: "Un guardián de la tierra."),
    Senamon (nombre: "Ventrax", nivel: 2, tipo: "Aire", peso: 7.5, puntosSalud: 70, nivelAtaque: 18, fase: "Avanzado", nivelEnergia: 30, descripcion: 'Una criatura del aire.'),
    Senamon (nombre: "Bulbasaur", nivel: 5, tipo: "Planta", peso:13.5, puntosSalud: 90, nivelAtaque: 17, fase: "Avanzado", nivelEnergia: 90, descripcion: 'Un senamon de planta'),
   Senamon(nombre: 'octachor',nivel:  8, tipo: 'Electrico', peso: 14.05, puntosSalud: 76, nivelAtaque: 30, fase: "Juvenil", nivelEnergia: 80, descripcion: "senamon amarillo de electricidad"),
   Senamon( nombre: 'sea', nivel: 2, tipo: 'Agua', peso: 20.20, puntosSalud: 80, nivelAtaque: 70, fase: 'Normal', nivelEnergia: 70, descripcion: 'Es de tipo agua, pequeño y azul.',),
   Senamon(nombre: 'Flomen', nivel: 5, tipo: 'Hierva', peso: 13.10,puntosSalud: 30, nivelAtaque: 40, fase: 'juvenil', nivelEnergia: 50, descripcion: 'pequeño y gordito'),
    ];
  }
}
