// Interfaz del repositorio
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';

abstract class RepositorioUsuario {
  Future<List<Usuario>> obtenerUsuarios();
  Future<void> agregarUsuario(Usuario usuario);
  Future<void> eliminarUsuario(String id);
}
