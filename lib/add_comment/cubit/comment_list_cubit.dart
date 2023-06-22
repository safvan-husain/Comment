import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:comment/add_comment/model/comment_model.dart';
import 'package:comment/add_comment/services/comment_services.dart';
import 'package:flutter/material.dart';

part 'comment_list_state.dart';

class CommentListCubit extends Cubit<CommentListState> {
  CommentListCubit() : super(CommentListState(comments: []));
  void initialComment() {
    CommentModel comment = CommentModel(
      comment: 'This is the first comment',
      imageUrl:
          'https://th.bing.com/th/id/OIP.ypSXdKe1AsTni4myyTayrwHaHa?pid=ImgDet&rs=1',
    );
    emit(CommentListState(comments: [comment]));
  }

  void addComment(CommentModel comment, BuildContext context) {
    final updatedList = List<CommentModel>.from(state.comments)..add(comment);
    emit(CommentListState(comments: updatedList));
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.greenAccent.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Comment Added'),
              Icon(Icons.done),
            ],
          ),
        );
      },
    ).show(context);
  }

  void getComments(CommentServices service) async {
    List<CommentModel> comments = await service.getComments();
    emit(CommentListState(comments: comments));
  }
}
