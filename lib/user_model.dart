import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  final String exp;
  final String price;
  final String jobName;
  final String jobDescription;

  const Job({
    required this.exp,
    required this.price,
    required this.jobName,
    required this.jobDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      'exp': exp,
      'price': price,
      'jobName': jobName,
      'jobDescription': jobDescription,
    };
  }

  @override
  String toString() {
    return '$exp:$price:$jobName:$jobDescription';
  }
}

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String location;
  final String aboutMe;
  final List<Job> jobs; // Include the Job property
  final String? image;

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
      'image': image,
      'jobs': jobs
          .map((job) => {
                'exp': job.exp,
                'price': job.price,
                'jobName': job.jobName,
                'jobDescription': job.jobDescription,
              })
          .toList(),
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    return UserModel(
      id: snapshot.id,
      name: data?['name'] ?? '',
      email: data?['email'] ?? '',
      password: data?['password'] ?? '',
      location: data?['location'] ?? '',
      aboutMe: data?['aboutMe'] ?? '',
      image: data?['image'] ?? '',
      jobs: (data?['jobs'] as List?)
              ?.map((job) => Job(
                    exp: job?['exp'] ?? '',
                    price: job?['price'] ?? '',
                    jobName: job?['jobName'] ?? '',
                    jobDescription: job?['jobDescription'] ?? '',
                  ))
              .toList() ??
          [],
    );
  }
}
