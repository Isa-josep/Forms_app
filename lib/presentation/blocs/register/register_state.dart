part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String usarname;
  final String email;
  final String password;

  const RegisterFormState({
     this.formStatus = FormStatus.invalid, 
     this.usarname = '', 
     this.email = '', 
     this.password = ''
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? usarname,
    String? email,
    String? password,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      usarname: usarname ?? this.usarname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [formStatus, usarname, email, password];
}

