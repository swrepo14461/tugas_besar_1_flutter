import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_besar_1/dataclass/ProdukClass.dart';
import 'package:tugas_besar_1/widget/ProdAddText_Widget.dart';

class ProdDetail extends StatefulWidget {
  const ProdDetail({super.key, required this.id, required this.lsProduct});
  final int id;
  final List<ProductClass> lsProduct;

  @override
  State<ProdDetail> createState() => _ProdDetail();
}

class _ProdDetail extends State<ProdDetail> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameProdController;
  late TextEditingController descProdController;
  late TextEditingController priceProdController;

  @override
  void initState() {
    super.initState();
    var product = widget.lsProduct.firstWhere((prod) => prod.id == widget.id);

    nameProdController = TextEditingController(text: product.name);
    descProdController = TextEditingController(text: product.description);
    priceProdController = TextEditingController(text: product.price.toStringAsFixed(0));
  }

  @override
  Widget build(BuildContext context) {
    List<ProductClass> newLsProduct = [];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }

        Navigator.pop(context, widget.lsProduct);
      },
      child:  Scaffold(
        appBar: AppBar(
          title: const Text("Detail Product"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 5),
          child: Column(
            children: [
              ProdAddText(formKey: formKey,
                  nameProdController: nameProdController,
                  descProdController: descProdController,
                  priceProdController: priceProdController),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      setState(() {
                        for(var prod in widget.lsProduct) {
                          if (prod.id != widget.id) {
                            newLsProduct.add(prod);
                          }
                        }
                      });

                      setState(() {
                        newLsProduct.add(ProductClass(
                            id: 99,
                            name: nameProdController.value.text,
                            description: descProdController.value.text,
                            price: double.parse(priceProdController.value.text))
                        );
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Product has been successfully updated"),
                        duration: Duration(seconds: 3),
                      ));

                      Navigator.pop(context, newLsProduct);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white
                  ),
                  child: const Text("Save"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      setState(() {
                        for(var prod in widget.lsProduct) {
                          if (prod.id != widget.id) {
                            newLsProduct.add(prod);
                          }
                        }
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Product has been successfully removed"),
                        duration: Duration(seconds: 3),
                      ));

                      Navigator.pop(context, newLsProduct);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                  ),
                  child: const Text("Delete"),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}