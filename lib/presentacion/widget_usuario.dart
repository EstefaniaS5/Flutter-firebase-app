// Widget que muestra cada usuario individualmente
import 'package:flutter/material.dart';
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';
import '../data/repositorio_usuario_impl.dart';
import '../usecases/eliminar_usuario.dart';

class WidgetUsuario extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback onEliminado;

  const WidgetUsuario({
    super.key,
    required this.usuario,
    required this.onEliminado,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(usuario.nombre),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(usuario.correo),
          Text(usuario.carrera),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              await EliminarUsuario(RepositorioUsuarioImpl()).ejecutar(usuario.id);
              onEliminado();
            },
          ),
        ],
      ),
    );
  }
}