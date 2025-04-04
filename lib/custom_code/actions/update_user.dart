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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> updateUser(
    String uid, // ID único del usuario que se va a actualizar
    String correo,
    String nombre,
    String contra,
    int userType, // Tipo de usuario
    String codigo,
    String adminPassword // Contraseña del administrador para confirmar
    ) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Obtener el usuario autenticado
    User? currentUser = auth.currentUser;

    if (currentUser == null) {
      return "No hay un usuario autenticado."; // Usuario no autenticado
    }

    // Reautenticar al administrador con la contraseña proporcionada
    AuthCredential adminCredential = EmailAuthProvider.credential(
      email: currentUser.email!,
      password: adminPassword,
    );

    try {
      await currentUser.reauthenticateWithCredential(adminCredential);
    } catch (e) {
      return "Contraseña del administrador incorrecta. No se puede proceder."; // Contraseña inválida
    }

    // Obtener los datos del usuario autenticado desde Firestore
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(currentUser.uid).get();

    if (!userDoc.exists) {
      return "El usuario logueado no existe en Firestore."; // Documento no encontrado
    }

    final userData = userDoc.data() as Map<String, dynamic>?;

    if (userData == null || !userData.containsKey('userType')) {
      return "No se pudo obtener los datos del usuario o no tiene userType."; // Datos inválidos
    }

    // Verificar si el usuario autenticado es administrador
    bool esAdministrador = userData['userType'] == 0; // 0 = Administrador

    if (!esAdministrador) {
      return "Solo un administrador puede actualizar usuarios."; // No es administrador
    }

    // Obtener el documento del usuario a actualizar
    DocumentReference userDocRef = firestore.collection('users').doc(uid);
    DocumentSnapshot userToUpdate = await userDocRef.get();

    if (!userToUpdate.exists) {
      return "El usuario con UID $uid no existe en Firestore."; // Usuario no encontrado
    }

    // Verificar si el correo ya está en uso (si es un correo distinto)
    List<String> signInMethods = await auth.fetchSignInMethodsForEmail(correo);
    if (signInMethods.isNotEmpty && correo != userToUpdate['email']) {
      return "El correo ya está registrado en Firebase Authentication."; // Correo ya en uso
    }

    // Actualizar el documento del usuario en Firestore con los detalles proporcionados
    await userDocRef.update({
      'email': correo,
      'display_name': nombre,
      'userType': userType,
      'codigo': codigo,
    });

    return "Usuario actualizado exitosamente."; // Mensaje de éxito
  } catch (e) {
    return "Error al actualizar usuario: $e"; // Mensaje de error detallado
  }
}
