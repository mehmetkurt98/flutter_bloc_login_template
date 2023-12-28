import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_event.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_state.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: "Username",
          ),
          validator: (value) => state.isValidUserName ? null : "Username is too short",
          onChanged: (value) => context.read()<LoginBloc>().add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }
}
