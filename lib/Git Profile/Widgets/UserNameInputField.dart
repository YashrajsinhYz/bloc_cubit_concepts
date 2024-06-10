import 'package:bloc_cubit_concepts/Git%20Profile/Cubit/github_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameInputField extends StatefulWidget {
  UserNameInputField({Key? key}) : super(key: key);

  @override
  State<UserNameInputField> createState() => _UserNameInputFieldState();
}

class _UserNameInputFieldState extends State<UserNameInputField> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        hintText: 'Search User here...',
        contentPadding: EdgeInsets.all(12),
      ),
      onSubmitted: (value) {
        context.read<GithubProfileCubit>().fetchData(textController.text);
      },
    );
    ;
  }
}
