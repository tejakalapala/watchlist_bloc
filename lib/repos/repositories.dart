import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:watchlist_bloc/models/contact.dart';

class ContactRepository {
  var contactUrl = Uri.parse('http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts');

  Future<List<Contact>> getContacts() async {
    if (kDebugMode) {
      print('$contactUrl request sending');
    }
    try{
    final response = await http.get(contactUrl);
   
      final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Contact> loadedContacts = [];
    for (var contactData in extractedData) {
      loadedContacts.add(Contact(
        id: int.parse(contactData['id']), 
      number: contactData['Contacts'],
      name: contactData['name'],
      img: contactData['url']
      ));
      
    }
    return loadedContacts;
    }catch(error){
      rethrow;
    }
  }
}