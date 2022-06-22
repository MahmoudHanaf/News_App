
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Layout/Todo_App/cubit/states.dart';
import 'package:flutter_app/Shared/cubit/cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/network/remote/dio_helper.dart';
import '../../../modules/news_app/search/search.dart';
import '../cubit/cubit.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) => {},
      builder: (context,state) {

        var cubit =NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                "New App"
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) => SearchScreen()
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                  ),
              ),
              IconButton(
                onPressed: (){
                   AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {

            },
            child: Icon(
              Icons.add,
            ),
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItem,
            onTap: (index){
               cubit.ChangeBottomNavBar(index);
            },


          ) ,
        );
      },
    );
  }
}

