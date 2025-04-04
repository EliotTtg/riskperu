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

Future<void> deleteRegister(
  String uidExamen,
  String uidUser,
  String uidCourse,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 1. Obtener las preguntas del examen
  QuerySnapshot preguntasSnapshot = await firestore
      .collection(
          'preguntas') // Suponiendo que esta es la colección de preguntas
      .where('examen_ref', isEqualTo: uidExamen)
      .get();

  List<String> preguntasIds =
      preguntasSnapshot.docs.map((doc) => doc.id).toList();

  // 2. Eliminar registros de respuestaState
  QuerySnapshot respuestaStateSnapshot = await firestore
      .collection('respuestaState')
      .where('uid_examen', isEqualTo: uidExamen)
      .where('uis_user', isEqualTo: uidUser)
      .get();

  for (QueryDocumentSnapshot doc in respuestaStateSnapshot.docs) {
    await doc.reference.delete();
  }

  // 3. Eliminar registros de users_Answers filtrando por uid_pregunta
  if (preguntasIds.isNotEmpty) {
    QuerySnapshot usersAnswersSnapshot = await firestore
        .collection('users_Answers')
        .where('uid_user', isEqualTo: uidUser)
        .where('uid_pregunta', whereIn: preguntasIds)
        .get();

    for (QueryDocumentSnapshot doc in usersAnswersSnapshot.docs) {
      await doc.reference.delete();
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
