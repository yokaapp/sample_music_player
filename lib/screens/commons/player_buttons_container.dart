import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexible_repeat/screens/commons/player_buttons.dart';
import 'package:flexible_repeat/services/audio/audio_player_service.dart';



/// Widget that place the content of a screen on top of the buttons that
/// control the audio. `child` is wrapped in an [Expanded] widget.
class PlayerButtonsContainer extends StatelessWidget {
  final Widget child;

  PlayerButtonsContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Consumer<AudioPlayerService>(
          builder: (context, player, _) {
            return StreamBuilder<bool>(
              stream: player.audioProcessingState
                  .map((state) => state != AudioProcessingState.idle),
              builder: (context, snapshot) {
                // If no audio is loaded, do not show the controllers.
                if (snapshot.data ?? false)
                  return PlayerButtons();
                else
                  return Container();
              },
            );
          },
        ),
      ],
    );
  }
}