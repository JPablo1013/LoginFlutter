import 'package:flutter/material.dart';
import 'package:tap2024/screens/login_screen.dart';

class newUserClass extends StatelessWidget {
  const newUserClass({super.key});

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

    final txtMail = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Correo o numero de telefono',
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo usuario'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Color.fromARGB(255, 175, 17, 17),
            ],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: 200, 
              child: Container(
                alignment: Alignment.center, 
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/usuario1.jpg'),
              ),
            ),
            txtUser,
            SizedBox(height: 20),
            txtPwd,
            SizedBox(height: 20),
            txtMail,
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                      Future.delayed(const Duration(
                        milliseconds: 3000
                      )).then((value) => Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context)=> const LoginScreen()
                        )
                      )
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
