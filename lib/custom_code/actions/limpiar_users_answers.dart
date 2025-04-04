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

Future<void> limpiarUsersAnswers(
    String uidPregunta, String respuestaUidReferencia) async {
  // Obtener los documentos de users_Answers relacionados con la uid_pregunta
  final querySnapshot = await FirebaseFirestore.instance
      .collection('users_Answers')
      .where('uid_pregunta', isEqualTo: uidPregunta)
      .get();

  final docs = querySnapshot.docs;

  for (final doc in docs) {
    // Verificar si la respuesta_uid del documento coincide con la referencia
    if (doc['respuesta_uid'] != respuestaUidReferencia) {
      // Si no coincide, borrar el documento
      await FirebaseFirestore.instance
          .collection('users_Answers')
          .doc(doc.id)
          .delete();
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
