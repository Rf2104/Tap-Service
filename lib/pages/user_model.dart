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

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      jobName: map['jobName'] ?? '',
      jobDescription: map['jobDescription'] ?? '',
      exp: map['exp'] ?? '',
      price: map['price'] ?? '',
    );
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
  final List<String>? dms;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.location,
    required this.aboutMe,
    required this.jobs,
    this.image,
    this.dms,
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
      'dms': dms,
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
      dms: (data?['dms'] as List?)?.map((dm) => dm as String).toList() ?? [],
    );
  }

  // Factory method to create a UserModel instance from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      location: map['location'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      jobs: (map['jobs'] as List?)
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
