import 'package:chatdoctor/model/base-doctor.dart';
import 'package:flutter/material.dart';

import '../helper/converter.dart';
import '../helper/database-helper.dart';

class DoctorListPage extends StatefulWidget {
  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  late Future<List<BaseDoctor>> _doctorsFuture;

  @override
  void initState() {
    super.initState();
    _doctorsFuture = _fetchDoctors();
  }

  Future<List<BaseDoctor>> _fetchDoctors() async {
    final dbHelper = DatabaseHelper();
    final List<Map<String, dynamic>> maps = await dbHelper.getDoctors();

    return List.generate(maps.length, (i) {
      return convertToDoctor(maps[i]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor List'),
      ),
      body: FutureBuilder<List<BaseDoctor>>(
        future: _doctorsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No doctors found.'));
          } else {
            final doctors = snapshot.data!;

            return ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];

                // Ensure that `printJob` is not null
                final printJob = doctor.printJob() ?? 'No job description available';

                return ListTile(
                  title: Text(doctor.name ?? 'Unknown'),
                  subtitle: Text('Age: ${doctor.age ?? 'Unknown'}, Address: ${doctor.address ?? 'Unknown'}'),
                  // Display the job description in the trailing widget
                  trailing: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Job Description'),
                          content: SingleChildScrollView(
                            child: Text(printJob),
                          ),
                          actions: [
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
