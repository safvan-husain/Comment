import 'dart:developer';

import 'package:comment/add_comment/comment_view_model.dart';
import 'package:comment/add_comment/cubit/comment_list_cubit.dart';
import 'package:comment/add_comment/services/comment_services.dart';
import 'package:comment/add_comment/widgets/comment_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentView extends StatelessWidget {
  CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    CommentServices commentServices = CommentServices(client: http.Client());
    commentServices.getComments();
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CommentViewModel(context: context),
        builder: (context, model, s) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 247, 255, 250),
            appBar: const PreferredSize(
              preferredSize: Size(60, 80),
              child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'Add Comments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            body: SafeArea(
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.transparent,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/card.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                  ),
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.grey,
                      ),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                BlocBuilder<CommentListCubit, CommentListState>(
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          if (index == state.comments.length - 1) {
                            state.comments[index].isLast = true;
                          } else {
                            state.comments[index].isLast = false;
                          }
                          return CommentTile(comment: state.comments[index]);
                        },
                        itemCount: state.comments.length,
                      ),
                    );
                  },
                )
              ],
            )),
          );
        });
  }

  Future<String?> _showTextInputDialog(BuildContext context, model) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('TODO'),
          content: TextField(
            controller: model._textFieldController,
            decoration: const InputDecoration(
              hintText: "Enter task name",
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () =>
                  Navigator.pop(context, model._textFieldController.text),
            ),
          ],
        );
      },
    );
  }
}
