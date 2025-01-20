import 'package:flutter/material.dart';

import '../http_helper_method.dart';


class EditPost extends StatefulWidget {
  EditPost(this.post, {super.key});
  Map post;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerBody = TextEditingController();

  @override
  initState() {
    super.initState();
    _controllerTitle.text = widget.post['title'];
    _controllerBody.text = widget.post['body'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _controllerTitle,
              ),
              TextFormField(
                controller: _controllerBody,
                maxLines: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, String> dataToUpdate = {
                      'title': _controllerTitle.text,
                      'body': _controllerBody.text,
                    };

                    bool status = await HTTPHelper()
                        .updateItem(dataToUpdate, widget.post['id'].toString());

                    if (status) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Post updated')));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Failed to update the post')));
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}