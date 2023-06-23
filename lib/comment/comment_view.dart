import 'package:comment/comment/comment_view_model.dart';
import 'package:comment/comment/cubit/comment_list_cubit.dart';
import 'package:comment/comment/widgets/comment_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CommentViewModel(context: context),
        builder: (context, model, s) {
          return Scaffold(
            appBar: _builtAppBar(),
            body: SafeArea(
                child: Column(
              children: [
                _builtCardImage(),
                const SizedBox(
                  height: 10,
                ),
                _builtSearchBar(context),
                _builtComments(model)
              ],
            )),
          );
        });
  }

  Expanded _builtComments(CommentViewModel model) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<CommentListCubit, CommentListState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index == state.comments.length - 1) {
                  state.comments[index].isLast = true;
                  return CommentTile(
                    comment: state.comments[index],
                    onTap: () => model.showInputDailog(),
                  );
                } else {
                  state.comments[index].isLast = false;
                  return CommentTile(comment: state.comments[index]);
                }
              },
              itemCount: state.comments.length,
            );
          },
        ),
      ),
    );
  }

  Padding _builtSearchBar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).cardColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
                blurRadius: 0.5,
                blurStyle: BlurStyle.inner,
              ),
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 0),
                blurRadius: 0.5,
                blurStyle: BlurStyle.inner,
              ),
            ]),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              size: 40,
              color: Theme.of(context).dividerColor,
            ),
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container _builtCardImage() {
    return Container(
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
    );
  }

  PreferredSize _builtAppBar() {
    return const PreferredSize(
      preferredSize: Size(60, 80),
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Center(
          child: Text(
            'Add Comments',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
