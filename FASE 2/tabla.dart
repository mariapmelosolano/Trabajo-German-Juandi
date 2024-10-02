class TablaBatalla {
  // Tabla de efectividad ampliada según los tipos proporcionados.
  static const Map<String, Map<String, double>> efectividad = {
    'Fuego': {'Agua': 0.5, 'Hierba': 2.0, 'Fuego': 1.0, 'Eléctrico': 1.0, 'Roca': 0.5, 'Tierra': 1.0, 'Hielo': 2.0, 'Aire': 1.0, 'Planta': 2.0},
    'Agua': {'Fuego': 2.0, 'Hierba': 0.5, 'Agua': 1.0, 'Eléctrico': 0.5, 'Roca': 2.0, 'Tierra': 2.0, 'Hielo': 1.0, 'Aire': 1.0, 'Planta': 0.5},
    'Hierba': {'Fuego': 0.5, 'Agua': 2.0, 'Hierba': 1.0, 'Eléctrico': 1.0, 'Roca': 2.0, 'Tierra': 2.0, 'Hielo': 0.5, 'Aire': 0.5, 'Planta': 1.0},
    'Eléctrico': {'Fuego': 1.0, 'Agua': 2.0, 'Hierba': 1.0, 'Eléctrico': 1.0, 'Roca': 0.5, 'Tierra': 0.5, 'Hielo': 1.0, 'Aire': 2.0, 'Planta': 1.0},
    'Roca': {'Fuego': 2.0, 'Agua': 0.5, 'Hierba': 0.5, 'Eléctrico': 1.0, 'Roca': 1.0, 'Tierra': 0.5, 'Hielo': 2.0, 'Aire': 2.0, 'Planta': 1.0},
    'Tierra': {'Fuego': 2.0, 'Agua': 1.0, 'Hierba': 0.5, 'Eléctrico': 2.0, 'Roca': 2.0, 'Tierra': 1.0, 'Hielo': 0.5, 'Aire': 0.5, 'Planta': 1.0},
    'Hielo': {'Fuego': 0.5, 'Agua': 0.5, 'Hierba': 2.0, 'Eléctrico': 1.0, 'Roca': 1.0, 'Tierra': 2.0, 'Hielo': 1.0, 'Aire': 2.0, 'Planta': 2.0},
    'Aire': {'Fuego': 1.0, 'Agua': 1.0, 'Hierba': 2.0, 'Eléctrico': 0.5, 'Roca': 0.5, 'Tierra': 1.0, 'Hielo': 1.0, 'Aire': 1.0, 'Planta': 2.0},
    'Planta': {'Fuego': 0.5, 'Agua': 2.0, 'Hierba': 1.0, 'Eléctrico': 1.0, 'Roca': 1.0, 'Tierra': 2.0, 'Hielo': 1.0, 'Aire': 0.5, 'Planta': 1.0},
  };

  static double obtenerMultiplicador(String tipoAtacante, String tipoDefensor) {
    return efectividad[tipoAtacante]?[tipoDefensor] ?? 1.0;
  }
}


  