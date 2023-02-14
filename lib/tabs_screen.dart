import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:watchlist_bloc/contacts_list.dart';
import 'package:watchlist_bloc/theme_cubit.dart';
enum ThemePref{
  dark,light,systemDefault;
}
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = '/tabs';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
     
        return DefaultTabController(
          
          length: 5,
          
          child: Scaffold(
            appBar: AppBar(
              actions: [
               
                PopupMenuButton<ThemePref>(itemBuilder: (context)=>[
                  const PopupMenuItem(value: ThemePref.light,child: Text("Light"),),
                  const PopupMenuItem(value: ThemePref.dark,child: Text("Dark"),),
                  const PopupMenuItem(value: ThemePref.systemDefault,child: Text("System Settings"),)
                ],
                onSelected: (value) {
                  switch (value) {
                    case ThemePref.light:
                      context.read<ThemeCubit>().setTheme(value);
                      break;
                    case ThemePref.dark:
                    context.read<ThemeCubit>().setTheme(value);
                      break;
                    case ThemePref.systemDefault:
                    context.read<ThemeCubit>().setTheme(value);
                      break;
                    default:
                  }
                },
                icon: const Icon(Icons.brightness_6),
                
                )
                
              ],
              title: const Text('watchlist'),
              bottom: const TabBar(
                  // labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text: "Group1",
                    ),
                    Tab(
                      text: "Group2",
                    ),
                    Tab(
                      text: "Group3",
                    ),
                    Tab(
                      text: "Group4",
                    ),
                    Tab(
                      text: "Group5",
                    ),
                  ]),
            ),
            body: const TabBarView(children: <Widget>[
              ContactsList(),
              ContactsList(),
              ContactsList(),
              ContactsList(),
              ContactsList(),
            ]),
          ),
        );
      
  }
}
