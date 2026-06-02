// Modelo que representa un usuario y se adapta a Firestore
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String id;
  final String nombre;
  final String correo;
  final String carrera;

  Usuario({required this.id, required this.nombre, required this.correo, required this.carrera});

  // Crear modelo desde documento Firestore
  factory Usuario.desdeDocumento(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Usuario(
      id: doc.id,
      nombre: data['nombre'] ?? '',
      correo: data['correo'] ?? '',
      carrera: data['carrera'] ?? '',
    );
  }

  // Convertir a mapa para subir a Firestore
  Map<String, dynamic> aMapa() {
    return {'nombre': nombre, 'correo': correo, 'carrera': carrera};
  }
}
