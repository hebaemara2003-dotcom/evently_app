import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              // color: AppColors.primaryDark
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Language'),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
