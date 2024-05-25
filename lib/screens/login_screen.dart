import 'package:flutter/material.dart';
import 'package:tap2024/screens/forgotPassword_screen.dart';
import 'package:tap2024/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Correo Electrónico',
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    final txtPwd = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.key),
        hintText: 'Contraseña',
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/fondo.png'),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 150,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 86, 195, 88),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [txtUser, txtPwd],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              child: ElevatedButton.icon(
                onPressed: () {
  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Por favor completa todos los campos.'),
    ));
    return;
  }

  String email = emailController.text;
  bool emailIsValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  if (!emailIsValid) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Por favor introduce un correo electrónico válido.'),
    ));
    return;
  }

  // Validar longitud mínima del password
  String password = passwordController.text;
  if (password.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('La contraseña debe tener al menos 6 caracteres.'),
    ));
    return;
  }

  if (email == 'ejemplo1@hotmail.com' && password == 'con123') {
    setState(() {
      isValidating = true;
    });

    Future.delayed(const Duration(milliseconds: 3000)).then(
      (value) {
        setState(() {
          isValidating = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Correo electrónico o contraseña incorrectos.'),
    ));
  }
},
                icon: const Icon(Icons.login),
                label: const Text('Valida Usuario'),
              ),
            ),
            Positioned(
              bottom: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const forgotclass(),
                    ),
                  );
                },
                icon: const Icon(Icons.login),
                label: const Text('Olvidé mi contraseña'),
              ),
            ),
            Positioned(
              top: 320,
              child: SizedBox(
                height: 100,
                child: isValidating
                    ? Image.asset('assets/load.gif')
                    : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
