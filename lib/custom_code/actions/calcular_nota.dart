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

Future<double> calcularNota(
  String uidUsuario,
  String examenRef,
) async {
  // Consultar las preguntas relacionadas con el examen
  final preguntasQuery = await FirebaseFirestore.instance
      .collection('preguntas')
      .where('examen_ref', isEqualTo: examenRef)
      .get();
  final preguntas = preguntasQuery.docs
      .where((p) => p.data().containsKey('uid_pregunta'))
      .toList();

  if (preguntas.isEmpty) {
    return 0.0; // Si no hay preguntas, la nota es 0
  }

  // Definir la nota máxima
  final double notaMaxima = 20.0;

  // Calcular el puntaje por pregunta
  final double puntajePorPregunta = notaMaxima / preguntas.length;

  // Contar las preguntas por tipo
  final tipo0 = preguntas.where((p) => p['type'] == 0).toList();
  final tipo1 = preguntas.where((p) => p['type'] == 1).toList();
  final tipo2 = preguntas.where((p) => p['type'] == 2).toList();

  // Consultar todas las respuestas con filtro en uid_pregunta
  final respuestasQuery =
      await FirebaseFirestore.instance.collection('respuestas').get();
  final respuestas = respuestasQuery.docs
      .where((r) => r.data().containsKey('uid_pregunta'))
      .toList();

  // Consultar las respuestas del usuario con filtro en uid_pregunta
  final userAnswersQuery = await FirebaseFirestore.instance
      .collection('users_Answers')
      .where('uid_user', isEqualTo: uidUsuario)
      .get();
  final userAnswers = userAnswersQuery.docs
      .where((ua) => ua.data().containsKey('uid_pregunta'))
      .toList();

  double puntuacionTotal = 0.0;

  // Evaluar cada tipo de pregunta
  for (final tipo in [tipo0, tipo1, tipo2]) {
    if (tipo.isNotEmpty) {
      int correctasPorTipo = 0;

      for (final pregunta in tipo) {
        final respuestasDePregunta =
            respuestas.where((r) => r['uid_pregunta'] == pregunta.id).toList();

        if (respuestasDePregunta.isEmpty) {
          continue;
        }

        final respuestasCorrectas = respuestasDePregunta
            .where((r) => r['es_correcta'] == true)
            .toList();

        final respuestasUsuario = userAnswers
            .where((ua) => ua['uid_pregunta'] == pregunta.id)
            .toList();

        if (respuestasUsuario.isEmpty) {
          continue;
        }

        // Verificar si el usuario seleccionó exactamente todas las respuestas correctas
        final uidsRespuestasCorrectas =
            respuestasCorrectas.map((r) => r.id).toSet();
        final uidsRespuestasUsuario =
            respuestasUsuario.map((ua) => ua['respuesta_uid']).toSet();

        if (uidsRespuestasCorrectas.difference(uidsRespuestasUsuario).isEmpty &&
            uidsRespuestasUsuario.difference(uidsRespuestasCorrectas).isEmpty) {
          correctasPorTipo++;
        }
      }

      // Sumar la puntuación correspondiente a este tipo de preguntas
      puntuacionTotal +=
          (correctasPorTipo / tipo.length) * (puntajePorPregunta * tipo.length);
    }
  }

  // Asegurar que la nota no sea negativa ni mayor a 20
  return puntuacionTotal.clamp(0.0, 20.0);
}
