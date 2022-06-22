import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Layout/Todo_App/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/Todo_App/cubit/states.dart';
import '../../../Shared/components/components.dart';


class SearchScreen extends StatelessWidget {
  var searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).Search;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Search",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchControler,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                    // print(list);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search  not be empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      labelText: "Search",
                      border: OutlineInputBorder()),
                ),
              ),
              Expanded(
                child: BuildCondition(
                  builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        bulidArticlesItem(list[index], context), //
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Colors.black12,
                      width: double.infinity,
                    ),
                    itemCount: 10,
                  ),
                  condition: list.length > 0,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
