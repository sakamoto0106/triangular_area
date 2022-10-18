import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:TriangularArea(),
    );
  }
}
class TriangularArea extends StatefulWidget{
  TriangularArea({Key? key}) : super(key: key);

  @override
  _TriangularAreaState createState() => _TriangularAreaState();

}
class _TriangularAreaState extends State<TriangularArea> {

  int currentindex = 0;
  String result = "";
  double height =0;
  double base =0;
  TextEditingController heightController = TextEditingController();
  TextEditingController baseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "TriangularArea",
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings,
                    color: Colors.black
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Height:",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    textAlign:  TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "heigh",
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                        )
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Base:",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: baseController,
                    textAlign:  TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "base",
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none
                        )
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          height = double.parse(heightController.value.text);
                          base = double.parse(baseController.value.text);
                        });
                        calculateBmi(height, base);
                      },
                      child: Text("Calculate",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Area is :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "$result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  void calculateBmi(double height,double base){
    double finalresult = base * height / 2;
    String bmi =finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

}