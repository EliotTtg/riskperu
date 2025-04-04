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

Future<void> actualizarResultadoExamen(String uidResultado) async {
  try {
    final firestore = FirebaseFirestore.instance;

    // Obtener referencia del documento
    final resultadoRef = firestore.collection('resultados').doc(uidResultado);
    final resultadoSnapshot = await resultadoRef.get();

    if (!resultadoSnapshot.exists) {
      throw Exception('El resultado del examen no existe.');
    }

    final resultadoData = resultadoSnapshot.data();
    if (resultadoData == null) {
      throw Exception('No se pudo obtener la información del resultado.');
    }

    final estudianteRef = resultadoData['estudiante_ref'];
    final examenRef = resultadoData['examen_ref'];
    final fechaInicioExamen =
        (resultadoData['fecha_inicio_examen'] as Timestamp?)?.toDate();

    if (estudianteRef == null ||
        examenRef == null ||
        fechaInicioExamen == null) {
      throw Exception('Faltan datos esenciales en el resultado.');
    }

    // Obtener datos del examen
    final examenSnapshot =
        await firestore.collection('examenes').doc(examenRef).get();

    if (!examenSnapshot.exists) {
      throw Exception('El examen no existe.');
    }

    final tiempoLimite = examenSnapshot.data()?['tiempo_limite'] as int?;
    if (tiempoLimite == null || tiempoLimite <= 0) {
      throw Exception('Tiempo límite inválido.');
    }

    // Ejecutar cálculos en paralelo
    final results = await Future.wait([
      calcularNota(estudianteRef, examenRef),
      contarRespuestasCorrectas(estudianteRef, examenRef),
      createDetailsResult(uidResultado),
    ]);

    final calificacion = results[0] as double? ?? 0.0;
    final cantidadCorrectas = results[1] as int? ?? 0;

    // Calcular tiempos
    final fechaActual = DateTime.now();
    int tiempoTranscurridoMilisegundos =
        fechaActual.difference(fechaInicioExamen).inMilliseconds;

    final tiempoMaximoMilisegundos = tiempoLimite * 60000;

    if (tiempoTranscurridoMilisegundos > tiempoMaximoMilisegundos) {
      tiempoTranscurridoMilisegundos = tiempoMaximoMilisegundos;
    }

    final tiempoRestante =
        formatTiempoRestante(fechaInicioExamen, fechaActual, tiempoLimite);

    // Actualizar el documento
    await resultadoRef.update({
      'calificacion': calificacion,
      'fecha_fin_examen': fechaActual,
      'tiempo_restante': tiempoRestante,
      'tiempo_transcurrido': tiempoTranscurridoMilisegundos,
      'CantidadCorrectas': cantidadCorrectas,
    });
  } catch (e) {
    debugPrint('Error en actualizarResultadoExamen: $e');
  }
}
