import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import 'package:flutter/services.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int? _price;
  String _description = '';
  String _category = 'Jersey';
  String _thumbnail = '';
  bool _isFeatured = false;

  final _categories = const <String>['Jersey', 'Training', 'Accessory'];

  String? _required(String? v, {String what = 'Field'}) {
    if (v == null || v.trim().isEmpty) return '$what tidak boleh kosong';
    return null;
  }

  String? _validPrice(String? v) {
    if (v == null || v.trim().isEmpty) return 'Price tidak boleh kosong';
    final parsed = int.tryParse(v);
    if (parsed == null) return 'Price harus berupa angka bulat';
    if (parsed <= 0) return 'Price harus lebih dari 0';
    return null;
  }

  String? _validUrl(String? v) {
    if (v == null || v.trim().isEmpty) return 'Thumbnail tidak boleh kosong';
    final url = Uri.tryParse(v);
    if (url == null || !(url.isScheme('http') || url.isScheme('https'))) {
      return 'Thumbnail harus URL http/https yang valid';
    }
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Produk berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'),
                Text('Price: ${_price ?? 0}'),
                Text('Description: $_description'),
                Text('Category: $_category'),
                Text('Thumbnail: $_thumbnail'),
                Text('Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
                setState(() {
                  _name = '';
                  _price = null;
                  _description = '';
                  _category = 'Jersey';
                  _thumbnail = '';
                  _isFeatured = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Create Product Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NAME
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'Contoh: Home Jersey 24/25',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (v) => setState(() => _name = v),
                  validator: (v) => _required(v, what: 'Product Name'),
                ),
              ),
              // PRICE
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price (Rp)',
                    hintText: 'Contoh: 350000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (v) => setState(() => _price = int.tryParse(v)),
                  validator: _validPrice,
                ),
              ),
              // DESCRIPTION
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Bahan premium, embroidered crest...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (v) => setState(() => _description = v),
                  validator: (v) => _required(v, what: 'Description'),
                ),
              ),
              // CATEGORY
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButtonFormField<String>(
                  value: _category,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: _categories
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => _category = v ?? 'Jersey'),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Category tidak boleh kosong' : null,
                ),
              ),
              // THUMBNAIL URL
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Thumbnail URL',
                    hintText: 'https://contoh.com/gambar.jpg',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (v) => setState(() => _thumbnail = v),
                  validator: _validUrl,
                ),
              ),
              // FEATURED
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SwitchListTile(
                  title: const Text('Mark as Featured'),
                  value: _isFeatured,
                  onChanged: (val) => setState(() => _isFeatured = val),
                ),
              ),
              // SAVE BUTTON (indigo)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                      foregroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: _save,
                    child: const Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
