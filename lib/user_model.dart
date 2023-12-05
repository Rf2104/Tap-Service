import 'dart:io';

class Job {
  final int exp;
  final int price;
  final String jobName;
  final String jobDescription;

  const Job({
    required this.exp,
    required this.price,
    required this.jobName,
    required this.jobDescription,
  });
}

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String location;
  final String aboutMe;
  final List<Job> jobs; // Include the Job property
  final File? image;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.location,
    required this.aboutMe,
    required this.jobs,
    this.image,
  });

  toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'location': location,
      'aboutMe': aboutMe,
      'image': image?.path,
      'jobs': jobs.map((job) => {
        'exp': job.exp,
        'price': job.price,
        'jobName': job.jobName,
        'jobDescription': job.jobDescription,
      }).toList(),
    };
  }
}
