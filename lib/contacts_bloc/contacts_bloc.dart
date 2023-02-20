
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
    on<SortContactsEventAtoZ>(_onSortContactAtoZ);
    on<SortContactsEventZtoA>(_onSortContactZtoA);
    on<SortContactsEvent0to9>(_onSortContact0to9);
    on<SortContactsEvent9to0>(_onSortContact9to0);
  }
  void _onSortContactAtoZ(SortContactsEventAtoZ event,Emitter<ContactsState> emit){
    if (kDebugMode) {
      print("onSortContact");
    }
    final state = this.state;
    if(state is ContactsLoadedState){
      emit(ContactsLoadingState());
      List<Contact> contacts = state.contacts;
      
    contacts.sort((a, b) => a.name!.compareTo(b.name!)
    );
    
    emit(ContactsLoadedState(contacts));
    }
  }
  void _onSortContactZtoA(SortContactsEventZtoA event,Emitter<ContactsState> emit){
    if (kDebugMode) {
      print("onSortContact");
    }
    final state = this.state;
    if(state is ContactsLoadedState){
      emit(ContactsLoadingState());
      List<Contact> contacts = state.contacts;
      
    contacts.sort((b, a) => a.name!.compareTo(b.name!)
    );
    
    emit(ContactsLoadedState(contacts));
    }
  }
  void _onSortContact0to9(SortContactsEvent0to9 event,Emitter<ContactsState> emit){
    if (kDebugMode) {
      print("onSortContact");
    }
    final state = this.state;
    if(state is ContactsLoadedState){
      emit(ContactsLoadingState());
      List<Contact> contacts = state.contacts;
      
    contacts.sort((a, b) => a.id!.compareTo(b.id!)
    );
    
    emit(ContactsLoadedState(contacts));
    }
  }

  void _onSortContact9to0(SortContactsEvent9to0 event,Emitter<ContactsState> emit){
    if (kDebugMode) {
      print("onSortContact");
    }
    final state = this.state;
    if(state is ContactsLoadedState){
      emit(ContactsLoadingState());
      List<Contact> contacts = state.contacts;
      
    contacts.sort((b, a) => a.id!.compareTo(b.id!)
    );
    
    emit(ContactsLoadedState(contacts));
    }
  }
}
