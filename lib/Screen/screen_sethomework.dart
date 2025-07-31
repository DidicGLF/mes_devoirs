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
//List<Homework> homework = getHomeworkList();

List<Classroom> classroom = getClassroomList();

class InputState extends State<GetHomework> {
  Color _color = Colors.white12;
  Color checkBoxDone = Colors.black;
  int _classroomId = -1;

  List<Homework> homework = [];

  void initState() {
    super.initState();
    loadExistingHomework();
  }

  void loadExistingHomework() async {
    List<Homework> existingHomework = await Homework.loadHomeworkList(
      Homework.getDefaultFilePath(),
    );
    setState(() {
      homework = existingHomework;
    });
  }

  void editHomework(int index) {
    final TextEditingController contenuController = TextEditingController(
      text: homework[index].contenu,
    );
    final TextEditingController deadlineController = TextEditingController(
      text: homework[index].deadline,
    );

    int selectedClassroomId = homework[index].classroomId;
    String? errorMessage;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text('Modifier le devoir'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Message d'erreur
                    if (errorMessage != null)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          border: Border.all(color: Colors.red.shade200),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    // Champ contenu
                    TextField(
                      controller: contenuController,
                      decoration: InputDecoration(
                        labelText: 'Contenu du devoir',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),

                    // Champ deadline
                    TextField(
                      controller: deadlineController,
                      decoration: InputDecoration(
                        labelText: 'Deadline',
                        border: OutlineInputBorder(),
                        hintText:
                            'Ex: Vendredi prochain, Dans 2 semaines, 15/12/2024...',
                      ),
                    ),
                    SizedBox(height: 16),

                    // Dropdown pour la classe
                    DropdownButtonFormField<int>(
                      value: selectedClassroomId,
                      decoration: InputDecoration(
                        labelText: 'Classe',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          classroom.asMap().entries.map((entry) {
                            int classroomId = entry.key;
                            var classroomData = entry.value;
                            return DropdownMenuItem<int>(
                              value: classroomId,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  color: classroomData.color,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  classroomData.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (int? newValue) {
                        setDialogState(() {
                          selectedClassroomId = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                // Bouton Annuler
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Annuler'),
                ),

                // Bouton Sauvegarder
                ElevatedButton(
                  onPressed: () {
                    // Validation
                    if (contenuController.text.trim().isEmpty) {
                      setDialogState(() {
                        errorMessage = 'Le contenu ne peut pas être vide';
                      });
                      return;
                    }

                    if (deadlineController.text.trim().isEmpty) {
                      setDialogState(() {
                        errorMessage = 'La deadline ne peut pas être vide';
                      });
                      return;
                    }

                    // Mettre à jour le devoir
                    setState(() {
                      homework[index].contenu = contenuController.text.trim();
                      homework[index].deadline = deadlineController.text.trim();
                      homework[index].classroomId = selectedClassroomId;
                    });

                    // Sauvegarder
                    Homework.saveHomeworkList(
                      homework,
                      Homework.getDefaultFilePath(),
                    );

                    // Fermer le dialog
                    Navigator.of(context).pop();

                    // Message de confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Devoir modifié avec succès')),
                    );
                  },
                  child: Text('Sauvegarder'),
                ),
              ],
            );
          },
        );
      },
    );
  }

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
                          Homework.saveHomeworkList(
                            homework,
                            Homework.getDefaultFilePath(),
                          );
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
                                      Homework.saveHomeworkList(
                                        homework,
                                        Homework.getDefaultFilePath(),
                                      );
                                    });
                                  },
                                ),

                                // Edit button
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.black),
                                  onPressed: () {
                                    editHomework(index);
                                  },
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
                                      Homework.saveHomeworkList(
                                        homework,
                                        Homework.getDefaultFilePath(),
                                      );
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
                    Homework.saveHomeworkList(
                      homework,
                      Homework.getDefaultFilePath(),
                    );
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
