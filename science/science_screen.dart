
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Layout/Todo_App/cubit/cubit.dart';
import '../../../Shared/components/components.dart';


class ScienceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var list  =NewsCubit.get(context).Science;
    return BuildCondition(
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulidArticlesItem(list[index],context) ,//
        separatorBuilder: (context, index)=> Container(
          height: 1,
          color: Colors.black12,
          width: double.infinity,
        ),
        itemCount: 10,
      ) ,
      condition: list.length >0,
      fallback:(context)=> Center(child: CircularProgressIndicator()),
    );
  }
}
