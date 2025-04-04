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

import 'package:intl/intl.dart';

Future<List<UsersNumberStruct>> obtenerDataAdmin() async {
  List<UsersNumberStruct> resultsData = [];

  try {
    // Consultar la cantidad de registros en la colección 'RegisterSimulator'
    int simuladoresUsados =
        (await FirebaseFirestore.instance.collection('RegisterSimulator').get())
            .docs
            .length;

    // Obtener los uid_courses de la tabla users_Courses
    QuerySnapshot usersCoursesSnapshot =
        await FirebaseFirestore.instance.collection('users_Courses').get();
    List<String> uidCourses = usersCoursesSnapshot.docs
        .map((doc) => doc['uid_courses'] as String)
        .toList();

    // Consultar la colección 'Courses' para contar los cursos con course_type = 2 y que estén en uidCourses
    int cursosComprados = (await FirebaseFirestore.instance
            .collection('Courses')
            .where('course_type', isEqualTo: 2)
            .where(FieldPath.documentId, whereIn: uidCourses)
            .get())
        .docs
        .length;

    // Agregar los resultados generales
    resultsData.add(UsersNumberStruct(
        category: 'Simuladores Usados', number: simuladoresUsados));
    resultsData.add(UsersNumberStruct(
        category: 'Simuladores Comprados', number: cursosComprados));
  } catch (e) {
    // En caso de error, devolver datos de error
    resultsData.add(UsersNumberStruct(category: 'error', number: 0));
    print('Error al procesar los datos: $e');
  }

  return resultsData.isEmpty
      ? [UsersNumberStruct(category: 'no_data', number: 0)]
      : resultsData;
}
