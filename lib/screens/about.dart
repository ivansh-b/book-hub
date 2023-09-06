import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Book Hub',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              'Book Hub is an easy to use app which shares books with its users.',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Users can use or download any number of books without any restriction.',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Note:',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'The education information is provided for general informational and educaitonal purposes only.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'All the rights belong to the respective authors or institutions.',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
