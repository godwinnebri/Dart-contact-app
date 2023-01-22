import 'dart:io';

import 'contact_admin.dart';
import 'service.dart';

void main() {
  final contact = ContactsAdmin();
  while (true) {
    printMenu();
    final choice = readUserChoice();

    switch (choice) {
      case 1:
        contact.addContact();
        break;
      case 2:
        contact.displayContacts();
        break;
      case 3:
        contact.deleteContact();
        break;
      case 4:
        exit(0);
      default:
        print('Please enter a valid option');
    }
  }
}
