import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Supprimer bandeau debug
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Saisie des devoirs',
                  margin: const EdgeInsets.all(15),
                  child:ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70)), child: const Icon(Icons.edit)),
                ),
                
                Tooltip(
                  message: 'Gestion',
                  margin: const EdgeInsets.all(15),
                  child:ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70)), child: Icon(Icons.settings)),
                ),

                 Tooltip(
                  message: 'Emploi du temps',
                  margin: const EdgeInsets.all(15),
                  child:ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70)), child: Icon(Icons.calendar_month))
                )
              ],
            ),
          )
          ),
          ),
        );
  }
}
