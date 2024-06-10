import 'package:flutter/material.dart';

import '../models/profile.dart';
import 'UserNameInputField.dart';

Column buildUserData(Profile profile) {
  return Column(
    // mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      UserNameInputField(),
      const SizedBox(height: 100),
      Column(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(profile.image.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            profile.name.toString(),
            style: const TextStyle(
              // color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              profile.blog.toString(),
              style: const TextStyle(
                // color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const SizedBox(height: 40),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2a2a2a).withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      profile.followers.toString(),
                      style: const TextStyle(
                        color: Color(0xff2BE1C8),
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      "FOLLOWERS",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      profile.following.toString(),
                      style: const TextStyle(
                        color: Color(0xff2BE1C8),
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      "FOLLOWING",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      profile.public_repos.toString(),
                      style: const TextStyle(
                        color: Color(0xff2BE1C8),
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      "REPOSITORIES",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
