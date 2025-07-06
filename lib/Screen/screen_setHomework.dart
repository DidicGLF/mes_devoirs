import 'package:flutter/material.dart';
import 'package:mes_devoirs/Classes/homework.dart';

class GetHomework extends StatefulWidget {
  @override
  InputState createState() => InputState();
}

//Sample list to fill the listview
List<Homework> homework = getHomeworkList();

class InputState extends State<GetHomework> {
  Color _color = Colors.transparent;
  Color checkBoxDone = Colors.black;

  // Create textfield controller
  final TextEditingController _homeworkCreationDate = TextEditingController();
  final TextEditingController _homeworkDeadline = TextEditingController();
  final TextEditingController _homeworkContenu = TextEditingController();

  // Variable for new homework
  String homeworkClassroom = "";

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
                      controller: _homeworkCreationDate,
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
                      controller: _homeworkDeadline,
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
                      controller: _homeworkContenu,
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
                  ElevatedButton(
                    onPressed: () {
                      if (_homeworkCreationDate.text == "" ||
                          _homeworkDeadline.text == "" ||
                          _homeworkContenu.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Veuillez remplir tous les champs"),
                          ),
                        );
                      } else {
                        Homework newHomework = Homework(
                          done: false,
                          creationDate: _homeworkCreationDate.text,
                          deadline: _homeworkDeadline.text,
                          contenu: _homeworkContenu.text,
                          classroom: "6eme A",
                        );

                        setState(() {
                          homework.add(newHomework);
                        });
                      }

                      //Temporary print test
                      /*print(
                        "Devoir  fait : ${newHomework.done},  date  de  création :  ${newHomework.creationDate},  échéance :  ${newHomework.deadline}, contenu du devoir :  ${newHomework.contenu}, pour la classe de ${newHomework.classroom}",
                      );*/
                      _homeworkCreationDate.clear();
                      _homeworkDeadline.clear();
                      _homeworkContenu.clear();
                    },
                    child: Text("Valider"),
                  ),
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
                return Card(
                  margin: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  elevation: 3,
                  color: _color,
                  child: Row(
                    children: [
                      Icon(Icons.check, color: checkBoxDone),
                      Spacer(),
                      Text(homework[index].creationDate),
                      Spacer(),
                      Text(homework[index].deadline),
                      Spacer(),
                      Expanded(flex: 6, child: Text(homework[index].contenu)),
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
