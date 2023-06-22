import 'package:bloc/bloc.dart';
import 'package:comment/add_comment/model/comment_model.dart';
import 'package:comment/add_comment/services/comment_services.dart';
import 'package:meta/meta.dart';

part 'comment_list_state.dart';

class CommentListCubit extends Cubit<CommentListState> {
  CommentListCubit() : super(CommentListState(comments: []));
  void addComment(CommentModel comment) {
    final updatedList = List<CommentModel>.from(state.comments)..add(comment);
    emit(CommentListState(comments: updatedList));
  }

  void getComments(CommentServices service) async {
    List<CommentModel> comments = await service.getComments();
    emit(CommentListState(comments: comments));
  }
}
