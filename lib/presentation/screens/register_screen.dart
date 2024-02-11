import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgest.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (context)=>RegisterCubit(), 
        child: const _RegisterView(),
      ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final registerCubit=context.watch<RegisterCubit>();
    final username= registerCubit.state.username;
    final password= registerCubit.state.password;
    final email=registerCubit.state.email;
    return  Form(

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
                errorMessage: username.errorMessage,
                prefixIcon: const Icon(Icons.person),
                obscureText: false,
                onChanged: registerCubit.usarnameChanged,
              ),

              const SizedBox(height: 16.0),

              CustomTextFormField(
                label: 'Correo',
                hint: 'Ingrese su correo',
                //errorMessage: 'El correo es requerido',
                
                prefixIcon: const Icon(Icons.email),
                obscureText: false,
                onChanged: registerCubit.emailChanged,
                errorMessage: email.errorMessage,

              ),

              const SizedBox(height: 16.0),

              CustomTextFormField(
                label: 'Contraseña: ${password.value}',
                hint: 'Ingrese su contraseña',
                errorMessage: password.errorMessage,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                onChanged: registerCubit.passwordChanged,
              ),

              const SizedBox(height: 16.0),
              FilledButton.tonalIcon(
                icon: const Icon(Icons.save),
                onPressed: (){
                
                  registerCubit.onSubmit();
                }, 
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