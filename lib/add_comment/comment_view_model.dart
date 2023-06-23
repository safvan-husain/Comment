// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:comment/add_comment/cubit/comment_list_cubit.dart';
import 'package:comment/add_comment/cubit/comment_repository.dart';
import 'package:comment/add_comment/services/comment_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'widgets/show_dialog.dart';

class CommentViewModel extends BaseViewModel {
  final BuildContext context;
  late CommentRepository commentRepository;
  CommentViewModel({
    required this.context,
  }) {
    final CommentServices commentServices =
        CommentServices(client: http.Client());
    final commentCubit = context.read<CommentListCubit>();
    commentRepository = CommentRepository(
        commentServices: commentServices, commentCubit: commentCubit);

    //if you want to use comments without fetching from the api use intialComment method to get the first comment
    commentRepository.initialComment();

    //if you want to disable fetching from the api, stop the below comment from executing
    // commentRepository.getComments(CommentServices(client: http.Client()));
  }
  final TextEditingController _textEditingController = TextEditingController();
  void showInputDailog() async {
    var result = await _showTextInputDialog(context, _textEditingController);
    _textEditingController.text = "";
    if (result != null && result.isNotEmpty && context.mounted) {
      commentRepository.postComment(
        title: result,
        onSuccess: () => showSuccess(),
      );
    }
  }

  void showSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'New Comment was added!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(Icons.done_outline)
          ],
        ),
        backgroundColor: Colors.grey[200], // Set the background color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }

  Future<String?> _showTextInputDialog(
      BuildContext context, TextEditingController controller) async {
    return showDialog(
      context: context,
      builder: (context) {
        return ShowDialog(controller: controller);
      },
    );
  }
}
