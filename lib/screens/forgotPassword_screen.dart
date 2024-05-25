import 'package:flutter/material.dart';
import 'package:tap2024/screens/login_screen.dart';

class forgotclass extends StatelessWidget {
  const forgotclass({super.key});

  @override
  Widget build(BuildContext context){
    final txtUser = TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Correo Electrónico',
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    final txtPwd = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Nueva Contraseña',
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            txtUser,
            SizedBox(height: 20),
            txtPwd,
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 1000)).then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    ),
                );
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
