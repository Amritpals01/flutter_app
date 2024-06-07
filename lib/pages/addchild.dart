import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/gender_widget.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddChild extends StatefulWidget {
  const AddChild({super.key});

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> addchildkey = GlobalKey<FormState>();
  int _gender = 0;
  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Register Your Child")),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                //controller: namecontroller,
                decoration: new InputDecoration(
                  prefixIcon: new Icon(
                    Icons.person,
                  ),
                  hintText: "Child first Name",
                  labelText: "First name ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    //controller: namecontroller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "child last Name",
                        labelText: "Last name ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pick the Gender",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0.1),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(),
                      child: Column(
                        children: [
                          //widget for gender slct
                          GenderWidget(
                            onChange: (genderval) {
                              _gender = genderval;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_month),
                          labelText: "Enter date of birth",
                          hintText: "Date Of Birth"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                          setState(() {
                            dateController.text = formattedDate.toString();
                          });
                        } else {
                          print('Not Selected');
                        }
                      },
                    )),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            TextFormField(
                              //controller: namecontroller,
                              decoration: new InputDecoration(
                                prefixIcon: new Icon(Icons.local_hospital),
                                hintText: "Hospital name",
                                labelText: "Hospital ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Parent's Relation to child",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: ToggleSwitch(
                                labels: ['Mother', 'Father', 'Guardian'],
                                onToggle: (index) {
                                  print("Switched to : +$index");
                                },
                                fontSize: 18,
                                minWidth: 124,
                                minHeight: 50,
                                cornerRadius: 20,
                                icons: [
                                  FontAwesomeIcons.mars,
                                  FontAwesomeIcons.venus,
                                  FontAwesomeIcons.transgender
                                ],
                                iconSize: 20,
                                activeBgColor: [
                                  Colors.blueGrey,
                                  //Colors.black,
                                ],
                                activeFgColor: Colors.white,
                                inactiveFgColor: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Container(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("SUBMIT")),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
