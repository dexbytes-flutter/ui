import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product/product_cubit.dart';
import '../../model/selected_product_model.dart';


class CardScreen extends StatefulWidget {
  const CardScreen();

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected item'),
      ),
      body: FutureBuilder<List<SelectedProductModel>>(
        future: BlocProvider.of<ProductCubit>(context).getSelectedPostData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var selectItem = snapshot.data![index];
                  return BlocConsumer<ProductCubit, ProductState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.network(selectItem.image!),
                        ),
                        title: Text(selectItem.title!),
                        subtitle: Text('${selectItem.price!}'),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                const Divider(thickness: 2),
                itemCount: snapshot.data!.length);
          } else {
            return const SizedBox(
              height: 0,
              width: 0,
              child: Text('No product'),
            );
          }
        },
      ),
    );
  }
}