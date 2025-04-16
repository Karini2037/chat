import 'dart:io';

import 'package:chat/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser get currentUser; // se não tiver nenhum usuário logado ele será nulo 

  Stream<ChatUser?> get userChanges; //metodo getter de mudança de estado do usuário, stream de dados, jogando os dados sobre demanda para o chatUser, o usuário se logou, o usuário saiu... cria uma série de dados conforme a demanda. 

  Future<void> signup( //metodo que muda o estado do usuário corrente
    String name,
    String email,
    String password,
    File? image
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();//não precisa passar nada 

  
}

//nesta página temos 5 metodos, doi getter (usuário e stream de dados), depois o método para cadastrar, logoar e sair(deslogar).

//esta classe é abstrada = se precisar alterar algo, só precisa alterar uma linha.