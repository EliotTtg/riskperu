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

Future<String> codeCertificate(
  String refUser, // Referencia del usuario
  String refCourse, // Referencia del curso
) async {
  // 1. Crear la abreviatura del nombre de usuario
  String userAbbreviation = _createAbbreviation(refUser);

  // 2. Crear la abreviatura del curso
  String courseAbbreviation = _createAbbreviation(refCourse);

  // 3. Obtener la fecha y hora actuales del sistema
  DateTime now = DateTime.now();

  // 4. Formatear la fecha de manera compacta (año, mes, día)
  String formattedDate =
      '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}'; // Año, mes, día

  // 5. Formatear la hora de manera compacta (hora, minuto)
  String formattedTime =
      '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}'; // Hora y minuto

  // 6. Concatenar los valores obtenidos para formar el código final
  String code =
      '$userAbbreviation-$courseAbbreviation-$formattedDate-$formattedTime';

  return code; // Devuelve el código generado
}

// Función para crear una abreviatura a partir de una referencia (nombre)
String _createAbbreviation(String input) {
  List<String> words = input.split(RegExp(
      r'[^a-zA-Z0-9]')); // Divide por espacios o caracteres no alfanuméricos
  String abbreviation = '';

  for (var word in words) {
    if (word.isNotEmpty) {
      abbreviation +=
          word[0].toUpperCase(); // Tomamos la primera letra de cada palabra
    }
  }
  return abbreviation; // Devolvemos la abreviatura creada
}
