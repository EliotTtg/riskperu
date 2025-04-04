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

Future<bool> eliminarUsuario(String uid) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Obtener el usuario autenticado
    User? currentUser = auth.currentUser;

    if (currentUser != null) {
      // Obtener los datos del usuario autenticado
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(currentUser.uid).get();

      // Verificar si el documento existe y contiene el campo userType
      if (userDoc.exists) {
        final userData = userDoc.data()
            as Map<String, dynamic>?; // Asegúrate de que sea un Map
        if (userData != null) {
          bool esAdministrador = userData['userType'] == 0;
          bool esMismoUsuario = currentUser.uid == uid;

          // Permitir eliminar si es administrador o el mismo usuario
          if (esAdministrador || esMismoUsuario) {
            // Primero eliminamos los datos del usuario de Firestore
            DocumentReference userDocRef =
                firestore.collection('users').doc(uid);
            await userDocRef.delete();
            print("Usuario eliminado de Firestore con UID: $uid");

            // Eliminar la cuenta de autenticación de Firebase (si es el mismo usuario)
            if (esMismoUsuario) {
              await currentUser
                  .delete(); // Eliminar la cuenta del usuario autenticado
              print(
                  "Cuenta de autenticación eliminada con UID: ${currentUser.uid}");
            }

            return true; // Operación exitosa
          } else {
            print("No tienes permiso para eliminar este usuario.");
            return false; // No es administrador ni el mismo usuario
          }
        } else {
          print("No se pudo obtener los datos del usuario.");
          return false; // No se pudo obtener los datos del usuario
        }
      } else {
        print("El documento del usuario no existe.");
        return false; // Documento no encontrado
      }
    } else {
      print("El usuario no está autenticado.");
      return false; // Usuario no autenticado
    }
  } catch (e) {
    print("Error al eliminar usuario: $e");
    return false; // Si ocurre un error, retorna false
  }
}
