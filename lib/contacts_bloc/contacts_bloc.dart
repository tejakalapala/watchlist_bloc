
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/models/contact.dart';
import 'package:watchlist_bloc/repos/repositories.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactRepository _contactRepository;
  ContactsBloc(this._contactRepository) : super(ContactsLoadingState()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(ContactsLoadingState());
      try {
        final contacts = await _contactRepository.getContacts();
        emit(ContactsLoadedState(contacts));
      } catch (e) {
        emit(ContactsErrorState(e.toString()));
      }
    });
    on<SortContactsEvent>(_onSortContact);
  }
  void _onSortContact(SortContactsEvent event,Emitter<ContactsState> emit){
    if (kDebugMode) {
      print("onSortContact");
    }
    final state = this.state;
    if(state is ContactsLoadedState){
      emit(ContactsLoadingState());
      List<Contact> contacts = state.contacts;
      if(event.sortIndex == 1){
    contacts.sort((a, b) => a.name!.compareTo(b.name!)
    );
      }else if(event.sortIndex == 2){
    contacts.sort((b, a) => a.name!.compareTo(b.name!)
    );
      }else if(event.sortIndex == 3){
    contacts.sort((a, b) => a.id!.compareTo(b.id!)
    );
      }
      else if(event.sortIndex == 4){
    contacts.sort((b, a) => a.id!.compareTo(b.id!)
    );
      }
    
    emit(ContactsLoadedState(contacts));
    }
  }
}
