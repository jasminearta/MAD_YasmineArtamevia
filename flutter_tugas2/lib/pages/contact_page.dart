// lib/pages/contact_page.dart

import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: Yasmine Artamevia',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: +6280110222009',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: artameviay@gmail.com',  // You can change this to an actual email if needed
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}