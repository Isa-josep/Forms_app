import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs.dart';
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
                validator: (value){
                  if(value==null || value.isEmpty)return 'El nombre es requerido';
                  if(value.trim().isEmpty) return 'El nombre no puede contener solo espacios';
                  //? validacion de correo electronico con expresiones regulares
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if(!emailRegExp.hasMatch(value)) return 'El correo no es valido';
                  return null;
                },
                prefixIcon: const Icon(Icons.email),
                obscureText: false,
                onChanged: (value){
                  registerCubit.emailChanged(value);
                },
              ),

              const SizedBox(height: 16.0),

              CustomTextFormField(
                label: 'Contraseña',
                hint: 'Ingrese su contraseña',
                //errorMessage: 'La contraseña es requerida',
               validator: (value){
                  if(value==null || value.isEmpty)return 'La contraseña es requerido';
                  if(value.trim().isEmpty) return 'La contraseña no puede contener solo espacios';
                  if(value.length<6) return 'La contraseña debe tener al menos 6 caracteres';
                  return null;
                },
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                onChanged: (value){
                  registerCubit.passwordChanged(value);
                },
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