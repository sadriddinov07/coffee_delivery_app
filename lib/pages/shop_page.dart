import 'package:coffee_shop/blocs/cart/cart_bloc.dart';
import 'package:coffee_shop/constants/colors.dart';
import 'package:coffee_shop/constants/fonts.dart';
import 'package:coffee_shop/constants/strings.dart';
import 'package:coffee_shop/pages/delivery_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double total = 9.9;
    // List<double> total = [];
    // int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.carrinho,
          style: textStyleForBaloo_2W700(
              color: CustomColors.gray_100, fontSize: 20),
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: context.read<CartBloc>().state.items.items.length,
                itemBuilder: (context, index) {
                  final item =
                      context.read<CartBloc>().state.items.items[index];
                  return SizedBox(
                    height: 150,
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        item.coffeeModel.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        item.size.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: Text(
                        item.quantity.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: CustomColors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: CustomColors.gray_700,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.valorTotal,
                          style: textStyleForRobotoW400(
                              color: CustomColors.gray_100, fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.end,
                              Strings.rDollar,
                              style: textStyleForBaloo_2W700(
                                  color: CustomColors.gray_100,
                                  fontSize: 15,
                                  height: 1.3),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              Strings.prise,
                              style: textStyleForBaloo_2W700(
                                  color: CustomColors.gray_100,
                                  fontSize: 20,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const DeliveryPage(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(CustomColors.yellowDark),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          Strings.confirmarPedido.toUpperCase(),
                          style: textStyleForBaloo_2W700(
                            color: CustomColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
