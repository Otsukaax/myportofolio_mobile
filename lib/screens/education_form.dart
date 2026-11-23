import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _startedAtController = TextEditingController();
  final TextEditingController _endedAtController = TextEditingController();

  String _institution = "";
  String _degree = "";
  String _gpa = "";
  DateTime? _startedAt;
  DateTime? _endedAt;
  bool _isCurrent = false;

  @override
  void dispose() {
    _startedAtController.dispose();
    _endedAtController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final String month = date.month.toString().padLeft(2, '0');
    final String day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  Future<void> _pickDate({
    required DateTime? initialDate,
    required ValueChanged<DateTime> onSelected,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null && mounted) {
      setState(() {
        onSelected(picked);
      });
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _institution = "";
      _degree = "";
      _gpa = "";
      _startedAt = null;
      _endedAt = null;
      _isCurrent = false;
      _startedAtController.clear();
      _endedAtController.clear();
    });
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Education Form')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Institusi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Universitas Indonesia",
                    labelText: "Institusi / Universitas",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Institusi tidak boleh kosong!";
                    }
                    if (value.trim().length > 255) {
                      return "Institusi maksimal 255 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // === Gelar / Jurusan ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "S1 Ilmu Komputer",
                    labelText: "Gelar / Jurusan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _degree = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Gelar / jurusan tidak boleh kosong!";
                    }
                    if (value.trim().length > 255) {
                      return "Gelar / jurusan maksimal 255 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // === IPK / GPA (Opsional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    hintText: "3.85",
                    labelText: "IPK / GPA (Opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _gpa = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }
                    final String trimmed = value.trim();
                    final double? parsedGpa = double.tryParse(trimmed);
                    if (parsedGpa == null) {
                      return "IPK harus berupa angka yang valid!";
                    }
                    if (parsedGpa < 0.0 || parsedGpa > 4.0) {
                      return "IPK harus berada di rentang 0.00 sampai 4.00!";
                    }
                    final List<String> parts = trimmed.split('.');
                    if (parts.length == 2 && parts[1].length > 2) {
                      return "IPK maksimal 2 angka di belakang koma!";
                    }
                    return null;
                  },
                ),
              ),
              // === Tanggal Mulai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startedAtController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "YYYY-MM-DD",
                    labelText: "Tanggal Mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () => _pickDate(
                    initialDate: _startedAt,
                    onSelected: (DateTime picked) {
                      _startedAt = picked;
                      _startedAtController.text = _formatDate(picked);
                    },
                  ),
                  validator: (String? value) {
                    if (_startedAt == null) {
                      return "Tanggal mulai tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // === Status Masih Berlangsung ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Masih menempuh pendidikan ini"),
                  value: _isCurrent,
                  onChanged: (bool value) {
                    setState(() {
                      _isCurrent = value;
                      if (_isCurrent) {
                        _endedAt = null;
                        _endedAtController.clear();
                      }
                    });
                  },
                ),
              ),
              // === Tanggal Selesai (Opsional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endedAtController,
                  readOnly: true,
                  enabled: !_isCurrent,
                  decoration: InputDecoration(
                    hintText: _isCurrent ? "Masih berlangsung" : "YYYY-MM-DD",
                    labelText: "Tanggal Selesai (Opsional)",
                    suffixIcon: !_isCurrent && _endedAt != null
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _endedAt = null;
                                _endedAtController.clear();
                              });
                            },
                          )
                        : const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: _isCurrent
                      ? null
                      : () => _pickDate(
                          initialDate: _endedAt ?? _startedAt,
                          onSelected: (DateTime picked) {
                            _endedAt = picked;
                            _endedAtController.text = _formatDate(picked);
                          },
                        ),
                  validator: (String? value) {
                    if (!_isCurrent &&
                        _startedAt != null &&
                        _endedAt != null &&
                        _endedAt!.isBefore(_startedAt!)) {
                      return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                    }
                    return null;
                  },
                ),
              ),
              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: const Text(
                                'Education berhasil ditambahkan!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSummaryRow(
                                      'Institusi',
                                      _institution.trim(),
                                    ),
                                    _buildSummaryRow(
                                      'Gelar / Jurusan',
                                      _degree.trim(),
                                    ),
                                    _buildSummaryRow(
                                      'IPK / GPA',
                                      _gpa.trim().isEmpty ? '-' : _gpa.trim(),
                                    ),
                                    _buildSummaryRow(
                                      'Tanggal Mulai',
                                      _formatDate(_startedAt!),
                                    ),
                                    _buildSummaryRow(
                                      'Tanggal Selesai',
                                      _isCurrent
                                          ? 'Masih berlangsung'
                                          : (_endedAt != null
                                                ? _formatDate(_endedAt!)
                                                : '-'),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    _resetForm();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
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
