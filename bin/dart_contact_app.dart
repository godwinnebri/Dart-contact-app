import 'dart:io';

class Contact {
  final String name;
  final String phone;

  Contact({
    required this.name,
    required this.phone,
  });

  String contactDetail() {
    return 'Name: $name, Phone: $phone';
  }
}

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

void printMenu() {
  print('What do you want to do?');
  print('1. Add contact');
  print('2. Display contacts');
  print('3. Delete contact');
  print('4. Exit');
  print('Enter your choice:');
}

int readUserChoice() {
  final choiceString = stdin.readLineSync() ?? '0';
  final choice = int.tryParse(choiceString) ?? 0;
  return choice;
}

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
