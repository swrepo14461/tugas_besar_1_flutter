import 'package:flutter/material.dart';

class ProdAddText extends StatefulWidget {
  const ProdAddText({super.key, required this.formKey, required this.nameProdController, required this.descProdController, required this.priceProdController});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameProdController;
  final TextEditingController descProdController;
  final TextEditingController priceProdController;

  @override
  State<ProdAddText> createState() => _ProdAddText();
}

class _ProdAddText extends State<ProdAddText> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          nameField(),
          const SizedBox(height: 18),
          descField(),
          const SizedBox(height: 18),
          priceField(),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget nameField() {
    return Column(
      children: [
        TextFormField(
          controller: widget.nameProdController,
          decoration: const InputDecoration(
            labelText: "Product Name",
            hintText: "Product Name"
          ),
          validator: (value) {
            var name = (value ?? "").trim();

            if (name.isEmpty){
              return "Please enter an product name";
            }

            return null;
          },
        )
      ],
    );
  }

  Widget descField() {
    return Column(
      children: [
        TextFormField(
          controller: widget.descProdController,
          decoration: const InputDecoration(
            labelText: "Product Description",
            hintText: "Product Description"
          ),
          validator: (value) {
            var desc = (value ?? "").trim();

            if (desc.isEmpty) {
              return "Please provide a description of the product.";
            }

            return null;
          },
        )
      ],
    );
  }

  Widget priceField() {
    return Column(
      children: [
        TextFormField(
          controller: widget.priceProdController,
          decoration: const InputDecoration(
            labelText: "Price",
            hintText: "Product Price",
          ),
          keyboardType: TextInputType.number, // Ensures only numeric input
          validator: (value) {
            var price = (value ?? "").trim();

            if (price.isEmpty) {
              return "Please provide a price for the product.";
            }

            // Additional validation for a valid number (optional)
            if (double.tryParse(price) == null) {
              return "Please enter a valid number for the price.";
            }

            return null;
          },
        ),
      ],
    );
  }

}