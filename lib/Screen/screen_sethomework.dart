//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mes_devoirs/Classes/classroom.dart';
import 'package:mes_devoirs/Classes/homework.dart';

class GetHomework extends StatefulWidget {
  const GetHomework({super.key});

  @override
  InputState createState() => InputState();
}

//Sample list to fill the listview
List<Homework> homework = getHomeworkList();
List<Classroom> classroom = getClassroomList();

class InputState extends State<GetHomework> {
  Color _color = Colors.white12;
  Color checkBoxDone = Colors.black;
  int _classroomId = -1;

  // Create textfield controller + focusNode
  final TextEditingController _homeworkCreationDate = TextEditingController();
  final FocusNode _homeworkCreationDateFocusNode = FocusNode();
  final TextEditingController _homeworkDeadline = TextEditingController();
  final TextEditingController _homeworkContenu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saisie')),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            //Classroom list
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
                                style: TextStyle(fontSize: 10),
                                "Effectif : ${classroom[index].classroomSize.toString()}",
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _color = classroom[index].color;
                            _classroomId = classroom[index].classroomId;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            //Homework input
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 20, left: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _color,
                  labelText:
                      _classroomId > -1
                          ? classroom[_classroomId].name
                          : "Sélectionnez une classe",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(width: 30),
                    Text(
                      "Date de création : ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(flex: 1),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextField(
                        controller: _homeworkCreationDate,
                        focusNode: _homeworkCreationDateFocusNode,
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Saisissez une date",
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    Text("Pour le : ", style: TextStyle(color: Colors.black)),
                    Spacer(flex: 1),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextField(
                        controller: _homeworkDeadline,
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alarm, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(),
                          hintText: "Saisissez une date",
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    Text("Contenu : ", style: TextStyle(color: Colors.black)),
                    Spacer(flex: 1),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: TextField(
                        controller: _homeworkContenu,
                        style: const TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.notes, color: Colors.black),
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
                            /*_homeworkDeadline.text == "" ||*/
                            _homeworkContenu.text == "" ||
                            _classroomId == -1) {
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
                          _homeworkCreationDateFocusNode.requestFocus();

                          //Clear input field
                          _homeworkDeadline.clear();
                          _homeworkContenu.clear();
                        }
                      },
                      child: Text("Valider"),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),

            //Homework list
            Expanded(
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: homework.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    key: ValueKey(homework[index]), //for reorganisable list
                    margin: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                    elevation: 3,
                    color: classroom[homework[index].classroomId].color,
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: homework[index].contenu),
                        );
                      },
                      child: Row(
                        children: [
                          //drag icon
                          ReorderableDragStartListener(
                            index: index,
                            child: SizedBox(
                              width: 30,
                              child: Icon(
                                Icons.drag_handle,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          //Check icon
                          SizedBox(
                            width: 70,
                            child:
                                homework[index].done
                                    ? Icon(Icons.check, color: Colors.black)
                                    : SizedBox.shrink(),
                          ),
                          //Creation Date
                          SizedBox(
                            width: 130,
                            child: Text(
                              homework[index].creationDate,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          //deadline
                          SizedBox(
                            width: 230,
                            child: Text(
                              "Pour le : ${homework[index].deadline}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          //contenu
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                homework[index].contenu,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          //Classroom
                          SizedBox(
                            width: 80,
                            child: Text(
                              classroom[homework[index].classroomId].name,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          //Command to the right
                          SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Checkbox
                                Checkbox(
                                  value: homework[index].done,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      homework[index].done = newValue!;
                                    });
                                  },
                                ),

                                // Edit button
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.black),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),

                                // Delete button
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      homework.removeAt(index);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = homework.removeAt(oldIndex);
                    homework.insert(newIndex, item);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
