import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/mywork/shared/components.dart';
import 'package:mynewsapp/mywork/shared/cubite/cubit.dart';
import 'package:mynewsapp/mywork/shared/cubite/states.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubite,States>(
      listener: (context,state){},
      builder: (context,States)
      {
        List<dynamic>list=Cubite.get(context).dioh;
        return ListView.separated(
            itemBuilder: (context,index)=> builditem(list[index]),
            separatorBuilder: (context,index)=>devider(),
            itemCount: list.length
        );
      },
    );
  }
}
