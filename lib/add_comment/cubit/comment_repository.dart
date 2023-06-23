import 'package:comment/add_comment/services/comment_services.dart';
import 'package:flutter/material.dart';

import '../model/comment_model.dart';
import 'comment_list_cubit.dart';

class CommentRepository {
  CommentServices commentServices;
  CommentListCubit commentCubit;
  CommentRepository({
    required this.commentServices,
    required this.commentCubit,
  });

  void postComment({
    required String title,
    required VoidCallback onSuccess,
  }) async {
    CommentModel? comment = await commentServices.postComment(title: title);
    if (comment != null) {
      commentCubit.addComment(comment);
      onSuccess();
    }
  }

  void getComments() async {
    //fetching comments from the api
    List<CommentModel> comments = await commentServices.fetchComments();
    commentCubit.updateComments(comments);
  }

  void initialComment() {
    //this method is used when you don't want to fetch comments from api
    CommentModel comment = CommentModel(
      comment: "This is the first comment",
      imageUrl:
          'https://th.bing.com/th/id/OIP.ypSXdKe1AsTni4myyTayrwHaHa?pid=ImgDet&rs=1',
    );
    commentCubit.updateComments([comment]);
  }
}
