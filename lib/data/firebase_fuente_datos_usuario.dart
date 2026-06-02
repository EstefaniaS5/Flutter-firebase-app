// Fuente de datos que se comunica directamente con Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';

class FuenteDatosUsuarioFirebase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;  //patron singleton

  // Obtener lista de usuarios desde la colección 'usuarios'
  Future<List<Usuario>> obtenerUsuarios() async {
  final snapshot = await _db.collection('Usuario').orderBy('nombre').get();
  return snapshot.docs.map((doc) => Usuario.desdeDocumento(doc)).toList();
  }

  // Agregar un nuevo usuario a la colección
  Future<void> agregarUsuario(Usuario usuario) async {
    await _db.collection('Usuario').add(usuario.aMapa());
  }

  // Eliminar un usuario
  Future<void> eliminarUsuario(String id) async {
    await _db.collection('Usuario').doc(id).delete();
  }
}
