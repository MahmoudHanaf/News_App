
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Layout/Todo_App/cubit/cubit.dart';
import 'package:flutter_app/Layout/Todo_App/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/components/components.dart';


class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list  =NewsCubit.get(context).business;

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
      },


    );
  }
}
