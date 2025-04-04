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

Future<double> totalActividadesCourse(CoursesRecord refCourse) async {
  // Paso 1: Obtener las sesiones relacionadas con el curso usando el uid_Course
  QuerySnapshot sessionsSnapshot = await FirebaseFirestore.instance
      .collection('Session')
      .where('uid_Course', isEqualTo: refCourse.uid)
      .get();

  // Paso 2: Obtener los módulos relacionados con esas sesiones
  int totalActivities = 0;

  for (var sessionDoc in sessionsSnapshot.docs) {
    // Para cada sesión, obtenemos los módulos relacionados
    QuerySnapshot modulesSnapshot = await FirebaseFirestore.instance
        .collection('Module')
        .where('uid_Session', isEqualTo: sessionDoc.id)
        .get();

    // Paso 3: Para cada módulo, obtenemos los ModuleClass relacionados
    for (var moduleDoc in modulesSnapshot.docs) {
      // Para cada módulo, obtenemos los ModuleClass relacionados
      QuerySnapshot moduleClassesSnapshot = await FirebaseFirestore.instance
          .collection('ModuleClass')
          .where('uid_Module', isEqualTo: moduleDoc.id)
          .get();

      // Contamos cuántos ModuleClass están asociados a este módulo
      totalActivities += moduleClassesSnapshot.docs.length;
    }
  }

  // Paso 4: Retornar el total de actividades (clases) del curso
  return totalActivities.toDouble(); // Retorna como un número decimal
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
