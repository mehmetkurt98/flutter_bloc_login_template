import 'package:flutter/material.dart';
import 'package:flutter_bloc_login_deneme/views/auth/login/widgets/password_textfield.dart';
import 'package:flutter_bloc_login_deneme/views/auth/login/widgets/username_textfield.dart';

import 'login_button.dart';

class FormWidget extends StatelessWidget {
   FormWidget({Key? key}) : super(key: key);


  final GlobalKey _formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
        children: [
          UserNameTextField(),
          PasswordTextField(),
          LoginButton(formKey: _formKey,
          ),
      ],
    ),
    );

  }
}
