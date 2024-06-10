import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/UserNameInputField.dart';
import '../Widgets/buildUserData.dart';
import 'github_profile_cubit.dart';
import 'github_profile_state.dart';

class GithubProfileScreen extends StatefulWidget {
  const GithubProfileScreen({Key? key, this.reset}) : super(key: key);

  final reset;

  @override
  State<GithubProfileScreen> createState() => _GithubProfileScreenState();
}

class _GithubProfileScreenState extends State<GithubProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Github Profile"), centerTitle: true),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        // color: Colors.white,
        child: ListView(
          children: [
            BlocBuilder<GithubProfileCubit, GithubProfileState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return buildTextField();
                } else if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FinishState) {
                  return buildUserData(state.profile);
                }
                return buildTextField();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField() {
    return UserNameInputField();
  }
}
