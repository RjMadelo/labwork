import 'package:flutter/material.dart';

class ShoplistScreen extends StatefulWidget {
  const ShoplistScreen({Key? key}) : super(key: key);

  @override
  State<ShoplistScreen> createState() => _ShoplistScreenState();
}

class _ShoplistScreenState extends State<ShoplistScreen> {
  TextEditingController inputCon = TextEditingController();
  List<String> shop = [];

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
                      onPressed: () {
                        setState(() {
                          shop.add(inputCon.text);
                        });
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
              child: ListView.builder(
                  itemCount: shop.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(shop.elementAt(index)),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              shop.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete_outline_rounded)),
                    );
                  }))
        ],
      ),
    );
  }
}
