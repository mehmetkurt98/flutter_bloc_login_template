import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_login_deneme/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc_login_deneme/views/auth/fom_submission_status.dart';
import 'package:flutter_bloc_login_deneme/views/auth/login/widgets/form_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginBloc(authRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) => previous.formStatus != current.formStatus,
          listener: (context, state) {
            
            final formStatus =state.formStatus;
            if(formStatus is SubmissionFailed){
              _showSnackBar(context,formStatus.exception.toString());
              
            }
            // Listener içinde işlemler yapılabilir.
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void _showSnackBar(BuildContext context,String message){
    final snackBar=SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
