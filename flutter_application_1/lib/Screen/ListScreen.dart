import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShoplistScreen extends StatefulWidget {
  const ShoplistScreen({Key? key}) : super(key: key);

  @override
  State<ShoplistScreen> createState() => _ShoplistScreenState();
}

class _ShoplistScreenState extends State<ShoplistScreen> {
  TextEditingController inputCon = TextEditingController();
  List<String> shop = [];
  CollectionReference items = FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
      FirebaseFirestore.instance.collection("users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check_circle_outline),
          style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(6, 5)),
          ),
          iconSize: 34.0,
        ),
        title: const Text('Shopping List'),
      ),
      body: Column(
        children: [
          const Divider(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: inputCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Input text',
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        await items.add({'item': inputCon.text}).then(
                            (value) => print('Item Added'));

                        inputCon.clear();
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Text('Loading...');
                      default:
                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot snapshot) {
                            return ListTile(
                              title: Text(snapshot['users']),
                            );
                          }).toList(),
                        );
                    }
                  })),
        ],
      ),
    );
  }
}
