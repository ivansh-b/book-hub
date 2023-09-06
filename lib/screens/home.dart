import 'package:book_hub_flutter/auth/googleSignIn.dart';
import 'package:book_hub_flutter/screens/about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _stream =
        FirebaseFirestore.instance.collection('books').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: StreamBuilder(
          stream: _stream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('Loading...'),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () async {
                    //var url = data['Book Link'];
                    // var url = 'https://blog.logrocket.com';
                    // var uri = Uri.parse("https://www.geeksforgeeks.org/");

                    var uri = Uri.parse(data['Book Link']);

                    if (await canLaunchUrl(uri)) {
                      print('launch');
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      print('can not launch');
                    }
                    //var url = Uri.parse("https://www.geeksforgeeks.org/");
                    // if (await canLaunch(url)) {
                    //   print('yes');
                    //   await launch(url);
                    // } else {
                    //   //throw 'Could not launch $url';
                    //   print('no');
                    // }
                  },
                  child: Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Image.network(data['Image Path']),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(child: Text(data['Name']))
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(child: Image.asset('assets/logo.png')),
          ListTile(
            title: Text('About App'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ]),
      ),
    );
  }
}
