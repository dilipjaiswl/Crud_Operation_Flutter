import 'package:flutter/material.dart';
import 'package:untitled1/screens/detailsPage.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
final items =[1,2,3,4,5,6,7,8,9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(" People Home Page")),
        backgroundColor: Colors.blueAccent,
      ),
          body: ListView.builder(
            itemCount: items.length,
              itemBuilder: (context, index){
              final item =items[index];
              return Card(

                child: ListTile(
                  title: Text("Item $item"),
                  subtitle: const Text("Subtitle"),
                  onTap:()=>openPage(context),
                  trailing: const Icon(Icons.chevron_right_outlined),
                ),
              );
              })
    );
  }
  openPage(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DetailPage()));
  }
}
