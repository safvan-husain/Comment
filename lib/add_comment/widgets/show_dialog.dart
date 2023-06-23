import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final TextEditingController controller;
  const ShowDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, seState) {
      return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Type below',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _builTextfield(controller),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 40,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 40, 91, 194),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
                  onTap: () => Navigator.pop(context, controller.text),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Column _builTextfield(controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: const EdgeInsets.only(bottom: 6.0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 218, 213, 213),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: TextFormField(
              maxLines: 2,
              minLines: 1,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Comment",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
