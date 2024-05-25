import 'package:flutter/material.dart';
import 'package:tap2024/screens/login_screen.dart';
import 'package:tap2024/screens/newUser.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: 200, 
              child: Container(
                alignment: Alignment.center, 
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/logo.jpg'),
              ),
            ),

            /*Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),*/
            SizedBox(height: 40),
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
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green, backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: (){
                      Future.delayed(const Duration(
                        milliseconds: 3000
                      )).then((value) => Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context)=> const newUserClass()
                        )
                      )
                    );
                  }, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green, backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
