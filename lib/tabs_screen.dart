import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:watchlist_bloc/contacts_list.dart';
import 'package:watchlist_bloc/main.dart';
import 'package:watchlist_bloc/theme_cubit.dart';

enum ThemePref {
  dark,
  light,
  systemDefault;
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
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            
            appBar: AppBar(
              actions: [
                popUpMenuButton(context)
              ],
              title:  Text('Watchlist',style: Theme.of(context).textTheme.titleLarge,),
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
      },
    );
  }

  PopupMenuButton<ThemePref> popUpMenuButton(BuildContext context) {
    return PopupMenuButton<ThemePref>(
                itemBuilder: (context) => [
                   PopupMenuItem(
                    value: ThemePref.light,
                    child: Text("Light",style: Theme.of(context).textTheme.labelSmall,),
                  ),
                   PopupMenuItem(
                    value: ThemePref.dark,
                    child: Text("Dark",style: Theme.of(context).textTheme.labelSmall,),
                  ),
                   PopupMenuItem(
                    value: ThemePref.systemDefault,
                    child: Text("System Settings",style: Theme.of(context).textTheme.labelSmall,),
                  )
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
              );
  }
}
