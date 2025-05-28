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

  // Filtrar preguntas válidas
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

  // Obtener IDs de todas las preguntas para consultas más eficientes
  final preguntaIds = preguntas.map((p) => p.id).toList();

  // Consultar solo las respuestas relacionadas con las preguntas del examen
  final respuestasQuery = await FirebaseFirestore.instance
      .collection('respuestas')
      .where('uid_pregunta', whereIn: preguntaIds)
      .get();

  final respuestas = respuestasQuery.docs;

  // Consultar solo las respuestas del usuario para este examen
  final userAnswersQuery = await FirebaseFirestore.instance
      .collection('users_Answers')
      .where('uid_user', isEqualTo: uidUsuario)
      .where('uid_pregunta', whereIn: preguntaIds)
      .get();

  final userAnswers = userAnswersQuery.docs;

  // Agrupar preguntas por tipo
  final tipo0 = preguntas.where((p) => p['type'] == 0).toList();
  final tipo1 = preguntas.where((p) => p['type'] == 1).toList();
  final tipo2 = preguntas.where((p) => p['type'] == 2).toList();

  double puntuacionTotal = 0.0;

  // Evaluar cada tipo de pregunta
  for (final tipoPreguntas in [tipo0, tipo1, tipo2]) {
    if (tipoPreguntas.isEmpty) continue;

    double puntajeTipo = 0.0;
    final puntajeTotalTipo = puntajePorPregunta * tipoPreguntas.length;

    for (final pregunta in tipoPreguntas) {
      final String preguntaId = pregunta.id;

      // Obtener respuestas correctas para esta pregunta
      final respuestasCorrectas = respuestas
          .where((r) =>
              r['uid_pregunta'] == preguntaId && r['es_correcta'] == true)
          .toList();

      if (respuestasCorrectas.isEmpty) continue;

      // Obtener respuestas del usuario para esta pregunta
      final respuestasUsuario =
          userAnswers.where((ua) => ua['uid_pregunta'] == preguntaId).toList();

      if (respuestasUsuario.isEmpty) continue;

      // Verificar si el usuario seleccionó exactamente todas las respuestas correctas
      final uidsRespuestasCorrectas =
          respuestasCorrectas.map((r) => r.id).toSet();
      final uidsRespuestasUsuario =
          respuestasUsuario.map((ua) => ua['respuesta_uid']).toSet();

      // La respuesta es correcta si el usuario seleccionó todas las respuestas correctas
      // y no seleccionó ninguna respuesta incorrecta
      if (uidsRespuestasCorrectas.difference(uidsRespuestasUsuario).isEmpty &&
          uidsRespuestasUsuario.difference(uidsRespuestasCorrectas).isEmpty) {
        puntajeTipo += puntajePorPregunta;
      }
    }

    puntuacionTotal += puntajeTipo;
  }

  // Asegurar que la nota no sea negativa ni mayor a la nota máxima
  return puntuacionTotal.clamp(0.0, notaMaxima);
}
