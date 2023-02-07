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