import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;
  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.prefixIcon, 
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const borde=  OutlineInputBorder(
      borderSide: BorderSide (
        color: Colors.black26,
        width: 1.5
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.5),
        bottomRight: Radius.circular(25.5),
      ),

    );
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: borde,
        focusedBorder: borde.copyWith(
          borderSide: BorderSide(
            color: colors.primary,
          ),
        ),

        errorBorder: borde.copyWith(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),

        focusedErrorBorder: borde.copyWith(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),

        isDense: true,
        label: label!= null? Text(label!): null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: prefixIcon,
        errorText: errorMessage,

      )
    );
  }
}


//* decoracion basica de un TextFormField
// decoration: InputDecoration(
//         labelText: 'Nombre',
//         hintText: 'Ingrese su nombre',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       )