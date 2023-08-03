import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/comp_work_list.dart';
import 'package:todo_app/list.dart';
import 'package:todo_app/incomp_work_list_widget.dart';
import 'package:todo_app/model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final date = DateTime.now();
  var count1 = listWork.length;
  var count2 = 0;
  int percent = 0;
  final formKey = GlobalKey<FormState>();
  String? work;
  void changeCount(int value) {
    setState(() {
      count1 = value;
      count2 = listWork.length - count1;
      percent = (count2 / listWork.length * 100).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget compPriviewContent = ListWorkComp(
      list: listWork,
      onChanged: changeCount,
    );
    Widget incompPriviewContent = ListWork(
      list: listWork,
      onChanged: changeCount,
    );
    Widget priviewContent = const SizedBox(
      height: 350,
      child: Center(
        child: Text(
          "Nothing to show",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
    if (count1 == 0) {
      setState(() {
        incompPriviewContent = const Center(
          child: Text(
            "No pending work",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      });
    }
    if (count2 == 0) {
      setState(() {
        compPriviewContent = const Center(
          child: Text(
            "Start doing work",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      });
    }
    if (listWork.isNotEmpty) {
      setState(() {
        priviewContent = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text('Ongoing',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 35,
                  width: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(194, 217, 214, 214),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    count1.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            incompPriviewContent,
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text('Completed',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 35,
                  width: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(194, 217, 214, 214),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    count2.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            compPriviewContent
          ],
        );
      });
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'morning',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 147, 145, 145)),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(194, 217, 214, 214),
                            borderRadius: BorderRadius.circular(80)),
                        child: const Icon(Icons.calendar_today),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return SimpleDialog(
                                  title: const Text(
                                    "Add Work",
                                    textAlign: TextAlign.center,
                                  ),
                                  contentPadding: const EdgeInsets.all(5),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Form(
                                        key: formKey,
                                        child: TextFormField(
                                          keyboardType: TextInputType.name,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Fill the given field properly";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            work = newValue;
                                          },
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();
                                            setState(() {
                                              listWork
                                                  .add(ToDoWork(work: work!));
                                              count1 = listWork.length - count2;
                                              percent = (count2 /
                                                      listWork.length *
                                                      100)
                                                  .toInt();
                                            });

                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: const Text("Add"))
                                  ],
                                );
                              });
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(194, 217, 214, 214),
                              borderRadius: BorderRadius.circular(80)),
                          child: const Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('yMMMMEEEEd').format(date),
                            style: const TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text("Today's progress",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 23)),
                          const Spacer(),
                          Text(
                            "$count2/${listWork.length}",
                            style: const TextStyle(color: Colors.white60),
                          ),
                          Text(
                            "$percent%",
                            style: const TextStyle(
                                fontSize: 90,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          LinearPercentIndicator(
                            
                            animation: true,
                            percent: percent / 100,
                            lineHeight: 20,
                           barRadius: const Radius.circular(20),
                            progressColor: Colors.grey,
                            backgroundColor: Colors.black,
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  priviewContent
                ],
              )),
        ),
      ),
    );
  }
}
