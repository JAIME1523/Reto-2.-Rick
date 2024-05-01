import 'package:app_rick/futures/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final prov = context.watch<HomeProvider>();
    return Scaffold(
      body: prov.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    ...prov.listInfo.map((e) => Card(
                          margin: const EdgeInsets.all(5),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(e.id.toString(), style: text.displaySmall),
                                      Text(e.name, style: text.displaySmall, )
                                    ]),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.network(e.imagerul, height: 150,)
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: ElevatedButton(
                      onPressed: prov.isSendInfo? null: ()async {
                      await  prov.postCharacter();
                      },
                      child:  Text('Mandar informacion',style: text.titleMedium),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
