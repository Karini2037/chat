//para obter um arquivo no caso a imagem. Só faz sentido exibir este componente no modo Signup
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick; //função devolve uma imagem 


  const UserImagePicker({
    super.key,
    required this.onImagePick,
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(//pegando o arquivo selecionado.
      source: ImageSource.gallery,//buscar da galeria ou pode colocar a câmera e tirar foto.
      imageQuality: 50, //reduzindo a qualidade da imagem para não ficar pesada.
      maxWidth: 150,
    );
//colocando a imagem dentro de um file. 
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      widget.onImagePick(_image!); //a imagem será passada para cá.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(//imagem redondas
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),
        TextButton(
          onPressed: _pickImage, //ao clicar chama o método 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                Icons.image,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              const Text('Adicionar Imagem'),
            ],
          ),
        ),
      ],
    );
  }
}
