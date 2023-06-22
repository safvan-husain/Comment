import 'dart:developer';

import 'package:comment/add_comment/cubit/comment_list_cubit.dart';
import 'package:comment/add_comment/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentTile extends StatelessWidget {
  final CommentModel comment;

  CommentTile({
    super.key,
    required this.comment,
  });
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: comment.isLast
            ? Colors.grey[200]
            : const Color.fromARGB(255, 242, 249, 234),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _builtCircularImage(),
          Expanded(
              child: Text(
            comment.comment,
            overflow: TextOverflow.ellipsis,
          )),
          InkWell(
            onTap: () async {
              if (comment.isLast) {
                var result = await _showTextInputDialog(context, this);
                if (result != null && result.isNotEmpty) {
                  context.read<CommentListCubit>().addComment(CommentModel(
                        comment: result,
                        imageUrl:
                            'https://th.bing.com/th/id/OIP.ypSXdKe1AsTni4myyTayrwHaHa?pid=ImgDet&rs=1',
                      ));
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Icon(comment.isLast ? Icons.add : Icons.done),
            ),
          )
        ],
      ),
    );
  }

  Future<String?> _showTextInputDialog(BuildContext context, model) async {
    return showDialog(
      context: context,
      builder: (context) {
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
                    child: _builfield(),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                      onTap: () =>
                          Navigator.pop(context, _textFieldController.text),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Column _builfield() {
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
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: TextFormField(
              maxLines: 2,
              minLines: 1,
              controller: _textFieldController,
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

  Padding _builtCircularImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: CircleAvatar(
        radius: 21,
        backgroundColor: Colors.teal,
        child: CircleAvatar(
          radius: 19,
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.network(comment.imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
