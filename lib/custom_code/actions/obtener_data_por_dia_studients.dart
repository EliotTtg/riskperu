// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';

Future<List<UsersNumberStruct>> obtenerDataPorDiaStudients(int category) async {
  List<UsersNumberStruct> resultsData = [];

  try {
    // Consultar todos los registros de la colección 'resultados'
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('resultados').get();

    // Crear un mapa para contar las respuestas correctas e incorrectas por día de la semana
    Map<String, int> respuestasPorDia = {
      'Lunes': 0,
      'Martes': 0,
      'Miércoles': 0,
      'Jueves': 0,
      'Viernes': 0,
      'Sábado': 0,
      'Domingo': 0,
    };

    // Iterar sobre los documentos para calcular correctas e incorrectas por día
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Verificar si la fecha de inicio del examen existe
      if (data['fecha_inicio_examen'] == null) {
        continue; // Si no existe la fecha, saltamos al siguiente documento
      }

      // Obtener la calificación o asignar 0 si no existe
      double calificacion =
          data['calificacion'] != null ? data['calificacion'].toDouble() : 0.0;
      // Redondear la calificación a un número entero
      int calificacionRedondeada = calificacion.round();

      // Obtener la fecha de inicio del examen y convertirla a DateTime
      Timestamp fechaInicioExamen = data['fecha_inicio_examen'];
      DateTime date = fechaInicioExamen.toDate();
      int diaSemanaIndex = date.weekday;

      // Mapear el índice del día de la semana a su nombre en español
      String diaTraducido = {
            1: 'Lunes',
            2: 'Martes',
            3: 'Miércoles',
            4: 'Jueves',
            5: 'Viernes',
            6: 'Sábado',
            7: 'Domingo',
          }[diaSemanaIndex] ??
          'Desconocido';

      // Categoría 1: Sumar las correctas
      if (category == 1 && calificacionRedondeada > 0) {
        respuestasPorDia[diaTraducido] =
            (respuestasPorDia[diaTraducido] ?? 0) + calificacionRedondeada;
      }

      // Categoría 2: Calcular incorrectas
      if (category == 2) {
        int incorrectas = 20 -
            calificacionRedondeada; // Asumimos que el examen tiene 20 preguntas
        respuestasPorDia[diaTraducido] =
            (respuestasPorDia[diaTraducido] ?? 0) + incorrectas;
      }
    }

    // Transformar el mapa en una lista de resultados
    respuestasPorDia.forEach((dia, total) {
      resultsData.add(UsersNumberStruct(
        category: dia,
        number: total,
      ));
    });
  } catch (e) {
    // En caso de error, agregar un resultado de error
    resultsData.add(UsersNumberStruct(category: 'error', number: 0));
    print('Error al procesar los resultados: $e');
  }

  return resultsData.isEmpty
      ? [UsersNumberStruct(category: 'no_data', number: 0)]
      : resultsData;
}
