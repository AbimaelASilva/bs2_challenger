import 'package:flutter/material.dart';
import '../../../core.dart';

class EsquemaTaticoWidget extends StatelessWidget {
  final List<String> nomes;

  const EsquemaTaticoWidget({super.key, required this.nomes});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1F1F1F)
          : AppColor.neutral.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColoredBox(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1F1F1F)
                : AppColor.neutral.white,
            //padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                linha([nomes[0], nomes[1], nomes[2]]), // atacantes
                linha([nomes[3], nomes[4], nomes[5]]), // meio
                linha([nomes[6], nomes[7], nomes[8], nomes[9]]), // defesa
                linha([nomes[10]]), // goleiro
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget linha(List<String> jogadores) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: jogadores.map(jogadorWidget).toList(),
    );
  }

  Widget jogadorWidget(String nomeNumero) {
    final partes = nomeNumero.split(' - ');
    final numero = partes[0];
    final nome = partes.length > 1 ? partes[1] : '';

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Text(
            numero,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          nome,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
