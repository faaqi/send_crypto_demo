import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/common/extensions/extensions.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required WalletConnectRepository walletConnectRepository,
  })  : _walletConnectRepository = walletConnectRepository,
        super(const DashboardState.initial()) {
    on<ConnectWithMetamaskRequested>(_onConnectWithMetamaskRequested);
    on<ChainIDFetched>(_onChainIDFetched);
    on<OnChainChangedListener>(_onOnChainChangedListener);
    on<OnAccountChangedListener>(_onAccountChangedListener);
    on<FetchWalletBalanceRequested>(_onFetchWalletBalanceRequested);
    on<RecipientWalletAddressChanged>(_onRecipientWalletAddressChanged);
    on<AmountToTransferChanged>(_onAmountToTransferChanged);
    on<SendTokensRequested>(_onSendTokensRequested);
    on<TransactionReceiptFetched>(_onTransactionReceiptFetched);
    on<ViewTransactionOnEtherscanRequested>(
      _onViewTransactionOnEtherscanRequested,
    );
    on<ResetStateRequested>(_onResetStateRequested);
  }

  final WalletConnectRepository _walletConnectRepository;

  Future<void> _onConnectWithMetamaskRequested(
    ConnectWithMetamaskRequested event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: DashboardStatus.loading,
        ),
      );

      final accountAddress =
          await _walletConnectRepository.connectWithMetamask();

      add(FetchWalletBalanceRequested(walletAddress: accountAddress));
      add(ChainIDFetched());

      add(OnChainChangedListener());
      add(OnAccountChangedListener());

      emit(
        state.copyWith(
          status: DashboardStatus.loaded,
          userWalletData:
              UserWalletData(walletAddress: accountAddress, balance: ''),
          walletConnectionStatus: WalletConnectionStatus.connected,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: DashboardStatus.error,
          walletConnectionStatus: WalletConnectionStatus.disconnected,
          errorMessage: e.toString().split(':').last,
        ),
      );
    }
  }

  Future<void> _onChainIDFetched(
    ChainIDFetched event,
    Emitter<DashboardState> emit,
  ) async {
    final chainID = await _walletConnectRepository.getChainId();

    final chainInfo = WCConstants.supportedChains.firstWhere(
      (element) => element.chainId == chainID,
      orElse: () => WCConstants.supportedChains.first,
    );

    emit(
      state.copyWith(
        chainInfo: chainInfo,
      ),
    );
  }

  Future<void> _onOnChainChangedListener(
    OnChainChangedListener event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      await _walletConnectRepository.onChainChangedListener().then((value) {
        final chainInfo = WCConstants.supportedChains.firstWhere(
          (element) => element.chainId == value,
          orElse: () => WCConstants.supportedChains.first,
        );

        emit(
          state.copyWith(
            chainInfo: chainInfo,
          ),
        );
        add(
          FetchWalletBalanceRequested(
            walletAddress: state.userWalletData!.walletAddress,
          ),
        );
      });
    } on Exception catch (_) {}
  }

  Future<void> _onAccountChangedListener(
    OnAccountChangedListener event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      await _walletConnectRepository.onAccountChangedListener().then((value) {
        emit(
          state.copyWith(
            userWalletData: state.userWalletData?.copyWith(
              walletAddress: value.first,
            ),
          ),
        );
        add(
          FetchWalletBalanceRequested(
            walletAddress: state.userWalletData!.walletAddress,
          ),
        );
      });
    } on Exception catch (_) {}
  }

  Future<void> _onFetchWalletBalanceRequested(
    FetchWalletBalanceRequested event,
    Emitter<DashboardState> emit,
  ) async {
    final balance = await _walletConnectRepository.fetchWalletBalance(
      walletAddress: event.walletAddress,
    );

    emit(
      state.copyWith(
        userWalletData: state.userWalletData?.copyWith(
          balance: balance,
        ),
      ),
    );
  }

  Future<void> _onRecipientWalletAddressChanged(
    RecipientWalletAddressChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        recipientWalletAddress: event.recipientWalletAddress,
      ),
    );
  }

  Future<void> _onAmountToTransferChanged(
    AmountToTransferChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        amountToTransfer: event.amountToTransfer,
      ),
    );
  }

  Future<void> _onSendTokensRequested(
    SendTokensRequested event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: DashboardStatus.loading,
          transactionStatus: TransactionStatus.generic,
        ),
      );

      final transactionResponse =
          await _walletConnectRepository.sendTransaction(
        toAddress: state.recipientWalletAddress,
        amount: num.parse(state.amountToTransfer),
      );

      if (transactionResponse != null) {
        emit(
          state.copyWith(
            status: DashboardStatus.loaded,
            transactionResponse: transactionResponse,
            transactionStatus: TransactionStatus.pending,
            recipientWalletAddress: '',
            amountToTransfer: '',
          ),
        );

        add(TransactionReceiptFetched());
      } else {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
            transactionStatus: TransactionStatus.failed,
            errorMessage: 'Transaction Failed',
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: DashboardStatus.error,
          transactionStatus: TransactionStatus.failed,
          errorMessage: e.toString().split(':').last,
        ),
      );
    }
  }

  Future<void> _onTransactionReceiptFetched(
    TransactionReceiptFetched event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      final receipt = await _walletConnectRepository.getTransactionReceipt(
        transaction: state.transactionResponse!,
      );

      if (receipt != null) {
        emit(
          state.copyWith(
            recipientWalletAddress: '',
            amountToTransfer: '',
            status: DashboardStatus.loaded,
            transactionReceipt: receipt,
            transactionStatus: receipt.status
                ? TransactionStatus.success
                : TransactionStatus.failed,
          ),
        );
        add(
          FetchWalletBalanceRequested(
            walletAddress: state.userWalletData!.walletAddress,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: DashboardStatus.loaded,
            transactionStatus: TransactionStatus.failed,
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: DashboardStatus.error,
          transactionStatus: TransactionStatus.failed,
          errorMessage: e.toString().split(':').last,
        ),
      );
    }
  }

  Future<void> _onViewTransactionOnEtherscanRequested(
    ViewTransactionOnEtherscanRequested event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      final chainName = state.chainInfo?.chainName ?? '';
      final transactionHash = state.transactionResponse?.hash ?? '';

      final url = transactionHash.getEtherscanUrl(
        chainName: chainName,
        transactionHash: transactionHash,
      );

      await _walletConnectRepository.launchURL(url: url);
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: DashboardStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onResetStateRequested(
    ResetStateRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        status: DashboardStatus.initial,
        walletConnectionStatus:
            state.walletConnectionStatus == WalletConnectionStatus.connected
                ? state.walletConnectionStatus
                : WalletConnectionStatus.generic,
        transactionStatus: TransactionStatus.generic,
      ),
    );
  }
}
