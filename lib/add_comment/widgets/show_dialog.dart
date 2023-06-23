import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final TextEditingController controller;
  const ShowDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _builtTitle(),
              const SizedBox(height: 10),
              _builTextfield(context),
              const SizedBox(height: 10),
              _builtButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Align _builtButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
                child: Text(
              'Add',
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ))),
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.pop(context, controller.text);
        },
      ),
    );
  }

  Container _builtTitle() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text(
        'Type below',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding _builTextfield(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: const EdgeInsets.only(bottom: 6.0),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TextFormField(
            autofocus: true,
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
    );
  }
}
