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

Future<double> porcentajeCourse(
  CoursesRecord refCourse,
  DocumentReference refUser,
  bool isDemo,
) async {
  final firestore = FirebaseFirestore.instance;

  // Obtener los grupos de exámenes asociados al curso
  final queryGrupos = await firestore
      .collection('ExamGroups')
      .where('uid_Course', isEqualTo: refCourse.reference.id)
      .get();

  if (queryGrupos.docs.isEmpty) {
    return 0.0;
  }

  // Obtener los UIDs de los grupos
  final gruposIds = queryGrupos.docs.map((g) => g.id).toList();

  // Obtener los exámenes asociados a los grupos
  List<QuerySnapshot> examenesSnapshots = [];
  for (int i = 0; i < gruposIds.length; i += 30) {
    final subLista = gruposIds.sublist(i, (i + 30).clamp(0, gruposIds.length));

    final queryExamenes = await firestore
        .collection('examenes')
        .where('uid_Group', whereIn: subLista)
        .where('is_demo', isEqualTo: isDemo)
        .get();

    examenesSnapshots.add(queryExamenes);
  }

  // Combinar los resultados de todas las consultas de exámenes
  final examenesDocs =
      examenesSnapshots.expand((snapshot) => snapshot.docs).toList();

  if (examenesDocs.isEmpty) {
    return 0.0;
  }

  // Mapear los IDs de los exámenes
  final examenesIds = examenesDocs.map((e) => e.id).toList();

  // Obtener TODOS los resultados del usuario en una sola consulta
  final queryResultados = await firestore
      .collection('resultados')
      .where('estudiante_ref', isEqualTo: refUser.id)
      .where('examen_ref', whereIn: examenesIds)
      .where('type', isEqualTo: refCourse.courseType)
      .orderBy('created_date', descending: true)
      .get();

  // Mapear los últimos resultados por cada examen (según `created_date`)
  Map<String, DocumentSnapshot> ultimoResultadoPorExamen = {};
  for (var resultado in queryResultados.docs) {
    final examenRef = resultado['examen_ref'];

    if (!ultimoResultadoPorExamen.containsKey(examenRef)) {
      ultimoResultadoPorExamen[examenRef] = resultado;
    }
  }

  // Filtrar los resultados que tienen `fecha_fin_examen` lleno
  int totalExamenesCompletados =
      ultimoResultadoPorExamen.values.where((resultado) {
    final data = resultado.data() as Map<String, dynamic>?;
    final tieneFechaFin = data != null &&
        data.containsKey('fecha_fin_examen') &&
        data['fecha_fin_examen'] != null;
    return tieneFechaFin;
  }).length;

  // Calcular el porcentaje de progreso en escala de 0 a 100
  double progreso = ((totalExamenesCompletados / examenesDocs.length) * 100)
      .clamp(0.0, 100.0);

  return progreso;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
