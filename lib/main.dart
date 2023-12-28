import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login_deneme/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc_login_deneme/views/auth/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mate App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider<LoginRepository>( //burda Loginscreende rahatca loginrepository'deki fonksiyonu kullanabiliriz.
        create: (context) => LoginRepository(),
        child: LoginScreen(),
      ),
    );
  }
}
