import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:send_crypto_demo/l10n/l10n.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';

class App extends StatelessWidget {
  const App({
    required WalletConnectRepository walletConnectRepository,
    super.key,
  }) : _walletConnectRepository = walletConnectRepository;

  final WalletConnectRepository _walletConnectRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _walletConnectRepository,
        ),
      ],
      child: MaterialApp(
        theme: SCTheme().lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (_) => DashboardBloc(
            walletConnectRepository: _walletConnectRepository,
          ),
          child: const DashboardView(),
        ),
      ),
    );
  }
}
