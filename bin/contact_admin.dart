import 'dart:io';

import 'contact_model.dart';
import 'service.dart';

class ContactsAdmin {
  List<Contact> contactsList = [];

  void addContact() {
    print('Enter contact name:');
    String name = stdin.readLineSync() ?? '';
    print('Enter phone number:');
    String phone = stdin.readLineSync() ?? '';

    Contact newContact = Contact(
      name: name,
      phone: phone,
    );

    contactsList.add(newContact);
    print('Contact has been added successfully');
    print('✅---------------------------------✅');
  }

  void displayContacts() {
    if (contactsList.isEmpty) {
      print('No conntact found');
    } else {
      print('Your contacts:');
      for (int i = 0; i < contactsList.length; i++) {
        print('${i + 1}: ${contactsList[i].contactDetail()}');
      }
    }
  }

  void deleteContact() {
    if (contactsList.isNotEmpty) {
      displayContacts();
      print('Enter the index of the contact to delete:');
      final index = readUserChoice();
      final shiftedIndex = index - 1;
      if (shiftedIndex >= 0 && shiftedIndex < contactsList.length) {
        contactsList.removeAt(shiftedIndex);
        print('Contact has been deleted successfully');
        print('✅---------------------------------✅');
      } else {
        print('Invalid index');
        print('---------------------------------');
      }
    } else {
      print('Contact list is empty');
      print('---------------------------------');
    }
  }
}
