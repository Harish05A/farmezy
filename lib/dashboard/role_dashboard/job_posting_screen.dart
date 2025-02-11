// job_posting_screen.dart
import 'package:flutter/material.dart';
import 'package:farmezy/models/job.dart';
import 'package:farmezy/services/job_service.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  _JobPostingScreenState createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _wageController = TextEditingController();
  final JobService _jobService = JobService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap in Scaffold
      appBar: AppBar(
        title: Text('Post a Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
                controller: _titleController,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Job Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a job description';
                  }
                  return null;
                },
                controller: _descriptionController,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                controller: _locationController,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Wage',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a wage';
                  }
                  return null;
                },
                controller: _wageController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Job job = Job(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: _titleController.text,
                      description: _descriptionController.text,
                      location: _locationController.text,
                      wage: double.parse(_wageController.text),
                      postedBy: 'Farmer Name',
                      datePosted: DateTime.now(),
                      deadline: DateTime.now().add(Duration(days: 30)),
                    );
                    await _jobService.createJob(job);
                    _titleController.clear();
                    _descriptionController.clear();
                    _locationController.clear();
                    _wageController.clear();
                  }
                },
                child: Text('Post Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
