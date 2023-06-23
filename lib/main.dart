import 'dart:io';

import 'package:comment/add_comment/comment_view.dart';
import 'package:comment/add_comment/cubit/comment_list_cubit.dart';
import 'package:comment/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'http_override.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(BlocProvider(
    create: (context) => CommentListCubit(),
    child: const MyApp(),
  ));
}

List navItems = [
  [Icons.home, 'home'],
  [Icons.add_card, 'add card'],
  [Icons.newspaper, 'news'],
  [Icons.account_balance, 'profile'],
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.defaultTheme,
      home: Scaffold(
        body: const CommentView(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          unselectedItemColor: Theme.of(context).dividerColor,
          selectedItemColor: Theme.of(context).primaryColor,
          items: navItems.map((e) {
            return BottomNavigationBarItem(
              icon: Icon(
                e[0],
              ),
              label: '',
            );
          }).toList(),
        ),
      ),
    );
  }
}
