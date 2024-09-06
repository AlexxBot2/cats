import 'package:cats/core/theme/colors.dart';
import 'package:cats/core/theme/theme.dart';
import 'package:cats/core/widgets/image_widget.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/features/cat/presentation/widgets/cat_detail_item_widget.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        title: Text(cat.name),
        titleTextStyle: AppTheme.titleTextStyle,
        
      ),
      body: Column(
        children: [
          ImageWidget(imagePath: cat.imagePath),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Scrollbar(
                  child: SingleChildScrollView(
                      child: Column(children: [Text(cat.description), const SizedBox(height: 10,),
                      CatDetailItemWidget('Temperament', cat.temperament),
                      CatDetailItemWidget('Country', cat.origin),
                      CatDetailItemWidget('Weight imperial', cat.weight.imperial),
                      CatDetailItemWidget('Weight metric', cat.weight.metric),
                      CatDetailItemWidget('Life Span', cat.lifeSpan),
                      CatDetailItemWidget('Indoor', cat.indoor.toString()),
                      CatDetailItemWidget('Lap', cat.lap.toString()),
                      CatDetailItemWidget('Alternative names', cat.altNames.toString()),
                      CatDetailItemWidget('Adaptability', cat.adaptability.toString()),
                      CatDetailItemWidget('Affection Level', cat.affectionLevel.toString()),
                      CatDetailItemWidget('Child friendly', cat.childFriendly.toString()),
                      CatDetailItemWidget('Dog friendly', cat.dogFriendly.toString()),
                      CatDetailItemWidget('Energy level', cat.evergyLevel.toString()),
                      CatDetailItemWidget('Grooming', cat.grooming.toString()),
                      CatDetailItemWidget('Health issues', cat.healthIssues.toString()),
                      CatDetailItemWidget('Intelligence', cat.intelligence.toString()),
                      CatDetailItemWidget('Shedding level', cat.sheddingLevel.toString()),
                      CatDetailItemWidget('Social needs', cat.socialNeeds.toString()),
                      CatDetailItemWidget('Stranger friendly', cat.strangerFriendly.toString()),
                      CatDetailItemWidget('Vocalisation', cat.vocalisation.toString()),
                      CatDetailItemWidget('Experimental', cat.experimental.toString()),
                      CatDetailItemWidget('Hairless', cat.hairless.toString()),
                      CatDetailItemWidget('Natural', cat.natural.toString()),
                      CatDetailItemWidget('Rare', cat.rare.toString()),
                      CatDetailItemWidget('Rex', cat.rex.toString()),
                      CatDetailItemWidget('Suppressed', cat.suppressedTail.toString()),
                      CatDetailItemWidget('Short legs', cat.shortLegs.toString()),
                      CatDetailItemWidget('Hypoallergenic', cat.hypoallergenic.toString()),
                                          
                      
                      
                      ])),
                ),
              ))
        ],
      ),
    ));
  }
}


