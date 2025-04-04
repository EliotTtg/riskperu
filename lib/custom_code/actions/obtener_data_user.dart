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

Future<List<UsersNumberStruct>> obtenerDataUser(int category) async {
  List<UsersNumberStruct> userCounts = [];

  // Definir el uid_plan y el nombre de la categoría según el parámetro category
  String uidPlan = '';
  String categoryName = '';

  if (category == 1) {
    uidPlan = 'dsoyv0QNPVgmpaFwV2zX'; // Gratis
    categoryName = 'Gratis';
  } else if (category == 2) {
    uidPlan = 's3p9KqQykFwY4jIDgjrf'; // Básico
    categoryName = 'Básico';
  } else if (category == 3) {
    uidPlan = 'kVUX5FsIacYYLG5C6Ji6'; // Premium
    categoryName = 'Premium';
  } else {
    // Si la categoría no es válida, devolver un valor por defecto
    return [
      UsersNumberStruct(
        category: 'unknown',
        number: 0,
      )
    ];
  }

  try {
    // Consultar la colección 'users_plans' para los usuarios con el uid_plan correspondiente
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users_plans')
        .where('uid_plan', isEqualTo: uidPlan)
        .get();

    // Contar los usuarios encontrados
    int userCount = querySnapshot.docs.length;

    // Añadir el conteo de usuarios a la lista con el nombre de la categoría
    userCounts.add(UsersNumberStruct(
      category: categoryName,
      number: userCount,
    ));
  } catch (e) {
    // Manejo de errores si ocurre algún problema al consultar Firestore
    userCounts.add(UsersNumberStruct(
      category: 'error',
      number: 0,
    ));
    print('Error al consultar Firestore: $e');
  }

  // Retornar los conteos
  return userCounts.isEmpty
      ? [UsersNumberStruct(category: 'no_data', number: 0)]
      : userCounts;
}
