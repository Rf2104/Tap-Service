import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_final/user_model.dart';
import 'package:projeto_final/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _userRepo = Get.put(UserRepository());

  List<Job> parseJobs(String jobsText) {
  List<Job> jobs = [];

  if (jobsText.isNotEmpty) {
    List<String> jobList = jobsText.split(',').map((job) => job.trim()).toList();

    for (String jobString in jobList) {
      List<String> jobDetails = jobString.split(':');

      if (jobDetails.length == 4) {
        String exp = jobDetails[0].trim();
        String price = jobDetails[1].trim();
        String jobName = jobDetails[2].trim();
        String jobDescription = jobDetails[3].trim();

        print('Parsed Job Details: exp=$exp, price=$price, jobName=$jobName, jobDescription=$jobDescription');


        Job job = Job(
          exp: exp,
          price: price,
          jobName: jobName,
          jobDescription: jobDescription,
        );
        jobs.add(job);
      } else {
        // Handle invalid job string
        print('Invalid job string: $jobString');
      }
    }
  }

  return jobs;
}


  getUserID(){
    final id = FirebaseAuth.instance.currentUser!.uid;
    if (id != null) {
      return id;
    } else {
      Get.snackbar("Error", "Something went wrong!");
    }
  }

  getUserData() {
    final email = FirebaseAuth.instance.currentUser!.email;
    if (email != null) {
      print(_userRepo.getUserDetails(email));
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Something went wrong!");
    }
  }

  updateUser(UserModel user) async {
    await _userRepo.updateUser(user);
  }

  updateUserImage(String image, UserModel user) async {
    await _userRepo.updateUserImage(image, user);
  }

  updateUserJobs(List<Job> jobs, UserModel user) async {
    await _userRepo.updateUserJobs(jobs, user);
  }

  getUserImage(UserModel user) {
    return _userRepo.getUserImage(user);
  }
  
  getAboutMe(UserModel user) {
    if (user.aboutMe.isNotEmpty) {
      return user.aboutMe;
    } else {
      return "Tell something about you!";
    }
  }
}
