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

Future<void> validarResultado(
  String refPregunta,
  String refRespuesta,
  String refUser,
  String refExamen,
) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // 1. Verificar si ya existe esa respuesta seleccionada
    final existingAnswerQuery = await firestore
        .collection('users_Answers')
        .where('uid_user', isEqualTo: refUser)
        .where('uid_pregunta', isEqualTo: refPregunta)
        .where('uid_examen', isEqualTo: refExamen)
        .where('respuesta_uid', isEqualTo: refRespuesta)
        .get();

    if (existingAnswerQuery.docs.isNotEmpty) {
      // Si ya existe, eliminarla
      for (final doc in existingAnswerQuery.docs) {
        await doc.reference.delete();
      }
      return;
    }

    // 2. Obtener la cantidad de respuestas correctas para esa pregunta
    final correctAnswersQuery = await firestore
        .collection('respuestas')
        .where('uid_pregunta', isEqualTo: refPregunta)
        .where('es_correcta', isEqualTo: true)
        .get();

    final correctCount = correctAnswersQuery.docs.length;

    // 3. Verificar cuántas respuestas ha marcado el usuario para esa pregunta
    final userAnswersQuery = await firestore
        .collection('users_Answers')
        .where('uid_user', isEqualTo: refUser)
        .where('uid_pregunta', isEqualTo: refPregunta)
        .where('uid_examen', isEqualTo: refExamen)
        .get();

    final userAnswerCount = userAnswersQuery.docs.length;

    if (userAnswerCount < correctCount) {
      // 4. Crear nuevo documento con uid como ID
      final newDocRef = firestore.collection('users_Answers').doc();
      await newDocRef.set({
        'uid': newDocRef.id,
        'uid_user': refUser,
        'uid_pregunta': refPregunta,
        'uid_examen': refExamen,
        'respuesta_uid': refRespuesta,
      });
    } else {
      print(
          'Límite de respuestas correctas alcanzado. No se registró nueva respuesta.');
    }
  } catch (e) {
    print('Error en validarResultado: $e');
  }
}
