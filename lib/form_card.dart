import 'package:flutter/material.dart';
import 'package:magic_help_counter/card_provider.dart';
import 'package:provider/provider.dart';

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();
  final CardProvider cardProvider = CardProvider();
  late String _nameCardInputAsync;

  final cardTextNameController = TextEditingController();

  @override
  void dispose() {
    cardTextNameController.dispose();
    super.dispose();
  }

  Future<void> submitForm(value) async {
    try {
      CardProvider cardProvider = Provider.of<CardProvider>(
        context,
        listen: false,
      );
      _formKey.currentState!.save();
      // _nameCardInputAsync = await cardProvider.fetchDataAutocomplte(value);
      // print(_nameCardInputAsync);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom de la carte',
                  hintText: "Entrez le nom de la carte",
                  border: OutlineInputBorder(),
                ),
                onSaved: (String? value) async {
                  print(value);
                  cardProvider.fetchDataAutocomplete();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    final cardTextName = cardTextNameController.text;
                    form.save();
                  }
                },
                child: const Text('Chercher'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
