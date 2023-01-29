import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Image.asset('assets/images/radio.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            'إذاعة القرآن الكريم',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_next,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Icon(
                Icons.play_arrow_rounded,
                size: 60,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Icon(
                Icons.skip_previous,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
