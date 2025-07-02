import 'package:flutter/material.dart';
import 'package:mes_devoirs/Classes/devoir.dart';

class Saisie extends StatefulWidget {
  @override
  saisieState createState() => saisieState();
}

List<Devoir> devoirs = [
  Devoir(
    dateCreation: "29 juin 2025",
    dateEcheance: "30 juin 2025",
    contenu: "Réviser sa leçon sur les triangles",
    classe: "6A",
    fait: true,
  ),
  Devoir(
    dateCreation: "29 juin 2025",
    dateEcheance: "30 juin 2025",
    contenu: "Réviser sa leçon sur les triangles",
    classe: "6A",
    fait: false,
  ),
];

class saisieState extends State<Saisie> {
  //const Saisie({super.key});

  Color _color = Colors.transparent;
  Color checkBoxFait = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saisie')),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.blue;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text("Classe 1"),
                  ),
                  Spacer(flex: 1),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.green;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text("Classe 2"),
                  ),
                  Spacer(flex: 1),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.red;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.red,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text("Classe 3"),
                  ),
                  Spacer(flex: 1),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.yellow;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text("Classe 4"),
                  ),
                  Spacer(flex: 1),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.pink;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.pink,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text("Classe 5"),
                  ),
                  Spacer(flex: 1),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.purple;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.purple,
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text("Classe 6"),
                  ),
                  Spacer(),
                ],
              ),
            ),

            //Saisie des devoirs
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                border: Border.all(color: _color, width: 2),
                gradient: LinearGradient(
                  colors: [_color, _color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Spacer(),
                  Text("Date de création : "),
                  Spacer(flex: 1),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Saisissez une date",
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Text("Échéance : "),
                  Spacer(flex: 1),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Saisissez une date",
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Text("Contenu : "),
                  Spacer(flex: 1),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Saisissez le contenu",
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(onPressed: () {}, child: Text("Valider")),
                  Spacer(),
                ],
              ),
            ),

            //Liste des devoirs
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: devoirs.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_color, _color],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                    border: Border.all(color: _color, width: 2),
                    color: const Color.fromARGB(255, 219, 213, 213),
                  ),
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check, color: checkBoxFait),
                      Spacer(),
                      Text(devoirs[index].dateCreation),
                      Spacer(),
                      Text(devoirs[index].dateEcheance),
                      Spacer(),
                      Text(devoirs[index].contenu),
                      Spacer(),
                      Checkbox(
                        value: devoirs[index].fait,
                        onChanged: (bool? newValue) {
                          setState(() {
                            devoirs[index].fait = newValue!;
                          });
                          if (newValue == true) {
                            checkBoxFait = Colors.white;
                          } else {
                            checkBoxFait = Colors.transparent;
                          }
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
