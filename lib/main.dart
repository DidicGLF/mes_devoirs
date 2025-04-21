import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(onPressed: (){}, child: const Icon(Icons.edit)),
                  Text('Saisie')
                ],
              ),
              Column(
                children: [
                  ElevatedButton(onPressed: (){}, child: const Icon(Icons.settings)),
                  Text('Gestion')
                ],
              ),
              Column(
                children: [
                  ElevatedButton(onPressed: (){}, child: const Icon(Icons.calendar_month)),
                  Text('E.D.T.')
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
