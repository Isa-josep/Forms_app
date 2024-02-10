import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgest.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const _RegisterView(),
      );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String usarName ='';
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    
    return  Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const FlutterLogo(size: 150),
              const SizedBox(height: 16.0),
               CustomTextFormField(
                label: 'Nombre',
                hint: 'Ingrese su nombre',
                //errorMessage: 'El nombre es requerido',
                validator: (value) => value!.isEmpty ? 'El nombre es requerido' : null,
                prefixIcon: const Icon(Icons.person),
                obscureText: false,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                label: 'Correo',
                hint: 'Ingrese su correo',
                //errorMessage: 'El correo es requerido',
                validator: (value) => value!.isEmpty ? 'El correo es requerido' : null,
                prefixIcon: const Icon(Icons.email),
                obscureText: false,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                label: 'Contraseña',
                hint: 'Ingrese su contraseña',
                //errorMessage: 'La contraseña es requerida',
                validator: (value) => value!.isEmpty ? 'La contraseña es requerida' : null,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              FilledButton.tonalIcon(
                icon: const Icon(Icons.save),
                onPressed: (){}, 
                label: const Text('Register')
              )
            ],
          ),
        ),
      )
    );
  }
}

// class _RegisterFrom extends StatelessWidget {
//   const _RegisterFrom();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           TextFormField(),
//           FilledButton.tonalIcon(
//             icon: const Icon(Icons.save),
//             onPressed: (){}, 
//             label: const Text('Register')
//           )
//         ],
//       )
//     );
//   }
// }