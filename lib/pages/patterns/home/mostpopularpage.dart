import 'package:flutter/material.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/titles/bigtitlewidget.dart';
import '../../../widgets/presentation/category/categorypresentationwidget.dart';

class MostPopularPage extends StatefulWidget {
  const MostPopularPage({Key? key}) : super(key: key);

  @override
  State<MostPopularPage> createState() => _MostPopularPageState();
}

class _MostPopularPageState extends State<MostPopularPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigTitleWidget(text: 'Most Popular'),
            const SearchBoxWidget(),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('85 categories.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                  Text('Sort by...', style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                ],
              ),
            ),

            CategoryPresentationWidget(),
            CategoryPresentationWidget(),
            CategoryPresentationWidget(),
            CategoryPresentationWidget(),
          ]
      ),
    );
  }
}