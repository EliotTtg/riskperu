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

Future<void> createDetailsResult(String uidResult) async {
  try {
    final resultadoDoc = await FirebaseFirestore.instance
        .collection('resultados')
        .doc(uidResult)
        .get();

    if (!resultadoDoc.exists) {
      print("Resultado no encontrado.");
      return;
    }

    final examenRef = resultadoDoc.data()?['examen_ref'];
    final estudianteRef = resultadoDoc.data()?['estudiante_ref'];

    if (examenRef == null || estudianteRef == null) {
      print("Datos insuficientes en resultado.");
      return;
    }

    final tipos = [0, 1, 2];

    for (var tipo in tipos) {
      final preguntasQuery = await FirebaseFirestore.instance
          .collection('preguntas')
          .where('examen_ref', isEqualTo: examenRef)
          .where('type', isEqualTo: tipo)
          .get();

      final preguntas = preguntasQuery.docs;
      final totalPreguntas = preguntas.length;
      int respuestasCorrectas = 0;

      for (var pregunta in preguntas) {
        final uidPregunta = pregunta.id;

        final userAnswersQuery = await FirebaseFirestore.instance
            .collection('users_Answers')
            .where('uid_user', isEqualTo: estudianteRef)
            .where('uid_pregunta', isEqualTo: uidPregunta)
            .get();

        if (userAnswersQuery.docs.isEmpty) continue;

        final userAnswers =
            userAnswersQuery.docs.map((doc) => doc['respuesta_uid']).toSet();

        final correctAnswersQuery = await FirebaseFirestore.instance
            .collection('respuestas')
            .where('uid_pregunta', isEqualTo: uidPregunta)
            .where('es_correcta', isEqualTo: true)
            .get();

        final correctAnswers =
            correctAnswersQuery.docs.map((doc) => doc.id).toSet();

        if (userAnswers.containsAll(correctAnswers) &&
            correctAnswers.containsAll(userAnswers)) {
          respuestasCorrectas++;
        }
      }

      final porcentajeCorrectas =
          totalPreguntas > 0 ? (respuestasCorrectas / totalPreguntas) * 100 : 0;
      final notaTipo = (20 * porcentajeCorrectas) / 100;

      final detallesQuery = await FirebaseFirestore.instance
          .collection('detalles_resultados')
          .where('uidResultado', isEqualTo: uidResult)
          .where('type', isEqualTo: tipo)
          .get();

      if (detallesQuery.docs.isEmpty) {
        final newDetailRef = await FirebaseFirestore.instance
            .collection('detalles_resultados')
            .add({
          'uidResultado': uidResult,
          'respuestasCorrectas': respuestasCorrectas,
          'respuestasIncorrectas': totalPreguntas - respuestasCorrectas,
          'nota': notaTipo,
          'type': tipo,
          'porcentaje': porcentajeCorrectas.toInt(),
        });

        await newDetailRef.update({'uid': newDetailRef.id});
      } else {
        final detalleExistente = detallesQuery.docs.first;
        await detalleExistente.reference.update({
          'respuestasCorrectas': respuestasCorrectas,
          'respuestasIncorrectas': totalPreguntas - respuestasCorrectas,
          'nota': notaTipo,
          'porcentaje': porcentajeCorrectas.toInt(),
        });
      }
    }
  } catch (e) {
    print("Error en createDetailsResult: $e");
  }
}
