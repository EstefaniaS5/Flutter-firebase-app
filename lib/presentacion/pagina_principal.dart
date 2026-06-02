// Página principal que muestra lista de usuarios
import 'package:flutter/material.dart';
import 'package:flutter_bdd_firebase_ejm4/modelos/usuario_modelo.dart';
import 'package:flutter_bdd_firebase_ejm4/presentacion/widget_usuario.dart';
import '../data/repositorio_usuario_impl.dart';
import '../usecases/obtener_usuarios.dart';
import '../usecases/agregar_usuario.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final obtenerUsuarios = ObtenerUsuarios(RepositorioUsuarioImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Usuarios")),
      body: FutureBuilder<List<Usuario>>(
        future: obtenerUsuarios.ejecutar(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) => WidgetUsuario(
                usuario: usuarios[index], onEliminado: () {
                  setState(() {});
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nombreController = TextEditingController();
          final correoController = TextEditingController();
          final carreraController = TextEditingController();  
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Agregar Usuario'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                  ),
                  TextField(
                    controller: correoController,
                    decoration: const InputDecoration(labelText: 'Correo'),
                  ),
                  TextField(
                    controller: carreraController,
                    decoration: const InputDecoration(labelText: 'Carrera'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    final nuevo = Usuario(
                      id: '',
                      nombre: nombreController.text.trim(),
                      correo: correoController.text.trim(),
                      carrera: carreraController.text.trim(), // Agrega un valor por defecto para carrera
                    );
                    await AgregarUsuario(RepositorioUsuarioImpl()).ejecutar(nuevo);
                    Navigator.of(context).pop();
                    setState(() {}); // Para refrescar la lista
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
