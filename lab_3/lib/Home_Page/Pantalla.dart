import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab_3/main.dart';


class Pantalla extends StatelessWidget {
  const Pantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Powerpuff',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab 8 Diego Ugarte'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    print('createState: Creating state');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String icono = 'assets/icons/Question.svg';
  String text = ' ';

  _MyHomePageState() {
    print('_MyHomePageState constructor: Objeto esta siendo creado');
  }

   void initState() {
    super.initState();
    print('initState: Inicializando estado');
    print('initState: mounted = $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: Dependencias cambiadas');
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget: Widget actualizado');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('setState: Estado ha sido restablecido');
  }

  @override
  void deactivate() {
    print('deactivate: Widget esta siendo removido del arbol');
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose: eliminando esta');
    print('dispose: mounted = $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble: La aplicación se está volviendo a ensamblar');
    print('reassemble: mounted = $mounted');
  }

  void _situation() {
    if (_counter == 10) {
      icono = 'assets/icons/Defeat.svg';
      text = 'Derrota!';
    } else if (_counter == 15) {
      icono = 'assets/icons/Victory.svg';
      text = 'Victoria!';
    } else {
      icono = 'assets/icons/Question.svg';
      text = '';
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _situation();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _situation();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _situation();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build: Building widget');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Detalles'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Detalles()),
                );
              },
            ),
            ListTile(
              title: const Text('Lista'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Lista()),
                );
              },
            ),
            ListTile(
              title: const Text('Sensores'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sensores()),
                );
              },
            ),
            ListTile(
              title: const Text('Gestos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Gestos()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset(icono, height: 100, width: 100),
              Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Has presionado el boton $_counter veces',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Icon(Icons.add),
                    onPressed: _incrementCounter,
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Icon(Icons.remove),
                    onPressed: _decrementCounter,
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Icon(Icons.restart_alt_rounded),
                    onPressed: _resetCounter,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Detalles extends StatelessWidget {
  const Detalles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('No hay nada que decir :)'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Lista';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.map),
              title: Text('Mapa supongo'),
            ),
            const ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album supongo'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telefono supongo'),
            ),
          ],
        ),
      ),
    );
  }
}

class Sensores extends StatelessWidget {
  const Sensores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensores'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Sensores',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class Gestos extends StatelessWidget {
  const Gestos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestos'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Gestos',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}