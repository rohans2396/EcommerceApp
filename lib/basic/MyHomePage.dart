import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercounter/basic/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    log("Build called 1");

    return Scaffold(
      appBar: AppBar(title: Text("MyHome")),

      body: Center(
        child: /*Text('${Provider.of<CounterProvider>(context).count}'),*/
        Consumer<CounterProvider>(builder: (ctx,_,__){
          log("Cosumer build called");
         return Text('${ctx.watch<CounterProvider>().getCount}');
        })

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Provider.of<CounterProvider>(context, listen: false).increment;
          context.read<CounterProvider>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
