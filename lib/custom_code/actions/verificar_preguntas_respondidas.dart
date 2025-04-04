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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> verificarPreguntasRespondidas(
  String uidUsuario,
  String examenRef,
) async {
  try {
    // Consultar todas las preguntas del examen
    final preguntasQuery = await FirebaseFirestore.instance
        .collection('preguntas')
        .where('examen_ref', isEqualTo: examenRef)
        .get();
    final preguntas = preguntasQuery.docs;

    if (preguntas.isEmpty) {
      return true; // Si no hay preguntas en el examen, se considera completo.
    }

    // Consultar todas las respuestas del usuario para este examen
    final userAnswersQuery = await FirebaseFirestore.instance
        .collection('users_Answers')
        .where('uid_user', isEqualTo: uidUsuario)
        .where('examen_ref',
            isEqualTo: examenRef) // Filtrar respuestas por examen
        .get();
    final userAnswers = userAnswersQuery.docs;

    // Crear un mapa donde la clave es el ID de la pregunta y el valor es el número de respuestas dadas
    Map<String, int> respuestasPorPregunta = {};

    for (var answer in userAnswers) {
      if (answer.data().containsKey('uid_pregunta')) {
        String preguntaId = answer['uid_pregunta'];
        respuestasPorPregunta[preguntaId] =
            (respuestasPorPregunta[preguntaId] ?? 0) + 1;
      }
    }

    // Verificar si cada pregunta tiene al menos una respuesta
    for (final pregunta in preguntas) {
      if (!respuestasPorPregunta.containsKey(pregunta.id)) {
        return false; // Si una pregunta no tiene ninguna respuesta, retornar false.
      }
    }

    return true; // Si todas las preguntas tienen al menos una respuesta, retornar true.
  } catch (e) {
    debugPrint("Error en verificarPreguntasRespondidas: $e");
    return false; // En caso de error, se considera que faltan respuestas.
  }
}
