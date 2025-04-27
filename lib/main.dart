import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home:MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Supprimer bandeau debug
      home: Scaffold(
        appBar: AppBar(title: const Text("Accueil")),
        body: Center(
          child: SizedBox(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Saisie des devoirs',
                  margin: const EdgeInsets.all(15),
                  child:ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Saisie()));
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70)), child: const Icon(Icons.edit)),
                ),
                
                Tooltip(
                  message: 'Gestion',
                  margin: const EdgeInsets.all(15),
                  child:ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Gestion()));
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70)), child: Icon(Icons.settings)),
                ),

                 Tooltip(
                  message: 'Emploi du temps',
                  margin: const EdgeInsets.all(15),
                  child:ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Edt()));
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70)), child: Icon(Icons.calendar_month))
                )
              ],
            ),
          )
          ),
          ),
        );
  }
}


class Saisie extends StatelessWidget {
  const Saisie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saisie')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Gestion extends StatelessWidget {
  const Gestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestion')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Edt extends StatelessWidget {
  const Edt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emploi du temps')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}