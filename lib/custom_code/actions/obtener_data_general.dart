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

Future<List<UsersNumberStruct>> obtenerDataGeneral(String estudianteRef) async {
  List<UsersNumberStruct> resultsData = [];

  try {
    // Consultar la colección 'resultados' para los registros del estudiante dado
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('resultados')
        .where('estudiante_ref', isEqualTo: estudianteRef)
        .get();

    int totalCorrectas = 0;
    int totalIncorrectas = 0;
    int examenesPendientes = 0;

    // Iterar sobre los documentos para calcular correctos, incorrectos y pendientes
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      if (data['fecha_inicio_examen'] == null) {
        // Incrementar el contador de pendientes si no hay fecha de inicio
        examenesPendientes++;
        continue;
      }

      // Obtener la calificación o asignar 0 si no existe
      double calificacion =
          data['calificacion'] != null ? data['calificacion'].toDouble() : 0.0;
      // Redondear la calificación a un número entero
      int calificacionRedondeada = calificacion.round();

      // Sumar las correctas
      totalCorrectas += calificacionRedondeada;

      // Calcular las incorrectas
      int incorrectas = 20 -
          calificacionRedondeada; // Asumimos que el examen tiene 20 preguntas
      totalIncorrectas += incorrectas;
    }

    // Agregar los resultados generales
    resultsData
        .add(UsersNumberStruct(category: 'Correctas', number: totalCorrectas));
    resultsData.add(
        UsersNumberStruct(category: 'Incorrectas', number: totalIncorrectas));
    resultsData.add(
        UsersNumberStruct(category: 'Pendientes', number: examenesPendientes));
  } catch (e) {
    // En caso de error, devolver datos de error
    resultsData.add(UsersNumberStruct(category: 'error', number: 0));
    print('Error al procesar los resultados: $e');
  }

  return resultsData.isEmpty
      ? [UsersNumberStruct(category: 'no_data', number: 0)]
      : resultsData;
}
