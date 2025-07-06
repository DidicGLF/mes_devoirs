import 'package:flutter/material.dart';
import 'package:mes_devoirs/Classes/classroom.dart';
import 'package:mes_devoirs/Classes/homework.dart';

class GetHomework extends StatefulWidget {
  @override
  InputState createState() => InputState();
}

//Sample list to fill the listview
List<Homework> homework = getHomeworkList();
List<Classroom> classroom = getClassroomList();

class InputState extends State<GetHomework> {
  Color _color = Colors.white;
  Color checkBoxDone = Colors.black;
  int _classroomId = -1;

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
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: classroom.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () {
                        _color = classroom[index].color;
                        _classroomId = classroom[index].classroomId;
                      },
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(9),
                          ),
                          backgroundColor: classroom[index].color,
                          foregroundColor: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                classroom[index].name,
                              ),
                              Text(
                                style: TextStyle(fontSize: 12),
                                classroom[index].classroomSize.toString(),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),

            //Homework input
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                border: Border.all(color: Colors.black, width: 1),
                color: _color,
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
                          classroomId: _classroomId,
                        );

                        setState(() {
                          homework.add(newHomework);
                        });
                      }
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
                      Expanded(child: Icon(Icons.check, color: checkBoxDone)),
                      Expanded(child: Text(homework[index].creationDate)),
                      Expanded(child: Text(homework[index].deadline)),
                      Expanded(flex: 6, child: Text(homework[index].contenu)),
                      Text(homework[index].classroomId.toString()),
                      Spacer(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Checkbox(
                                value: homework[index].done,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    homework[index].done = newValue!;
                                  });
                                  if (newValue == true) {
                                    checkBoxDone = Colors.black;
                                  } else {
                                    checkBoxDone = Colors.transparent;
                                  }
                                },
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {},
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
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
