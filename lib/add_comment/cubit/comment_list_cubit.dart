import 'package:bloc/bloc.dart';
import 'package:comment/add_comment/model/comment_model.dart';

part 'comment_list_state.dart';

class CommentListCubit extends Cubit<CommentListState> {
  CommentListCubit() : super(CommentListState(comments: []));

  void addComment(CommentModel comment) {
    final updatedList = List<CommentModel>.from(state.comments)..add(comment);
    emit(CommentListState(comments: updatedList));
  }

  void updateComments(List<CommentModel> comments) async {
    emit(CommentListState(comments: comments));
  }
}
