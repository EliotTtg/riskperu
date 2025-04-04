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

Future<String> addUser(
    String correo,
    String nombre,
    String contra,
    int userType, // Tipo de usuario que se guardará directamente
    String codigo,
    String adminPassword // Contraseña del administrador para confirmar
    ) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    DateTime fechaActual = DateTime.now();

    // Obtener el usuario logueado actual
    User? currentUser = auth.currentUser;
    if (currentUser == null) {
      return "No hay un usuario logueado."; // Retorna un mensaje de error
    }

    // Reautenticar al administrador con la contraseña proporcionada
    AuthCredential adminCredential = EmailAuthProvider.credential(
      email: currentUser.email!,
      password: adminPassword,
    );

    try {
      await currentUser.reauthenticateWithCredential(adminCredential);
    } catch (e) {
      return "Contraseña del administrador incorrecta. No se puede proceder."; // Mensaje de error si la contraseña es incorrecta
    }

    // Obtener el documento del usuario logueado
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(currentUser.uid).get();
    if (!userDoc.exists) {
      return "El usuario logueado no existe en Firestore."; // Retorna un mensaje de error
    }

    // Verificar si el usuario logueado es un administrador (userType == 0)
    int currentUserType = userDoc['userType'];
    if (currentUserType != 0) {
      return "El usuario logueado no es un administrador. No tiene permisos."; // Mensaje de error
    }

    // Verificar si el correo ya está en uso
    List<String> signInMethods = await auth.fetchSignInMethodsForEmail(correo);
    if (signInMethods.isNotEmpty) {
      return "El correo ya está registrado en Firebase Authentication."; // Mensaje de error
    }

    // Crear el usuario en Firebase Authentication sin mantener la sesión activa
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: correo,
      password: contra,
    );

    // Obtener el UID del usuario recién creado
    String uid = userCredential.user!.uid;

    // Cerrar sesión del usuario recién creado
    await auth.signOut();

    // Volver a iniciar sesión como el administrador
    await auth.signInWithEmailAndPassword(
      email: currentUser.email!,
      password:
          adminPassword, // Reautenticar al administrador con su contraseña
    );

    // Guardar los datos adicionales del usuario en Firestore
    await firestore.collection('users').doc(uid).set({
      'email': correo,
      'display_name': nombre,
      'created_time': fechaActual,
      'userType': userType, // Guardar el tipo de usuario
      'codigo': codigo, // Guardar el código proporcionado
      'uid': uid,
    });

    // Crear un registro en la colección users_plan con los datos correspondientes
    DocumentReference userPlanDoc =
        await firestore.collection('users_plans').add({
      'uid_user': uid,
      'uid_plan': '9T75Yb8XEX6YMb8KupV6', // UID del plan gratis
      'created_time': fechaActual, // Fecha de creación del registro
    });

    // Actualizar el registro con su propio UID
    await userPlanDoc.update({
      'uid': userPlanDoc.id,
    });

    print(
        "Usuario y plan creados exitosamente con UID: $uid y plan UID: ${userPlanDoc.id}");
    return "Usuario creado exitosamente."; // Mensaje de éxito
  } catch (e) {
    print("Error al crear usuario y plan: $e");
    return "Error al crear usuario y plan: $e"; // Retorna un mensaje de error detallado
  }
}
