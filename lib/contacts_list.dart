import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/contacts_bloc/contacts_bloc.dart';
import 'package:watchlist_bloc/models/contact.dart';
import 'package:watchlist_bloc/repos/repositories.dart';

class ContactsList extends StatefulWidget {
  // const ContactsList({super.key});
  // ignore: prefer_typing_uninitialized_variables
  final indexNum;
  const ContactsList({super.key, this.indexNum});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  var isLoading = true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => ContactsBloc(
            ContactRepository(),
          )..add(const LoadContactsEvent()),
          child: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if(state is ContactsLoadingState){
                return const Center(child: CircularProgressIndicator());
              }else if(state is ContactsLoadedState){
                List<Contact> contactList = state.contacts;
                return ListView.builder(
                itemCount: contactList.length,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: SizedBox(
                        height: 90,
                        child: ListTile(
                          title: Padding(
            padding: const EdgeInsets.only(top:10.0,bottom:25.0),
            child: Text(contactList[index].name!,style: const TextStyle(fontSize:20.0 ),),
          ),
          subtitle: 
          // Padding(
            // padding: const EdgeInsets.only(top:18.0),
            // child: 
            Text(contactList[index].number!),
          // ),
          trailing: FadeInImage(
        image: NetworkImage(contactList[index].img!),
        placeholder: const AssetImage(
            "assets/images/placeholder_image.png"),
        imageErrorBuilder:
            (context, error, stackTrace) {
          return Image.asset(
              'assets/images/placeholder_image.png',
              fit: BoxFit.fitWidth);
        },
        fit: BoxFit.fitWidth,
    )
                        ),
                      ),
                    ),
                  );
                }
                 
                  
                
              );
              }else if(state is ContactsErrorState){
                return const Center(child: Text("Something went wrong!"));
              }
              return Container();
            },
          ),
        ),
      );
    
  }
}
