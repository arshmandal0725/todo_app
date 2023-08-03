import 'package:flutter/material.dart';
import 'package:todo_app/model.dart';

class ListWork extends StatefulWidget {
  const ListWork({super.key, required this.list, required this.onChanged});
  final List<ToDoWork> list;
  final void Function(int value) onChanged;
  @override
  State<ListWork> createState() => _ListWorkState();
}

class _ListWorkState extends State<ListWork> {
  @override
  Widget build(BuildContext context) {
    final list1 = widget.list.where((work) => work.iscompleted == false);

    return Column(
        children: list1
            .map((e) => Container(
                  decoration: const BoxDecoration(
                      border:
                          BorderDirectional(bottom: BorderSide(width: 0.2))),
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Checkbox(
                        value: e.iscompleted,
                        onChanged: (value) {
                          setState(() {
                            e.iscompleted = !e.iscompleted;
                           widget.onChanged(list1.length);
                          });
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        e.work,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ))
            .toList());
  }
}
