import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => DashboardBloc(
            walletConnectRepository: ctx.read<WalletConnectRepository>(),
          ),
          child: const DashboardView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}
