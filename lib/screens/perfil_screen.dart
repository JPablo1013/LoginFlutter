import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wc_form_validators/wc_form_validators.dart'; 

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _formKey = GlobalKey<FormState>(); 
  String nombreCompleto = '';
  String email = '';
  String password = '';
  String paginaGitHub = '';
  String numeroTelefono = '';
  late ImageProvider avatar = AssetImage('assets/usuario1.jpg'); 

  // Método para seleccionar imagen de la galería
  Future<void> seleccionarImagen() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        avatar = FileImage(File(pickedFile.path));
      });
    }
  }

  // Método para tomar una foto con la cámara
  Future<void> tomarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        avatar = FileImage(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: seleccionarImagen, 
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: avatar, 
                  child: Icon(Icons.camera_alt), 
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre completo'),
                onChanged: (value) {
                  setState(() {
                    nombreCompleto = value;
                  });
                },
                validator: Validators.required('El nombre es requerido'),
              ),
     
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: Validators.email('Ingrese un correo electrónico válido'), // Validador de correo electrónico
              ),
              // Password del usuario
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true, // Oculta el texto de la contraseña
                validator: Validators.minLength(6, 'La contraseña debe tener al menos 6 caracteres'), // Validador de longitud mínima
              ),
             
              TextFormField(
                decoration: InputDecoration(labelText: 'Página de GitHub'),
                onChanged: (value) {
                  setState(() {
                    paginaGitHub = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de teléfono'),
                onChanged: (value) {
                  setState(() {
                    numeroTelefono = value;
                  });
                },
                keyboardType: TextInputType.phone, // Teclado numérico
                validator: Validators.patternRegExp(RegExp(r'^[0-9]{10}$'), 'Ingrese un número de teléfono válido'), // Validador de número de teléfono
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
