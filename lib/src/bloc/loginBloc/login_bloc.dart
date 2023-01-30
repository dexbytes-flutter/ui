
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../all_file_import/app_utils_files_link.dart';
import '../../model/user_model.dart';
part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {

    on<LoginSubmitEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        // final uri = Uri.parse('https://mocki.io/v1/cb1e857d-c2b2-4822-8fb0-02b80c3f2498');
        final uri = Uri.parse('https://dummyjson.com/auth/login');
        Map<String,dynamic> postMap = {'username': 'kminchelle', 'password': '0lelplR'};
        var response = await http.post(uri,body: postMap);
        if(response.statusCode == 200 && response.body.isNotEmpty){
          UserModel userModel = userModelFromJson(response.body);
          if(userModel.token != null){
         await sharedPreferencesFile.saveStr('access_token', userModel.token);
            emit(LoginSuccessState());
          }
        }else{
          emit(LoginErrorState());
        }
      } catch(e){
        debugPrint(e.toString());
        http.Client().close();
        emit(LoginErrorState());
      }
    });
  }
}
