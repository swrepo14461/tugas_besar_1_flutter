import 'package:flutter/material.dart';
import 'package:tugas_besar_1/dataclass/ProdukClass.dart';
import 'package:tugas_besar_1/widget/ProdAddText_Widget.dart';

class ProdAdd extends StatefulWidget {
  const ProdAdd({super.key, required this.lsProduct});
  final List<ProductClass> lsProduct;

  @override
  State<ProdAdd> createState() => _ProdAdd();
}

class _ProdAdd extends State<ProdAdd> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameProdController = TextEditingController();
  TextEditingController descProdController = TextEditingController();
  TextEditingController priceProdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }

        Navigator.pop(context, widget.lsProduct);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
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
                        widget.lsProduct.add(ProductClass(
                            id: 99,
                            name: nameProdController.value.text,
                            description: descProdController.value.text,
                            price: double.parse(priceProdController.value.text))
                        );
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Product has been successfully added"),
                        duration: Duration(seconds: 3),
                      ));

                      Navigator.pop(context, widget.lsProduct);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white
                  ),
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}