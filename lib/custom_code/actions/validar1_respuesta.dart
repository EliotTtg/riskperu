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

Future validar1Respuesta(
  PreguntasRecord pregunta,
  RespuestasRecord respuesta,
) async {
  try {
    // Paso 1: Obtener todas las respuestas relacionadas con la pregunta

    QuerySnapshot respuestasSnapshot = await FirebaseFirestore.instance
        .collection('respuestas')
        .where('uid_pregunta', isEqualTo: pregunta.uid)
        .get();

    // Paso 2: Actualizar el campo es_correcta para cada respuesta
    for (var respuestaDoc in respuestasSnapshot.docs) {
      // Verificar si el id de la respuesta actual coincide con el documento en la base de datos
      if (respuestaDoc.id == respuesta.reference.id) {
        await respuestaDoc.reference.update({'es_correcta': true});
      } else {
        await respuestaDoc.reference.update({'es_correcta': false});
      }
    }
  } catch (e) {
    // Manejo de errores
    throw Exception('Hubo un error al validar la respuesta.');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
