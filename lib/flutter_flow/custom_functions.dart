import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String dateTimeFormat(DateTime datetime) {
  final DateFormat formatter =
      DateFormat('d \'de\' MMMM \'de\' y HH:mm', 'es_ES');
  return formatter.format(datetime);
}

String convertirVideo(String urlVideo) {
  final videoPath = urlVideo;
  return videoPath;
}

String listOrden(List<String> lista) {
  if (lista.isEmpty) return '';

  if (lista.length == 1) return lista[0];

  String result = lista.sublist(0, lista.length - 1).join(', ');
  result += ' y ${lista.last}';

  return result;
}

String numberToLetter(int index) {
  String result = '';
  while (index > 0) {
    index--; // Ajuste para que 1 -> 'A', 2 -> 'B'
    result = String.fromCharCode(97 + (index % 26)) + result;
    index = index ~/ 26;
  }
  return result;
}

int obtenerCantidadEnTruePorUsuario(
  List<String> uidsModuleClass,
  String uidUser,
) {
  // Inicializa el contador
  int count = 0;

  // Verifica si los parámetros son válidos
  if (uidsModuleClass.isEmpty || uidUser.isEmpty) {
    return count; // Retorna 0 si no hay datos válidos
  }

  // Llamada asincrónica dentro del Future
  FirebaseFirestore.instance
      .collection('users_moduleclass')
      .where('uid_user', isEqualTo: uidUser) // Filtro por usuario
      .where('stateView', isEqualTo: true) // Filtro por stateView en true
      .get()
      .then((querySnapshot) {
    // Filtra los documentos que coincidan con los uidsModuleClass
    count = querySnapshot.docs
        .where((doc) => uidsModuleClass.contains(doc['uid_moduleclass']))
        .length;
  }).catchError((error) {
    // Maneja errores
    print('Error al obtener la cantidad: $error');
  });

  return count;
}

int tiempoRestanteExamen(
  DateTime dateStart,
  int minute,
) {
  DateTime endDate = dateStart.add(Duration(minutes: minute));

  /// Obtener el tiempo actual
  DateTime now = DateTime.now();

  /// Calcular el tiempo restante en milisegundos
  int remainingTime = endDate.isAfter(now)
      ? endDate.difference(now).inMilliseconds
      : 0; // Si ya pasó el tiempo, retornar 0 ms

  return remainingTime;
}

String redirectToPaypalURL(String orderID) {
  // return 'https://www.sandbox.paypal.com/checkoutnow?token=$orderID';
  return 'https://www.paypal.com/checkoutnow?token=$orderID';
}

String formatTiempoRestante(
  DateTime fechainicio,
  DateTime fechaActual,
  int minutosExamen,
) {
  // Convertir minutos del examen a duración
  final duracionTotal = Duration(minutes: minutosExamen);
  // Calcular el tiempo restante
  final tiempoTranscurrido = fechaActual.difference(fechainicio);
  final tiempoRestante = duracionTotal - tiempoTranscurrido;

  // Si el tiempo ya se agotó
  if (tiempoRestante.isNegative) {
    return 'Tiempo agotado';
  }

  final horasRestantes = tiempoRestante.inHours;
  final minutosRestantes = tiempoRestante.inMinutes % 60;

  if (horasRestantes > 0 && minutosRestantes > 0) {
    return '$horasRestantes ${horasRestantes == 1 ? 'Hora' : 'Horas'} $minutosRestantes Min.';
  } else if (horasRestantes > 0) {
    return '$horasRestantes ${horasRestantes == 1 ? 'Hora' : 'Horas'}';
  } else {
    return '$minutosRestantes Min.';
  }
}

int calcularTiempoTranscurrido(
  DateTime fechainicio,
  DateTime fechaActual,
) {
  final tiempoTranscurrido = fechaActual.difference(fechainicio).inMilliseconds;
  return tiempoTranscurrido;
}

double convertirCalificacion(double calificacion) {
  if (calificacion < 0) {
    return 0.0; // Si es menor que 0, devolvemos 0.0
  } else if (calificacion > 20) {
    return 1.0; // Si es mayor que 20, devolvemos 1.0
  }
  return calificacion / 20;
}

Color colorCalificacion(double calificacion) {
  if (calificacion >= 14) {
    return Color(0xFF00CE41); // Verde (código hexadecimal: #00ce41)
  } else if (calificacion >= 10) {
    return Color(0xFFE19F00); // Amarillo (código hexadecimal: #e19f00)
  } else {
    return Color(0xFFCC0000); // Rojo (código hexadecimal: #cc0000)
  }
}

String generarCodigoPasrela() {
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const digits = '0123456789';
  math.Random random = math.Random();

  String generateDigits(int length) {
    return List.generate(
        length, (index) => digits[random.nextInt(digits.length)]).join('');
  }

  String codigo = '${generateDigits(2)}'
      '${letters[random.nextInt(letters.length)]}'
      '${generateDigits(5)}'
      '${letters[random.nextInt(letters.length)]}'
      '${generateDigits(7)}'
      '${letters[random.nextInt(letters.length)]}';

  return codigo;
}

String generatePasswordUser() {
  const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String numbers = '0123456789';
  const String specialCharacters = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

  // Random number generator
  final random = math.Random();

  // Generating one random character from each required set
  String upperCase = upperCaseLetters[random.nextInt(upperCaseLetters.length)];
  String lowerCase = lowerCaseLetters[random.nextInt(lowerCaseLetters.length)];
  String number = numbers[random.nextInt(numbers.length)];
  String specialChar =
      specialCharacters[random.nextInt(specialCharacters.length)];

  // Combining the selected characters
  String password = upperCase + lowerCase + number + specialChar;

  // Adding random characters to meet the length requirement
  const allCharacters =
      upperCaseLetters + lowerCaseLetters + numbers + specialCharacters;
  while (password.length < 6) {
    password += allCharacters[random.nextInt(allCharacters.length)];
  }

  // Shuffling the characters to ensure randomness
  password = String.fromCharCodes(password.runes.toList()..shuffle(random));

  return password;
}

double calcularProgresoCurso(double porcentaje) {
  return porcentaje.clamp(0, 100) / 100;
}

String enviarAsesor(String nameCourse) {
  final encodedCourseName = Uri.encodeComponent(nameCourse);
  return 'https://wa.me/51980619456?text=Hola.%20Deseo%20m%C3%A1s%20informaci%C3%B3n%20sobre%20el%20curso%20$encodedCourseName';
}
