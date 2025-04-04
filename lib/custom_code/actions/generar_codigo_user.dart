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

Future<String> generarCodigoUser() async {
  try {
    // Obtener todos los documentos de la colección 'users'
    final proveedoresSnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    // Verificar que los documentos tengan el campo 'codigo'
    final existingCodes = proveedoresSnapshot.docs
        .where((doc) => doc.data().containsKey(
            'codigo')) // Validación de que el campo 'codigo' exista
        .map((doc) => doc['codigo'])
        .toSet();

    int maxNumber = 0;

    // Si no hay ningún código, empezar con 1
    if (existingCodes.isEmpty) {
      maxNumber = 1;
    } else {
      // Encuentra el número más alto
      for (var code in existingCodes) {
        final parts = code.split('-');
        if (parts.length == 2 && parts[0] == 'USR') {
          final number = int.tryParse(parts[1]);
          if (number != null && number > maxNumber) {
            maxNumber = number;
          }
        }
      }

      // Incrementa el número más alto en 1
      maxNumber += 1;
    }

    // Generar el nuevo código
    final nuevoNumero = maxNumber.toString().padLeft(3, '0');
    final nuevoCodigo = 'USR-$nuevoNumero';

    // Retornar el nuevo código
    return nuevoCodigo;
  } catch (e) {
    // En caso de error, retornar un mensaje o manejarlo según tu lógica
    print('Error al generar código de usuario: $e');
    return 'USR-001'; // Retornar un código por defecto en caso de error
  }
}
