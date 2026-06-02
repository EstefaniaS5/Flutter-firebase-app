// Implementación del repositorio usando la fuente de datos
import 'package:flutter_bdd_firebase_ejm4/dominio/repositorio_usuario.dart';
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';

import 'firebase_fuente_datos_usuario.dart';

class RepositorioUsuarioImpl implements RepositorioUsuario {
  final fuente = FuenteDatosUsuarioFirebase();

  @override
  Future<List<Usuario>> obtenerUsuarios() => fuente.obtenerUsuarios();

  @override
  Future<void> agregarUsuario(Usuario usuario) => fuente.agregarUsuario(usuario);

  @override
  Future<void> eliminarUsuario(String id) => fuente.eliminarUsuario(id);
}
