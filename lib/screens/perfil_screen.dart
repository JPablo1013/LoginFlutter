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
              SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: seleccionarImagen,
                      icon: Icon(Icons.image),
                      label: Text('Seleccionar de la galería'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: tomarFoto,
                      icon: Icon(Icons.camera_alt),
                      label: Text('Tomar foto'),
                    ),
                  ],
                ),
                 SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre completo'),
                onChanged: (value) {
                  setState(() {
                    nombreCompleto = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es requerido';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'El nombre solo puede contener letras y espacios';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo electrónico es requerido';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true, 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contraseña es requerida';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                    return 'La contraseña debe contener al menos un número o una letra';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Página de GitHub'),
                onChanged: (value) {
                  setState(() {
                    paginaGitHub = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La página de GitHub es requerida';
                  }
                  if (!value.startsWith('github.com')) {
                    return 'La página de GitHub debe comenzar con "github.com"';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de teléfono'),
                onChanged: (value) {
                  setState(() {
                    numeroTelefono = value;
                  });
                },
                keyboardType: TextInputType.phone, 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El número de teléfono es requerido';
                  }
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Ingrese un número de teléfono válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
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
