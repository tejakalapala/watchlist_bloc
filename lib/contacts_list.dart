import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/contacts_bloc/contacts_bloc.dart';
import 'package:watchlist_bloc/models/contact.dart';
import 'package:watchlist_bloc/select_sort.dart';
import 'package:watchlist_bloc/theme_cubit.dart';

class ContactsList extends StatefulWidget {
  // const ContactsList({super.key});
  // ignore: prefer_typing_uninitialized_variables
  final indexNum;
  const ContactsList({super.key, this.indexNum});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  var isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      context.read<ContactsBloc>().add(const LoadContactsEvent());
      isInit = false;
    }
    super.didChangeDependencies();
  }

  List<Contact> sendContacts = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return Scaffold(
          body: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if (state is ContactsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ContactsLoadedState) {
                List<Contact> contactList = state.contacts;
                sendContacts = contactList;
                return ContactsListView(contactList: contactList);
              } else if (state is ContactsErrorState) {
                return const Center(child: Text("Something went wrong!"));
              }
              return Container();
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: FloatingActionButton(
              shape: const ContinuousRectangleBorder(),
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromARGB(255, 70, 52, 52),
              onPressed: () {
                // context.read<ContactsBloc>().add(SortContactsEvent(contacts: sendContacts));
                _showSortOptions(context);
              },
              child: const Icon(Icons.sort),
            ),
          ),
        );
      },
    );
  }

  void _getSortIndex(int sortIndex) {
    // print(sortIndex);
    if (sortIndex > 0) {
      switch (sortIndex) {
        case 1:
          context
              .read<ContactsBloc>()
              .add(SortContactsEventAtoZ(contacts: sendContacts));
          break;
        case 2:
          context
              .read<ContactsBloc>()
              .add(SortContactsEventZtoA(contacts: sendContacts));
          break;
        case 3:
          context
              .read<ContactsBloc>()
              .add(SortContactsEvent0to9(contacts: sendContacts));
          break;
        case 4:
          context
              .read<ContactsBloc>()
              .add(SortContactsEvent9to0(contacts: sendContacts));
          break;
        default:
          context
              .read<ContactsBloc>()
              .add(SortContactsEvent0to9(contacts: sendContacts));
      }
    }
  }

  void _showSortOptions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: SelectSort(_getSortIndex),
        );
      },
    );
  }
}

class ContactsListView extends StatelessWidget {
  const ContactsListView({
    super.key,
    required this.contactList,
  });

  final List<Contact> contactList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contactList.length,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                height: 90,
                child: BlocBuilder<ThemeCubit, ThemeData>(
                  builder: (context, state) {
                    return ListTile(
                        title: Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 25.0),
                          child: Text(
                            contactList[index].name!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        subtitle: Text(
                          contactList[index].number!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: SizedBox(
                          child: FadeInImage.assetNetwork(
                            image: (contactList[index].img!),
                            placeholder: "assets/images/placeholder_image.png",
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                  'assets/images/placeholder_image.png',
                                  fit: BoxFit.fitWidth);
                            },
                            fit: BoxFit.fitWidth,
                          ),
                        ));
                  },
                ),
              ),
            ),
          );
        });
  }
}
