import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  var nameController = TextEditingController();
  var keyName = "name";
  var nameValue = "No Value Saved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: const Text("Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var name = nameController.text.toString();
                     var prefs = await SharedPreferences.getInstance();
                      prefs.setString(keyName, name);
                    },
                    child: const Text("Save")),
                Text(nameValue)
              ],
            ),
          ),
        ));
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(keyName);

    // nameValue =getName!=null? getName:nameValue;
    // nameValue =getName ?? nameValue;
    setState(() {
      nameValue = getName ?? nameValue;
    });
  }
}

