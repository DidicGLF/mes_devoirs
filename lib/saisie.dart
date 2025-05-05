import 'package:flutter/material.dart';

class Saisie extends StatefulWidget{
  @override
  _saisieState createState() => _saisieState();
}

class _saisieState extends State<Saisie> {
     //const Saisie({super.key});  
  Color _color = Colors.grey;

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
              color: _color,//const Color.fromRGBO(158, 158, 158, 1),
              child: Row(
                children: [
                  Spacer(),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _color = Colors.blue;
                    });
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), foregroundColor: Colors.black, backgroundColor: Colors.blue, textStyle: TextStyle(fontSize: 14)), child: Text("Classe 1")),
                  Spacer(flex: 1),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _color = Colors.green;
                    });
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), foregroundColor: Colors.black, backgroundColor: Colors.green, textStyle: TextStyle(fontSize: 14)), child: Text("Classe 2")),
                  Spacer(flex: 1),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _color = Colors.red;
                    });
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), foregroundColor: Colors.black, backgroundColor: Colors.red, textStyle: TextStyle(fontSize: 14)), child: Text("Classe 3")),
                  Spacer(flex: 1),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _color = Colors.yellow;
                    });
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), foregroundColor: Colors.black, backgroundColor: Colors.yellow, textStyle: TextStyle(fontSize: 14)), child: Text("Classe 4")),
                  Spacer(flex: 1),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _color = Colors.pink;
                    });
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), foregroundColor: Colors.black, backgroundColor: Colors.pink, textStyle: TextStyle(fontSize: 14)), child: Text("Classe 5")),
                  Spacer(flex: 1),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _color = Colors.purple;
                    });
                  }, style: ElevatedButton.styleFrom(fixedSize: const Size(100, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), foregroundColor: Colors.black, backgroundColor: Colors.purple, textStyle: TextStyle(fontSize: 14)), child: Text("Classe 6")),
                  Spacer()
                ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.all(10),
              color: const Color.fromARGB(255, 219, 213, 213),
              child: Row(
                children: [
                  Spacer(),
                  Text("14/10/2024"),
                  Spacer(flex: 1),
                  Text("Lun 4 nov"),
                  Spacer(flex: 1),
                  Text("DS n°2 : Calcul littéral, transformation, puissances, exposant négatif, scratch en F303"),
                  Spacer(flex: 1),
                  Text("3°1"),
                  Spacer(flex: 1),
                  Checkbox(value: true, onChanged: (bool? value) {  },),
                  Spacer(flex: 1),
                  Icon(Icons.edit),
                  Spacer(flex: 1),
                  Icon(Icons.delete),
                  Spacer()
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
               color: const Color.fromARGB(255, 219, 213, 213),
              child: Row(
                children: [
                  Spacer(),
                  Text("14/10/2024"),
                  Spacer(flex: 1),
                  Text("Lun 4 nov"),
                  Spacer(flex: 1),
                  Text("DS n°2 : Calcul littéral, transformation, puissances, exposant négatif, scratch en F303"),
                  Spacer(flex: 1),
                  Text("3°1"),
                  Spacer(flex: 1),
                  Checkbox(value: true, onChanged: (bool? value) {  },),
                  Spacer(flex: 1),
                  Icon(Icons.edit),
                  Spacer(flex: 1),
                  Icon(Icons.delete),
                  Spacer()
                ],
              ),
            ),
        ],
        ),
        ),
    );
  }
}