import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/mywork/shared/components.dart';
import 'package:mynewsapp/mywork/shared/cubite/cubit.dart';
import 'package:mynewsapp/mywork/shared/cubite/states.dart';

class science extends StatelessWidget {
  const science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubite,States>(
      listener: (context,state){},
      builder: (context,States)
      {
        var cubit=Cubite.get(context);
        List<dynamic>list=Cubite.get(context).dioh;
        cubit.getdio(category: 'science');
        return ListView.separated(
            itemBuilder: (context,index)=> builditem(list[index]),
            separatorBuilder: (context,index)=>devider(),
            itemCount: list.length
        );
      },
    );
  }
}
