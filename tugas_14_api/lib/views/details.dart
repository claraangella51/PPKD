import 'package:flutter/material.dart';
import 'package:tugas_14_api/models/model.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.character});

  final Result character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name ?? 'Character Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: character.img != null && character.img!.isNotEmpty
                    ? Image.network(
                        character.img!,
                        height: 280,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 280,
                        width: double.infinity,
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Text('No Image'),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              character.name ?? 'No Name',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              children: [
                _DetailRow(label: 'Status', value: character.status),
                _DetailRow(label: 'Gender', value: character.gender),
                _DetailRow(label: 'Age', value: character.age?.toString()),
                _DetailRow(label: 'Height', value: character.height),
                _DetailRow(label: 'Birthplace', value: character.birthplace),
                _DetailRow(label: 'Residence', value: character.residence),
                _DetailRow(label: 'Occupation', value: character.occupation),
              ],
            ),
            const SizedBox(height: 16),
            _InfoCard(
              title: 'Alias',
              children: [_TagWrap(items: character.alias)],
            ),
            const SizedBox(height: 16),
            _InfoCard(
              title: 'Species',
              children: [_TagWrap(items: character.species)],
            ),
            const SizedBox(height: 16),
            _InfoCard(
              title: 'Roles',
              children: [_TagWrap(items: character.roles)],
            ),
            const SizedBox(height: 16),
            _InfoCard(
              title: 'Groups',
              children: [_GroupSection(groups: character.groups)],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({this.title, this.children = const []});

  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(title!, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
            ],
            ...children,
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value == null || value!.isEmpty ? '-' : value!)),
        ],
      ),
    );
  }
}

class _TagWrap extends StatelessWidget {
  const _TagWrap({required this.items});

  final List<String>? items;

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return const Text('-');
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items!.map((item) => Chip(label: Text(item))).toList(),
    );
  }
}

class _GroupSection extends StatelessWidget {
  const _GroupSection({required this.groups});

  final List<Group>? groups;

  @override
  Widget build(BuildContext context) {
    if (groups == null || groups!.isEmpty) {
      return const Text('-');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groups!
          .map(
            (group) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name ?? '-',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  _TagWrap(items: group.subGroups),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
