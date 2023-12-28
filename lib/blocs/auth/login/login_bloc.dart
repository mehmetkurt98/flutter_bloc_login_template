import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_event.dart';
import 'package:flutter_bloc_login_deneme/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_login_deneme/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc_login_deneme/views/auth/fom_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{


  final LoginRepository? authRepo;
  LoginBloc({this.authRepo}) : super(const LoginState()){

    on<LoginEvent>(
        (event,emit) async {
          await mapEventToState(event,emit);
        },
    );
  }


  Future mapEventToState(LoginEvent event,Emitter<LoginState> emit) async {
    if(event is LoginUsernameChanged){
      emit(state.copyWith(username:event.username));

    }else if(event is LoginPasswordChanged){
      emit(state.copyWith(password: event.password));
    }else if(event is LoginSubmitted){

      emit(state.copyWith(formStatus: FormSubmitting()));
      try{
        await authRepo?.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      }
      catch(e){
        emit(state.copyWith(formStatus: SubmissionFailed(e)));

      }
    }
  }
}