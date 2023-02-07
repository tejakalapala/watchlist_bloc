import 'package:flutter/material.dart';

import 'package:watchlist_bloc/contacts_list.dart';



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
      child: Scaffold(appBar: 
      AppBar(
        title: const Text('watchlist') ,
        bottom: const TabBar(
          labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
          isScrollable: true,
          tabs: <Widget>[
          
          Tab(text: "Contacts1",),
          Tab(text: "Contacts2",),
          Tab(text: "Contacts3",),
          Tab(text: "Contacts4",),
          Tab(text: "Contacts5",),

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