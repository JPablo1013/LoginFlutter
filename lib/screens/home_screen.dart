import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Importación del paquete de rating bar
import 'package:tap2024/screens/perfil_screen.dart';
import 'package:tap2024/settings/value_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topicos Avanzados'),
      ),
      drawer: menuLateral(context),
    );
  }

  Widget menuLateral(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/fondo.jpg'),
          ),
        ),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.iskc3y_jG34WqD5_SVFBwwHaGw?rs=1&pid=ImgDetMain'),
              ),
              accountName: Text('Mi nombre'),
              accountEmail: Text('Mi cuenta'),
            ),
            ListTile(
              tileColor: Color.fromARGB(255, 115, 128, 6),
              title: Text('Mis ordenes'),
              subtitle: Text('Mi historial de ordenes'),
              leading: Icon(Icons.key),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, '/login2'),
            ),
            TableWidget(title: 'Ajustes'),
            DayNightSwitcher(
              isDarkModeEnabled: ValueListener.isDark.value, 
              onStateChanged: (isDark){
                ValueListener.isDark.value = isDark;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  final String title;

  const TableWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Click para desplegar'),
            children: <Widget>[
              ListTile(
                title: Text('Actualizar mi cuenta'),
                onTap: () {
                 Future.delayed(const Duration(milliseconds: 1000)).then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  PerfilScreen()),
                    ),
                );
              },
              ),
              ListTile(
                title: Text('Conocenos'),
              ),
              ListTile(
                title: Text('Cambiar tema'),
              ),
              ListTile(
                title: Text('Calificar App'), // Agregamos un nuevo ListTile para la calificación de la app
                trailing: RatingBar.builder( // Utilizamos el widget de RatingBar.builder
                  initialRating: 3, // Puedes cambiar este valor según la calificación inicial
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    // Aquí puedes manejar la actualización de la calificación
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
