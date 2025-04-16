import 'package:chat/components/auth_form.dart';
import 'package:chat/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;// irá dizer se estou no modo loading ou no processamento do formulário. 

  Future<void> _handleSubmit(AuthFormData formData) async { //fazendo a conecxão do formulário
    try {
      setState(() => _isLoading = true);
  if (formData.isLogin) {
        // Login
       
      } else {
        // Signup
       
        
      }
    } catch (error) {
      // Tratar erro!
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(//widget de layout que permite sobrepor vários widgets uns sobre os outros, em ordem de empilhamento (como pilhas de papel).
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading) //este container só será exibido apenas se eu estiver no modulo Loading
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
