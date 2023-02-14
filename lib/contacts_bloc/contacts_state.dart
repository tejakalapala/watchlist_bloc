part of 'contacts_bloc.dart';

abstract class ContactsState extends Equatable {
  const ContactsState();
  
  @override
  List<Object> get props => [];
}

class ContactsLoadingState extends ContactsState {}
class ContactsLoadedState extends ContactsState{
  final List<Contact> contacts;
  const ContactsLoadedState(this.contacts);
  @override
  List<Object> get props => [contacts];
}
class ContactsErrorState extends ContactsState {
  final String error;
  const ContactsErrorState(this.error);
  @override
  List<Object> get props => [error];
}