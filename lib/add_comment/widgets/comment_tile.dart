import 'package:flutter/material.dart';

import 'package:comment/add_comment/model/comment_model.dart';

@immutable
class CommentTile extends StatelessWidget {
  final CommentModel comment;
  final VoidCallback? onTap;

  const CommentTile({
    Key? key,
    required this.comment,
    this.onTap,
  }) : super(key: key);
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
                onTap!();
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
