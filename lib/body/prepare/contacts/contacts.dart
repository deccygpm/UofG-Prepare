import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/contacts/contact_card.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            List<Contact> contacts = snapshot.data!.contacts;
            return Scaffold(
              appBar: const CustomAppBar(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Headline(data: 'Contacts', color: themeBlue),
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: accentBlue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Below are some key contacts you can reach out to if you need help during your studies.',
                        style: TextStyle(
                          color: themeGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ContactCard(contact: contacts[index]);
                        },
                        separatorBuilder: ((context, index) => const Divider(
                              color: Colors.transparent,
                            )),
                        itemCount: contacts.length),
                  )
                ],
              ),
            );
          } else {
            return const Text('database error');
          }
        });
  }
}
