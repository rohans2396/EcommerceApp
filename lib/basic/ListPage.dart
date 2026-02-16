import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercounter/basic/List_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello List")),
      body: Consumer<ListProvider>(
        builder: (ctx, provider, __) {
          var allData = provider.data;
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text("${allData[index]['name']}"),
                      subtitle: Text("${allData[index]["contact"]}"),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<ListProvider>().update({"name":"Rohan Singh","contact":12324242}, index);
                              },
                              icon: Icon(Icons.update),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<ListProvider>().delete(index);
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text("No Data"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListProvider>().increment({
            "name": "Rohan",
            "contact": 7766975725,
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
