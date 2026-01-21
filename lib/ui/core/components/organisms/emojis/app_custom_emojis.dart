import 'package:flutter/material.dart';

class AppCustomEmojis extends StatelessWidget {
  final void Function(String emoji) onSelected;
  final double height;

  const AppCustomEmojis({
    super.key,
    required this.onSelected,
    this.height = 256,
  });

  static const List<String> emojis = [
    // 🏟️ Jogo e Estádio
    '⚽️', '🥅', '🏟️', '⏱️', '🧤', '🧼', '🧽', '🛠️', '🧯', '🔦', '🎥', '🎙️',
    '📣', '🪧', '🎫',

    // 🧍‍♂️ Posições dos Jogadores
    '🧍‍♂️', '🧍‍♀️', '🧍', '🧍🏽‍♂️', '🧍🏼‍♀️', '🧍🏿‍♂️', '🕴️', '🧎‍♂️',
    '🧎‍♀️', '🧎',

    // 🧢 Uniformes e Itens
    '👕', '👖', '🧦', '👟', '👞', '🧢', '🎽', '🩳', '🧣', '🧤', '🥾', '👒',

    // 🟥 Cartões, Árbitro e Regras
    '🟥', '🟨', '🧑‍⚖️', '⚖️', '🔔', '🛎️', '📋', '📝', '🗒️', '📑', '📏', '🧭',

    // 👥 Equipe e Técnico
    '🧑‍🏫', '👨‍🏫', '👩‍🏫', '🤝', '🤼‍♂️', '🧑‍🤝‍🧑', '👨‍👦‍👦',
    '👩‍👧‍👦',

    // 🇧🇷 Ícones do Brasil
    '🇧🇷', '🥁', '🎺', '🪘', '🎊', '🎉', '🥳', '🕺', '💃', '🎭', '🥥', '🌴',
    '☀️', '🦜', '🏖️',

    // 🏆 Torneios e Vitória
    '🏆', '🥇', '🥈', '🥉', '🏅', '🎖️', '🏵️', '🎗️', '💪', '👑', '✨', '🌟',
    '💫',

    // 🧠 Estratégia e Estatísticas
    '📊', '📈', '📉', '📋', '🗂️', '🧠', '🧩', '🧮', '🏋️‍♂️', '🏃‍♂️', '🚶‍♂️',
    '🧘‍♂️', '🧗‍♂️',

    // 🚌 Logística
    '🚍', '🚎', '🚗', '🚕', '🚙', '✈️', '🛫', '🛬', '🧳', '🛌', '🏨', '🗺️',
    '🪪',

    // 👨‍💻 Interface
    '📱', '💻', '🖥️', '🕹️', '🧿', '📍', '📌', '🔍', '🔒', '🔓', '🗃️', '🧾',
    '📎',

    // 🎉 Emoções da Torcida
    '📣', '🎺', '🥁', '🔥', '💥', '🧨', '🎆', '🎇', '🧊', '🫧', '💦', '😍',
    '🥶', '🤩', '😱',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          const Text(
            'Selecione um ícone',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              itemCount: emojis.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onSelected(emojis[index]);
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      emojis[index],
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
