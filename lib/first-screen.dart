import 'package:flutter/material.dart';
import 'package:todo_app/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.black,
                    child: Image.asset(
                        'assets/images/images-removebg-preview-2.png',
                        fit: BoxFit.contain),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.fromLTRB(40, 50, 30, 30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Manage",
                            style: TextStyle(
                                fontSize: 55, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'your',
                            style: TextStyle(
                                fontSize: 55, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            children: [
                              Spacer(),
                              Text(
                                'tasks',
                                style: TextStyle(
                                    fontSize: 55,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(137, 109, 109, 109)),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Get started",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) {
                                    return const SecondScreen();
                                  }));
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80)),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ))
            ],
          )),
    );
  }
}
