import 'package:flutter/material.dart';
import 'package:tap2024/screens/login_screen.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olvidé mi Contraseña'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.green,
            ],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Correo Electrónico',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                validator: Validators.compose([
                  Validators.required('Por favor, ingresa un correo electrónico.'),
                  Validators.patternRegExp(emailRegex, 'Por favor, introduce un correo electrónico válido.'),
                ]),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Nueva Contraseña',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                validator: Validators.compose([
                  Validators.required('Por favor, ingresa una contraseña.'),
                  Validators.minLength(6, 'La contraseña debe tener al menos 6 caracteres.'),
                ]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implementa aquí la lógica para enviar la información
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
