// Caso de uso: agregar un usuario al repositorio
import 'package:flutter_bdd_firebase_ejm4/dominio/repositorio_usuario.dart';
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';

class AgregarUsuario {
  final RepositorioUsuario repositorio;

  AgregarUsuario(this.repositorio);

  Future<void> ejecutar(Usuario usuario) => repositorio.agregarUsuario(usuario);
}
