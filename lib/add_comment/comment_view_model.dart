// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comment/add_comment/cubit/comment_list_cubit.dart';
import 'package:comment/add_comment/model/comment_model.dart';
import 'package:comment/add_comment/services/comment_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CommentViewModel extends BaseViewModel {
  final BuildContext context;
  CommentViewModel({
    required this.context,
  }) {
    final commentCubit = context.read<CommentListCubit>();
    commentCubit.addComment(CommentModel(
      comment: 'This is the first comment',
      imageUrl:
          'https://th.bing.com/th/id/OIP.ypSXdKe1AsTni4myyTayrwHaHa?pid=ImgDet&rs=1',
    ));
    // commentCubit.getComments(CommentServices(client: http.Client()));
  }
  TextEditingController _textFieldController = TextEditingController();
}
