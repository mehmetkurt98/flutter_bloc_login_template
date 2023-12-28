import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_event.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_login_deneme/views/auth/fom_submission_status.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key,required this.formKey});
  final dynamic formKey;






  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc,LoginState>(

        builder:((context,state){
          return state.formStatus is FormSubmitting ? Center(child: CircularProgressIndicator()) : ElevatedButton(

              onPressed: (){
                if (formKey.currentState != null && formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }


          }, child: Text("Giriş Yap"));

        }


        ),
    );
  }
}
