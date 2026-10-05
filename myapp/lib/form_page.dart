import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget{
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData()async{
    if (nameController.text.trim().isEmpty || 
    ageController.text.trim().isEmpty||
    birthController.text.trim().isEmpty||
    genderController.text.trim().isEmpty||
    statusController.text.trim().isEmpty||
    addressController.text.trim().isEmpty||
    phoneController.text.trim().isEmpty||
    emailController.text.trim().isEmpty||
    hobbiesController.text.trim().isEmpty||
    skillsController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please Fill in all fields'))
      );
      return;
    }

    await firestore.collection('Informations').add({
      'Full Name' : nameController.text.trim(),
      'Age' : ageController.text.trim(),
      'Birth Date' : birthController.text.trim(),
      'Gender' : genderController.text.trim(),
      'Civil Status' : statusController.text.trim(),
      'Address' : addressController.text.trim(),
      'Phone' : phoneController.text.trim(),
      'Email' : emailController.text.trim(),
      'Hobbies' : hobbiesController.text.trim(),
      'Skills' : skillsController.text.trim(),
      'createdAt' : FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data Saved Successfully'),
      ),
      );
    
    nameController.clear();
    ageController.clear();
    birthController.clear();
    genderController.clear();
    statusController.clear();
    addressController.clear();
    phoneController.clear();
    emailController.clear();
    hobbiesController.clear();
    skillsController.clear();
  }
  @override
  void dispose(){
    nameController.dispose();
    ageController.dispose();
    birthController.dispose();
    genderController.dispose();
    statusController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    hobbiesController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: const Text('BIODATA FORM')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 12),
            Text('PERSONAL INFORMATION',
            style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                ),
            ),

            const SizedBox(height: 12),

            TextField(   
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'FullName',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                prefixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: birthController,
              decoration: const InputDecoration(
                labelText: 'Birth Date',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                prefixIcon: Icon(Icons.male),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: statusController,
              decoration: const InputDecoration(
                labelText: 'Civil Status',
                prefixIcon: Icon(Icons.family_restroom),
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 12),
            Text('CONTACT INFORMATION',
            style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 12),
            Text('OTHER INFORMATION',
            style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: hobbiesController,
              decoration: const InputDecoration(
                labelText: 'Hobbies',
                prefixIcon: Icon(Icons.favorite),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: skillsController,
              decoration: const InputDecoration(
                labelText: 'Technical Skills',
                prefixIcon: Icon(Icons.code),
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: saveData , child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}