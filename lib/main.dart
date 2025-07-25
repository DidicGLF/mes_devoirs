import 'package:flutter/material.dart';
import 'package:mes_devoirs/Screen/screen_sethomework.dart';
import 'package:mes_devoirs/Screen/screen_settings.dart';
import 'package:mes_devoirs/Screen/screen_schedule.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Hide debug banner
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetHomework()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      iconSize: 30,
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),

                Tooltip(
                  message: 'Gestion',
                  margin: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Gestion(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      iconSize: 30,
                    ),
                    child: Icon(Icons.settings),
                  ),
                ),

                Tooltip(
                  message: 'Emploi du temps',
                  margin: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetSchedule()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      iconSize: 30,
                    ),
                    child: Icon(Icons.calendar_month),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
