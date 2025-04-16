import 'dart:io';

enum AuthMode { signup, login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = ''; //só se estiver logado
  File? image; //só se estiver logado
  AuthMode _mode = AuthMode.login; //so se estiver logado

  bool get isLogin {//se esse for verdadeiro, estará neste módulo
    return _mode == AuthMode.login;
  }

  bool get isSignup {//se esse for verdadeiro, estará neste módulo
    return _mode == AuthMode.signup;
  }

  void toggleAuthMode() {//alternancia 
    _mode = isLogin ? AuthMode.signup : AuthMode.login;
  }
}
