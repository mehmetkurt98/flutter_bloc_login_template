import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_login_deneme/views/auth/fom_submission_status.dart';

class LoginState extends Equatable{

  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  const LoginState({
  this.username="",
  this.password="",
  this.formStatus =const InitialFormStatus(),
  });

  LoginState copyWith(
  {
    String? username,
    String? password,
    FormSubmissionStatus? formStatus}){

    return LoginState(
      username :  username ?? this.username,
      password :  password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );



  }





  bool get isValidUserName => username.length>3;
  bool get isValidPassword => password.length>6;




  @override
  List<Object?> get props => [


    username,
    password,
    formStatus,

  ];

}