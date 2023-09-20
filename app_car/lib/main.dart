import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARROS DE LA VRG',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 108, 181, 118)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CARROS DEL AÑO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                color: Colors.grey[300],
                width: double.infinity,
                child: const Text("Perfil"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(10),
                color: Colors.grey[300],
                width: double.infinity,
                child: const Text("Ajustes"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(10),
                color: Colors.grey[300],
                width: double.infinity,
                child: const Text("Guardados"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(10),
                color: Colors.grey[300],
                width: double.infinity,
                child: const Text("LogOut"),
              )
            ]
          ),
        )
      ),
      endDrawer: Drawer( // Utilizamos endDrawer en lugar de drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Mi Drawer Derecho',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Ajustes'),
              onTap: () {
                // Acción para la opción 1
              },
            ),
            ListTile(
              title: Text('Salir'),
              onTap: () {
                // Acción para la opción 2
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Abre el Drawer
              }, 
              icon: const Icon(Icons.face),
              iconSize: 40,
            ),
          ),
        ],
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return Padding(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 173, 213, 231)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Image.asset('../images/EVO_V.webp',
                        width: 80, // Ancho deseado
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Marca',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Agrega un espacio de 10 de altura
                    Text('Kilometros'),
                    SizedBox(height: 10), // Agrega otro espacio de 10 de altura
                    Text('Potencia'),
                  ],
                ),
              ],
            )
          ),);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
