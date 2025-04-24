import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PostForm()));
}

//defining enum
enum Category { Sports, Politics, Economy }

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();

  //Controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "description",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description is required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Category:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Column(
                children:
                    Category.values.map((category) {
                      return RadioListTile<Category>(
                        title: Text(category.name),
                        value: category,
                        groupValue: _selectedCategory,
                        onChanged: (Category? value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      );
                    }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedCategory != null) {
                    print("Title: ${_titleController.text}");
                    print("Description: ${_descriptionController.text}");
                    print(
                      "Category: ${_selectedCategory.toString().split('.').last}",
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Post created successfully")),
                    );
                  } else if (_selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a category")),
                    );
                  }
                },
                child: Text("Create Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}