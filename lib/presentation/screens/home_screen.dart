import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children:  [
            ListTile(
              title: const Text("Cubbits"),
              subtitle: const Text("gestor de estado para Flutter"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: (){
                context.push('/cubits');
              },
            ),

            ListTile(
              title: const Text("Bloc"),
              subtitle: const Text("gestor de estado comóuesto"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: (){
                context.push('/blocs');
              },
            )
          ],
        ),
    );
  }
}