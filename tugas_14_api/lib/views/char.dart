import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tugas_14_api/models/model.dart';
import 'package:tugas_14_api/views/details.dart';

class GetCharAOT extends StatefulWidget {
  const GetCharAOT({super.key});

  @override
  State<GetCharAOT> createState() => _GetCharAOTState();
}

class _GetCharAOTState extends State<GetCharAOT> {
  GetChar? dataChar;
  bool isLoading = false;
  String? errorMessage;
  int currentPage = 1;
  String selectedStatus = 'All';
  String selectedGender = 'All';
  final TextEditingController nameController = TextEditingController();
  String selectedName = '';

  static const List<String> statusOptions = ['All', 'Alive', 'Deceased'];
  static const List<String> genderOptions = ['All', 'Male', 'Female'];

  @override
  void initState() {
    super.initState();
    getChar();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> getChar({int page = 1}) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final queryParameters = <String, String>{
      'page': page.toString(),
      if (selectedName.trim().isNotEmpty) 'name': selectedName.trim(),
      if (selectedStatus != 'All') 'status': selectedStatus.toLowerCase(),
      if (selectedGender != 'All') 'gender': selectedGender.toLowerCase(),
    };

    final uri = Uri.https(
      'api.attackontitanapi.com',
      '/characters',
      queryParameters,
    );

    try {
      final response = await get(uri);

      if (response.statusCode == 200) {
        final result = getCharFromJson(response.body);
        setState(() {
          dataChar = result;
          currentPage = page;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load data";
        });
      }
    } catch (_) {
      setState(() {
        errorMessage = "Failed to load data";
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void updateStatus(String? value) {
    if (value == null) return;
    setState(() {
      selectedStatus = value;
    });
    getChar(page: 1);
  }

  void updateGender(String? value) {
    if (value == null) return;
    setState(() {
      selectedGender = value;
    });
    getChar(page: 1);
  }

  void applyNameFilter() {
    FocusScope.of(context).unfocus();
    setState(() {
      selectedName = nameController.text;
    });
    getChar(page: 1);
  }

  void clearNameFilter() {
    FocusScope.of(context).unfocus();
    nameController.clear();
    setState(() {
      selectedName = '';
    });
    getChar(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    final results = dataChar?.results ?? [];
    final totalPages = dataChar?.info?.pages ?? 1;
    final totalItems = dataChar?.info?.count ?? 0;

    if (isLoading && dataChar == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (errorMessage != null && dataChar == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Attack on Titan Characters')),
        body: Center(child: Text(errorMessage!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Attack on Titan Characters')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.search,
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) => applyNameFilter(),
                    decoration: InputDecoration(
                      labelText: 'Search by name',
                      hintText: 'Eren, Mikasa, Levi...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          selectedName.isNotEmpty ||
                              nameController.text.isNotEmpty
                          ? IconButton(
                              onPressed: clearNameFilter,
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : applyNameFilter,
                      child: const Text('Search Name'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: selectedStatus,
                          decoration: const InputDecoration(
                            labelText: 'Status',
                            border: OutlineInputBorder(),
                          ),
                          items: statusOptions
                              .map(
                                (status) => DropdownMenuItem(
                                  value: status,
                                  child: Text(status),
                                ),
                              )
                              .toList(),
                          onChanged: updateStatus,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: selectedGender,
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                            border: OutlineInputBorder(),
                          ),
                          items: genderOptions
                              .map(
                                (gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ),
                              )
                              .toList(),
                          onChanged: updateGender,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total characters: $totalItems'),
                      Text('Page $currentPage of $totalPages'),
                    ],
                  ),
                ],
              ),
            ),
            if (isLoading) const LinearProgressIndicator(),
            if (errorMessage != null && dataChar != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(errorMessage!),
              ),
            Expanded(
              child: results.isEmpty
                  ? const Center(child: Text('No characters found'))
                  : ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (BuildContext context, int index) {
                        final char = results[index];

                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CharacterDetailPage(character: char),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  char.img != null && char.img!.isNotEmpty
                                      ? Image.network(char.img!)
                                      : Container(
                                          height: 150,
                                          color: Colors.grey[300],
                                          child: const Center(
                                            child: Text("No Image"),
                                          ),
                                        ),
                                  const SizedBox(height: 8),
                                  Text(
                                    char.name ?? "No Name",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${char.status ?? "Unknown"} • ${char.gender ?? "Unknown"}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Tap to view details',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: currentPage > 1 && !isLoading
                          ? () => getChar(page: currentPage - 1)
                          : null,
                      child: const Text('Previous'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: currentPage < totalPages && !isLoading
                          ? () => getChar(page: currentPage + 1)
                          : null,
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
