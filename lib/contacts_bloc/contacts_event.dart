part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}
class LoadContactsEvent extends ContactsEvent {
  final List<Contact> contacts;
  const LoadContactsEvent({this.contacts = const <Contact>[]});
  @override
  List<Object> get props => [contacts];
}



class SortContactsEventAtoZ extends ContactsEvent{
  final List<Contact> contacts;
  // final  sortIndex;
  const SortContactsEventAtoZ({this.contacts = const <Contact>[]});
  @override
  List<Object> get props => [contacts];
}

class SortContactsEventZtoA extends ContactsEvent{
  final List<Contact> contacts;
  // final  sortIndex;
  const SortContactsEventZtoA({this.contacts = const <Contact>[]});
  @override
  List<Object> get props => [contacts];
}

class SortContactsEvent0to9 extends ContactsEvent{
  final List<Contact> contacts;
  // final  sortIndex;
  const SortContactsEvent0to9({this.contacts = const <Contact>[]});
  @override
  List<Object> get props => [contacts];
}

class SortContactsEvent9to0 extends ContactsEvent{
  final List<Contact> contacts;
  // final  sortIndex;
  const SortContactsEvent9to0({this.contacts = const <Contact>[]});
  @override
  List<Object> get props => [contacts];
}