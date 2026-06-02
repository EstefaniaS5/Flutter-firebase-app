import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bdd_firebase_ejm4/presentacion/pagina_principal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa Firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuarios Firestore',
      debugShowCheckedModeBanner: false,
      home: const PaginaPrincipal(),
    );
  }
}








// lib/
// ├── data/
// │   └── user_repository_impl.dart        # Lógica para obtener y guardar usuarios desde Firestore
// ├── domain/
// │   └── user_repository.dart             # Contrato que define qué funciones debe implementar el repositorio
// ├── presentation/
// │   └── main_page.dart                   # Interfaz principal: muestra la lista y permite agregar usuarios
// ├── user_model.dart                      # Representación del usuario como objeto de Dart
// └── main.dart                            # Punto de entrada de la app
