// Caso de uso: obtener usuarios desde el repositorio
import 'package:flutter_bdd_firebase_ejm4/dominio/repositorio_usuario.dart';
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';

class ObtenerUsuarios {
  final RepositorioUsuario repositorio;

  ObtenerUsuarios(this.repositorio);

  Future<List<Usuario>> ejecutar() => repositorio.obtenerUsuarios();
}
