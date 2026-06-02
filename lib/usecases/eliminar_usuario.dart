import '../dominio/repositorio_usuario.dart';

class EliminarUsuario {
  final RepositorioUsuario repositorio;

  EliminarUsuario(this.repositorio);

  Future<void> ejecutar(String id) async {
    await repositorio.eliminarUsuario(id);
  }
}
