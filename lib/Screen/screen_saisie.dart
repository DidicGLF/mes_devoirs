import 'package:flutter/material.dart';
import 'package:mes_devoirs/Classes/homework.dart';

class InputHomework extends StatefulWidget {
  @override
  inputState createState() => inputState();
}

//Sample list to fill the listview
List<Homework> homework = [
  Homework(
    creationDate: "29 juin 2025",
    deadline: "30 juin 2025",
    contenu: "Réviser sa leçon sur les triangles",
    classroom: "6A",
    done: true,
  ),
  Homework(
    creationDate: "29 juin 2025",
    deadline: "30 juin 2025",
    contenu: "Réviser sa leçon sur les triangles",
    classroom: "6A",
    done: false,
  ),
];

class inputState extends State<InputHomework> {
  Color _color = Colors.transparent;
  Color checkBoxDone = Colors.transparent;

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
                        _color = Colors.blue.shade400;
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
                        _color = Colors.green.shade400;
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
                        _color = Colors.red.shade400;
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
                        _color = Colors.yellow.shade400;
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
                        _color = Colors.pink.shade400;
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
                        _color = Colors.purple.shade400;
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

            //Homework input
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                border: Border.all(color: Colors.black, width: 1),
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
                  Text("Date de création : "),
                  Spacer(flex: 1),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Saisissez une date",
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Text("Échéance : "),
                  Spacer(flex: 1),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alarm),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
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
                        prefixIcon: Icon(Icons.notes),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
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

            //Homework list
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: homework.length,
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
                      Icon(Icons.check, color: checkBoxDone),
                      Spacer(),
                      Text(homework[index].creationDate),
                      Spacer(),
                      Text(homework[index].deadline),
                      Spacer(),
                      Text(homework[index].contenu),
                      Spacer(),
                      Checkbox(
                        value: homework[index].done,
                        onChanged: (bool? newValue) {
                          setState(() {
                            homework[index].done = newValue!;
                          });
                          if (newValue == true) {
                            checkBoxDone = Colors.white;
                          } else {
                            checkBoxDone = Colors.transparent;
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
