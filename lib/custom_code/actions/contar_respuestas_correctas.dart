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

Future<int> contarRespuestasCorrectas(
  String uidUsuario,
  String examenRef,
) async {
  int preguntasCorrectas = 0;

  // Obtener todas las preguntas del examen
  final preguntasQuery = await FirebaseFirestore.instance
      .collection('preguntas')
      .where('examen_ref', isEqualTo: examenRef)
      .get();

  final preguntas = preguntasQuery.docs;

  for (var pregunta in preguntas) {
    final uidPregunta = pregunta.id;

    // Obtener las respuestas correctas de la pregunta
    final correctAnswersQuery = await FirebaseFirestore.instance
        .collection('respuestas')
        .where('uid_pregunta', isEqualTo: uidPregunta)
        .where('es_correcta', isEqualTo: true)
        .get();

    final correctAnswers =
        correctAnswersQuery.docs.map((doc) => doc.id).toSet();

    // Obtener las respuestas del usuario a la pregunta
    final userAnswersQuery = await FirebaseFirestore.instance
        .collection('users_Answers')
        .where('uid_user', isEqualTo: uidUsuario)
        .where('uid_pregunta', isEqualTo: uidPregunta)
        .get();

    final userAnswers =
        userAnswersQuery.docs.map((doc) => doc['respuesta_uid']).toSet();

    // Comparar respuestas: deben coincidir exactamente con las respuestas correctas
    if (userAnswers.isNotEmpty &&
        userAnswers.containsAll(correctAnswers) &&
        correctAnswers.containsAll(userAnswers)) {
      preguntasCorrectas++;
    }
  }

  return preguntasCorrectas;
}
