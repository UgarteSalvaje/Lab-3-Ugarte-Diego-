import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      home: const MyHomePage(title: 'Lab 5 Diego Ugarte'),
    );
  }
}
  @override
  

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String icono = 'assets/icons/Question.svg';
  String text =' ';

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
    
    return Scaffold(
      persistentFooterButtons: [],
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