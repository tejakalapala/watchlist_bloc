
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/models/contact.dart';
import 'package:watchlist_bloc/repos/repositories.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactRepository _contactRepository;
  ContactsBloc(this._contactRepository) : super(ContactsLoadingState()) {
    on<ContactsEvent>((event, emit) async {
      emit(ContactsLoadingState());
      try {
        final contacts = await _contactRepository.getContacts();
        emit(ContactsLoadedState(contacts));
      } catch (e) {
        // emit(UserErrorState(e.toString()));
      }
    });
  }
}
