import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab_3/main.dart';

// This widget is the root of your application.
class Pantalla extends StatelessWidget{
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
      home: const MyHomePage(title: 'Lab 7 Diego Ugarte'),
    );
  }
}
  @override
  

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    print('create state');
    return _MyHomePageState();
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
        ElevatedButton( onPressed: () { Navigator.pop(context); }, child: const Text('Volver al inicio'),)
          ,],
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

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center( child: ListView(
          children: <Widget>[
            ElevatedButton(onPressed: () => {Navigator.pop(context)}, child: const Text('Volver')),
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
          ]
        ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String icono = 'assets/icons/Question.svg';
  String text =' ';

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

  void _situation(){

    if(_counter==10){     
      icono= 'assets/icons/Defeat.svg';
      text='Derrota!';
    }
    else if(_counter==15){
      icono= 'assets/icons/Victory.svg';
      text='Victoria!';
    }
    else{
      icono= 'assets/icons/Question.svg';
      text='';
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
      _counter=0;
      _situation();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() called');

    return Scaffold(
      persistentFooterButtons: [
      ElevatedButton(child: const Text('Ir a Detalles'), onPressed: () 
      {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Detalles()),);},),
      ElevatedButton(child: const Text('Ir a Lista'), onPressed: () 
      {Navigator.push(context, MaterialPageRoute(builder: (context) => const Lista()),);},)],
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
      ),
      
      body: Center(
        child: Card(child: Column(
          
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SvgPicture.asset(icono,height: 100, width: 100,),
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
                  onPressed: () {_incrementCounter();},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {_decrementCounter();/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Icon(Icons.restart_alt_rounded),
                  onPressed: () {_resetCounter();/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ]
          ,
        ),
        ),
      ),    
    );
  }
}