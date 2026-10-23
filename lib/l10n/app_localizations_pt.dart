// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get navChannels => 'Canais';

  @override
  String get navContacts => 'Contatos';

  @override
  String get navMap => 'Mapa';

  @override
  String get navApps => 'Apps';

  @override
  String get navSettings => 'Configurações';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonSaving => 'Salvando...';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClear => 'Limpar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonBack => 'Voltar';

  @override
  String get commonRemove => 'Remover';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonShare => 'Compartilhar';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonRename => 'Renomear';

  @override
  String get commonReset => 'Redefinir';

  @override
  String get commonJustNow => 'agora mesmo';

  @override
  String commonMinutesAgo(int minutes) {
    return 'há $minutes min';
  }

  @override
  String commonHoursAgo(int hours) {
    return 'há $hours h';
  }

  @override
  String get gpsSharingTitle => 'Compartilhamento de GPS';

  @override
  String get gpsSharingSubtitle =>
      'Você decide se a sua localização vai junto nos anúncios do rádio. Por padrão, vem desligado.';

  @override
  String get gpsSharingStatusOff => 'DESLIGADO';

  @override
  String get gpsSharingStatusManual => 'MANUAL';

  @override
  String get gpsSharingStatusAuto => 'AUTOMÁTICO';

  @override
  String get gpsSharingModeOff => 'Desligado';

  @override
  String get gpsSharingModeManual => 'Manual';

  @override
  String get gpsSharingModeAuto => 'Automático';

  @override
  String get gpsSharingPrecisionTitle => 'Precisão enviada';

  @override
  String get gpsSharingPrecisionExact => 'Exata';

  @override
  String get gpsSharingPrecisionRough => 'Aproximada';

  @override
  String get gpsSharingPrecisionVague => 'Vaga';

  @override
  String get gpsSharingIntervalLabel => 'Intervalo entre atualizações';

  @override
  String get gpsSharingShareNow => 'Compartilhar agora';

  @override
  String get gpsSharingClearNow => 'Limpar do rádio';

  @override
  String get gpsSharingClearedOnRadio => 'Localização removida do rádio.';

  @override
  String get gpsSharingPrivacyDisclaimer =>
      'A sua posição será incluída nos anúncios LoRa que o seu rádio transmitir, podendo ser vista por outros nós. Ligue apenas se você aceita compartilhá-la.';

  @override
  String gpsSharingLastShared(Object ago, Object lat, Object lon) {
    return 'Compartilhado $ago — $lat, $lon';
  }

  @override
  String gpsSharingOutcomeOk(Object lat, Object lon) {
    return '✅ Localização enviada: $lat, $lon';
  }

  @override
  String get gpsSharingOutcomeCleared => 'Localização limpa do rádio.';

  @override
  String get gpsSharingOutcomeDisabled =>
      'O compartilhamento está desligado nas Configurações.';

  @override
  String get gpsSharingOutcomeNoPerm => 'Permissão de localização negada.';

  @override
  String get gpsSharingOutcomeServiceOff =>
      'Serviço de localização desligado no celular.';

  @override
  String get gpsSharingOutcomeNoFix => 'Sem fix de GPS disponível.';

  @override
  String get gpsSharingOutcomeDisconnected =>
      'Rádio desconectado — conecte primeiro.';

  @override
  String get gpsSharingOutcomeFailed => 'Falha ao enviar localização.';

  @override
  String get gpsSharingOutcomeSkipped =>
      'Posição não mudou — envio dispensado.';

  @override
  String get gpsSharingMinMoveLabel => 'Movimento mínimo';

  @override
  String get gpsSharingMinMoveAlways => 'Sempre enviar';

  @override
  String get gpsSharingMinMoveHint =>
      'Em modo automático, só envia novo fix se você se moveu pelo menos esta distância desde o último envio. Economiza air-time da rede LoRa.';

  @override
  String get gpsSharingAdvPolicyTitle => 'Divulgar localização nos adverts';

  @override
  String get gpsSharingAdvPolicyNever =>
      'Desligado — os seus adverts não incluem coordenadas.';

  @override
  String get gpsSharingAdvPolicyAlways =>
      'Ligado — cada advert inclui a última localização conhecida do rádio.';

  @override
  String gpsSharingAdvPolicyUnknown(Object value) {
    return 'Política do rádio: byte $value — valor desconhecido.';
  }

  @override
  String get mapVisibilityShowTitle => 'Mostrar no mapa';

  @override
  String get mapVisibilityShowSubtitle =>
      'Esconde este contato do seu mapa, mesmo que os adverts incluam coordenadas.';

  @override
  String get cannedMessagesTitle => 'Mensagens rápidas';

  @override
  String get cannedMessagesSubtitle =>
      'Biblioteca de respostas prontas para enviar com um toque (ou pelo botão SOS do widget).';

  @override
  String get cannedMessagesAdd => 'Adicionar mensagem';

  @override
  String get cannedMessagesAddTitle => 'Nova mensagem rápida';

  @override
  String get cannedMessagesEditTitle => 'Editar mensagem rápida';

  @override
  String get cannedMessagesEmpty =>
      'Nenhuma mensagem salva. Toque em + para adicionar.';

  @override
  String get cannedMessagesReset => 'Restaurar padrão';

  @override
  String get cannedMessagesResetTitle => 'Restaurar mensagens?';

  @override
  String get cannedMessagesResetConfirm =>
      'Você vai perder todas as alterações e voltar à lista original.';

  @override
  String get cannedMessagesDeleteTitle => 'Excluir mensagem?';

  @override
  String cannedMessagesDeleteConfirm(Object label) {
    return 'Você vai excluir “$label”.';
  }

  @override
  String get cannedMessagesLabelHint => 'Rótulo (opcional)';

  @override
  String get cannedMessagesTextHint => 'Texto da mensagem';

  @override
  String get cannedMessagesEmergencyToggle => 'Mensagem de emergência';

  @override
  String get cannedMessagesEmergencyDesc =>
      'É a mensagem usada pelo botão SOS do widget. Só uma pode estar marcada.';

  @override
  String get cannedMessagesPickerTooltip => 'Mensagens rápidas';

  @override
  String get cannedMessagesPickerTitle => 'Inserir mensagem rápida';

  @override
  String get cannedMessagesPickerSubtitle =>
      'Toque para colocar no campo de texto.';

  @override
  String get commonConfirm => 'Confirmar';

  @override
  String get commonError => 'Erro';

  @override
  String get commonErrors => 'Erros';

  @override
  String get commonYes => 'Sim';

  @override
  String get commonNo => 'Não';

  @override
  String get commonOk => 'Ok';

  @override
  String get pathHashMigrationNoticeTitle => 'Aviso da rede';

  @override
  String get pathHashMigrationNoticeBody =>
      'A rede vai mudar para o modo hash de 2 bytes após 2/7/2026 (2 de julho). O aplicativo vai configurar automaticamente o seu rádio nessa data.';

  @override
  String get pathHashMigrationAppliedTitle => 'Rede atualizada';

  @override
  String get pathHashMigrationAppliedBody =>
      'O seu rádio foi atualizado automaticamente para o modo hash de 2 bytes a partir de 2/7/2026.';

  @override
  String get commonLoading => 'Carregando...';

  @override
  String get commonSearch => 'Pesquisar';

  @override
  String get commonAll => 'Todos';

  @override
  String get commonUnread => 'Não lidas';

  @override
  String get commonDetails => 'Detalhes';

  @override
  String get commonReply => 'Responder';

  @override
  String get commonCopyText => 'Copiar texto';

  @override
  String get commonNoMessages => 'Sem mensagens';

  @override
  String get commonSendFirstMessage => 'Envie a primeira mensagem!';

  @override
  String get commonSendMessage => 'Enviar mensagem';

  @override
  String get commonNoData => 'Sem dados';

  @override
  String get commonMessageCopied => 'Mensagem copiada';

  @override
  String get commonSent => 'Transmitida';

  @override
  String get commonSentByMe => 'Eu';

  @override
  String get commonPropagating => 'Propagando...';

  @override
  String get chatBadgePropagatingTooltip => 'Aguardando eco de repetidor...';

  @override
  String get chatBadgeTransmittedTooltip =>
      'Transmitida — sem eco de repetidor recebido';

  @override
  String chatBadgeHeardTooltip(int count) {
    return 'Ouvida por $count repetidor(es)';
  }

  @override
  String get commonConnecting => 'Conectando...';

  @override
  String get commonSearching => 'Procurando...';

  @override
  String get commonAuthenticated => 'Autenticado';

  @override
  String get commonDirect => 'Direto';

  @override
  String get commonFlood => 'Flood';

  @override
  String get commonBattery => 'Bateria';

  @override
  String get commonStatus => 'Status';

  @override
  String get commonPath => 'Caminho';

  @override
  String get commonTime => 'Hora';

  @override
  String get commonName => 'Nome';

  @override
  String get commonChannel => 'Canal';

  @override
  String get commonContact => 'Contato';

  @override
  String get commonRoom => 'Sala';

  @override
  String get commonRooms => 'Salas';

  @override
  String get commonSensor => 'Sensor';

  @override
  String get commonSensors => 'Sensores';

  @override
  String get commonRepeater => 'Repetidor';

  @override
  String get commonRepeaters => 'Repetidores';

  @override
  String get commonType => 'Tipo';

  @override
  String get commonHops => 'Saltos';

  @override
  String get commonFavorites => 'Favoritos';

  @override
  String get commonTelemetry => 'Telemetria';

  @override
  String get commonSettings => 'Configurações';

  @override
  String get commonRadioDisconnected => 'Rádio não conectado';

  @override
  String get commonConfiguring => 'Configurando...';

  @override
  String get commonSaveToRadio => 'Salvar no rádio';

  @override
  String get commonReportUrlCopied => 'URL do relatório copiada';

  @override
  String get commonErrorColon => 'Erro:';

  @override
  String get commonNoSpace =>
      'Sem espaço disponível. Remova um canal primeiro.';

  @override
  String get commonUpdated => 'Atualizado:';

  @override
  String get commonAdd2Radio => 'Adicionar ao Rádio';

  @override
  String get commonReconfigRadio => 'Reconfigurar no Rádio';

  @override
  String get commonHashtag => 'Hashtag';

  @override
  String get commonSecretKey => 'Secret Key';

  @override
  String get commonReport => 'Relatório:';

  @override
  String get commonClearHistory => 'Limpar histórico';

  @override
  String get commonSingularHop => 'salto';

  @override
  String get commonPluralHops => 'saltos';

  @override
  String get homeDisconnectTitle => 'Desconectar rádio?';

  @override
  String get homeDisconnectContent => 'A conexão com o rádio será encerrada';

  @override
  String get homeDisconnect => 'Desconectar';

  @override
  String get homeExitTitle => 'Sair da MeshCore Brasil?';

  @override
  String get homeExitContent =>
      'A conexão com o rádio será encerrada e o aplicativo fechado.';

  @override
  String get homeExit => 'Sair';

  @override
  String get settingsIdentity => 'Identidade';

  @override
  String get settingsPublicKey => 'Chave Pública';

  @override
  String get settingsCopyPublicKey => 'Copiar chave pública';

  @override
  String get settingsShareContact => 'Compartilhar meu contato';

  @override
  String get settingsShareContactDesc => 'Mostra QR Code para compartilhar';

  @override
  String get settingsConnection => 'Conexão';

  @override
  String get settingsConnected => 'Conectado';

  @override
  String get settingsConnectionError => 'Erro de conexão';

  @override
  String get settingsDisconnected => 'Desconectado';

  @override
  String get settingsAutoReconnect => 'Reconexão automática';

  @override
  String get settingsAutoReconnectDesc =>
      'Reconecta automaticamente quando a conexão é perdida';

  @override
  String get settingsRadioConfig => 'Configuração do Rádio';

  @override
  String get settingsRadioConfigDesc => 'LoRa, telemetria e dispositivo';

  @override
  String get settingsReboot => 'Reiniciar';

  @override
  String get settingsShutdown => 'Desligar';

  @override
  String get settingsRebootTitle => 'Reiniciar rádio';

  @override
  String get settingsRebootContent =>
      'Isso vai reiniciar o firmware do rádio. Tem certeza?';

  @override
  String get settingsRebootSent =>
      'Comando de reinício enviado. Aguardando reconexão...';

  @override
  String get settingsRebootFail => 'Falha ao enviar comando de reinício';

  @override
  String get settingsAppearance => 'Aparência';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Escuro';

  @override
  String get settingsTextSize => 'Tamanho do texto';

  @override
  String get settingsTextSizeDesc => 'Ajusta o tamanho global do texto no app.';

  @override
  String get settingsAccent => 'Cor de destaque';

  @override
  String get settingsAccentDefault => 'Padrão (azul da marca)';

  @override
  String get settingsAccentCustom => 'Personalizada';

  @override
  String get settingsAccentReset => 'Restaurar padrão';

  @override
  String get settingsMentionColors => 'Cores de menção';

  @override
  String get settingsSelfMention => 'Menção própria (@[Você])';

  @override
  String get settingsOtherMention => 'Menção de outros (@[Nome])';

  @override
  String get settingsChooseColor => 'Escolher cor';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsEnableNotifications => 'Ativar notificações';

  @override
  String get settingsEnableNotificationsDesc =>
      'Mostrar alertas para novas mensagens';

  @override
  String get settingsNotificationPermissionDenied =>
      'Permissão de notificação não concedida';

  @override
  String get settingsAllow => 'Permitir';

  @override
  String get settingsPrivateMessages => 'Mensagens privadas';

  @override
  String get settingsPrivateMessagesDesc =>
      'Notificar quando receber uma mensagem direta';

  @override
  String get settingsChannelMessages => 'Mensagens de canal';

  @override
  String get settingsChannelMessagesDesc => 'Notificar mensagens em canais';

  @override
  String get settingsChannelMentionsOnly => 'Apenas menções';

  @override
  String get settingsChannelMentionsOnlyDesc =>
      'Só notificar quando houver uma menção ao seu nome no canal';

  @override
  String get settingsBackgroundOnly => 'Apenas em segundo plano';

  @override
  String get settingsBackgroundOnlyDesc =>
      'Só notificar quando o app não está em primeiro plano';

  @override
  String settingsSosDesc(Object gps) {
    return 'Configure o destino e a mensagem de emergência. Use \'$gps\' no texto para inserir coordenadas.';
  }

  @override
  String get settingsSosTarget => 'Destino SOS';

  @override
  String get settingsSosTargetChannel => 'Canal';

  @override
  String get settingsSosTargetPrivateContact => 'Contato privado';

  @override
  String get settingsSosChannelLabel => 'Canal de envio';

  @override
  String get settingsSosGeneralChannel => '#0 Geral';

  @override
  String get settingsSosDestinationContact => 'Contato de destino';

  @override
  String get settingsSosNoContactsAvailable => 'Sem contatos disponíveis';

  @override
  String get settingsSosTapToSearchContact => 'Toque para procurar contato';

  @override
  String get settingsSosClearContact => 'Limpar contato';

  @override
  String get settingsSosMessage => 'Mensagem SOS';

  @override
  String settingsSosMessageHint(Object gps) {
    return 'Ex: SOS - preciso de ajuda! \'$gps\'';
  }

  @override
  String get settingsSosIncludeGps => 'Incluir coordenadas GPS do celular';

  @override
  String get settingsSosIncludeGpsDesc =>
      'Se não houver GPS/permissão, a mensagem é enviada sem coordenadas.';

  @override
  String get settingsSosSendNow => 'Enviar SOS agora';

  @override
  String get settingsSosSent => 'SOS enviado';

  @override
  String get settingsSosRadioNotConnected => 'Rádio não conectado';

  @override
  String get settingsSosMissingContact =>
      'Contato SOS não configurado/encontrado';

  @override
  String get settingsSosSendFailed => 'Falha ao enviar SOS';

  @override
  String settingsSosSendFailedDetail(Object detail) {
    return 'Falha SOS: $detail';
  }

  @override
  String get settingsSosSearchContact => 'Procurar contato SOS';

  @override
  String get settingsSosSearchHint => 'Nome ou ID curto';

  @override
  String get settingsSosNoContactFound => 'Nenhum contato encontrado';

  @override
  String get settingsSosUnnamedChannel => '(sem nome)';

  @override
  String get settingsSosHoldDuration => 'Segurar para enviar (segundos)';

  @override
  String get settingsSosHoldDurationDesc =>
      'Mantém o botão SOS pressionado este tempo antes de enviar. Evita envios acidentais.';

  @override
  String get settingsSosHoldToSend => 'Segure para enviar SOS';

  @override
  String get cannedMessagesSosHint =>
      'Segure o chip SOS para enviar com as configurações definidas';

  @override
  String get settingsPruneTitle => 'Limpeza de Contatos';

  @override
  String get settingsPruneDesc =>
      'Remove contatos inativos da memória do rádio';

  @override
  String get settingsPruneDaysLabel => 'Dias de Inatividade';

  @override
  String get settingsPruneDaysDesc =>
      'Contatos sem contato há mais de X dias serão removidos';

  @override
  String get settingsPruneDaysUnit => 'dias';

  @override
  String get settingsPruneTypesTitle => 'Tipos de Contato a Remover';

  @override
  String get settingsPruneChatsTitle => 'Chats / Pessoais';

  @override
  String get settingsPruneChatsDesc => 'Remover contatos de chat (0x01)';

  @override
  String get settingsPruneRepeatersTitle => 'Repetidores';

  @override
  String get settingsPruneRepeatersDesc =>
      'Remover contatos de repetidor (0x02)';

  @override
  String get settingsPruneRoomsTitle => 'Salas';

  @override
  String get settingsPruneRoomsDesc => 'Remover contatos de sala (0x03)';

  @override
  String get settingsPruneSensorsTitle => 'Sensores';

  @override
  String get settingsPruneSensorsDesc => 'Remover contatos de sensor (0x04)';

  @override
  String get settingsPruneRestoreDefaults => 'Restaurar Padrão';

  @override
  String get settingsPublicKeyCopied => 'Chave pública copiada';

  @override
  String get settingsShutdownUnavailable =>
      'Desligar não disponível neste firmware';

  @override
  String get settingsOwnQrCodeTitle => 'Meu QR Code';

  @override
  String get settingsEditNameTitle => 'Alterar Nome';

  @override
  String get settingsNodeNameLabel => 'Nome do nó';

  @override
  String get settingsNodeNameHint => 'Ex: CT1XXX-MC';

  @override
  String get settingsPrivateKeyCopy => 'Cópia da Chave Privada';

  @override
  String get settingsPrivateKeyDesc =>
      'A chave privada identifica você na rede. Guarde uma cópia segura antes de trocar de dispositivo.';

  @override
  String get settingsSaveFromRadio => 'Salvar do rádio';

  @override
  String get settingsPasteKey => 'Colar chave';

  @override
  String get settingsShareCopy => 'Compartilhar cópia';

  @override
  String get settingsRestoreToRadio => 'Restaurar no rádio';

  @override
  String get settingsDeleteLocalCopy => 'Excluir cópia local';

  @override
  String get settingsRestorePrivateKeyTitle => 'Restaurar Chave Privada';

  @override
  String get settingsRestorePrivateKeyContent =>
      'Esta operação vai substituir a chave privada atual do rádio. A nova identidade é aplicada imediatamente — a chave pública no app será atualizada.\n\nTem certeza?';

  @override
  String get settingsDeleteBackupTitle => 'Excluir cópia de segurança';

  @override
  String get settingsKeySavedSuccess => 'Chave privada salva com sucesso.';

  @override
  String get settingsKeyImportedSuccess =>
      'Chave restaurada com sucesso. Chave pública atualizada.';

  @override
  String get settingsKeyExportFailed =>
      'Exportação falhou. O firmware pode não ter esse suporte ativado.';

  @override
  String get settingsKeyRestoreFailed =>
      'Restauração falhou. O firmware pode não ter esse suporte ativado.';

  @override
  String get settingsDeleteBackupContent =>
      'A cópia da chave privada salva neste dispositivo será apagada. O rádio não é afetado.';

  @override
  String get settingsKeyCopied => 'Chave privada copiada';

  @override
  String get settingsKeyCopySaved => 'Cópia salva neste dispositivo.';

  @override
  String get settingsCopyKeyTooltip => 'Copiar chave completa';

  @override
  String get settingsKeyConnectToBackup =>
      'Conecte-se ao rádio para fazer backup da chave.';

  @override
  String get settingsKeyShareSubject => 'MeshCore — cópia da chave privada';

  @override
  String get settingsPasteKeyTitle => 'Colar chave privada';

  @override
  String get settingsPasteKeyHint =>
      'Cole aqui a chave privada de uma cópia anterior (128 caracteres hex).';

  @override
  String get settingsKeyHexLabel => 'Chave privada (hex)';

  @override
  String get settingsKeyInvalidHex =>
      'Chave inválida — deve ter exatamente 128 caracteres hexadecimais.';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsAppName => 'MeshCore Brasil';

  @override
  String get settingsAppSubtitle => 'App para rádios MeshCore';

  @override
  String get settingsCredit =>
      'Código fonte original por Paulo Pereira aka GZ7d0';

  @override
  String get settingsForkNotice =>
      'Fork brasileiro do lusoapp, da Comunidade MeshCore Portugal, adaptado pela comunidade MeshCore Brasil.';

  @override
  String get settingsForkRepo => 'github.com/Meshcore-Portugal/lusoapp';

  @override
  String get settingsForkMaintainer =>
      'Fork brasileiro mantido por Oruam Oliuj';

  @override
  String get settingsVersion => 'Versão';

  @override
  String get settingsProtocol => 'Protocolo';

  @override
  String get settingsProtocolName => 'Companion Radio Protocol v3';

  @override
  String get settingsLicense => 'Licença';

  @override
  String get settingsLicenseMIT => 'MIT';

  @override
  String get contactsAll => 'Todos';

  @override
  String get contactsFavorites => 'Favoritos';

  @override
  String get contactsCompanions => 'Companheiros';

  @override
  String get contactsRepeaters => 'Repetidores';

  @override
  String get contactsSensors => 'Sensores';

  @override
  String get contactsSearchHint => 'Pesquisar contatos...';

  @override
  String get contactsSendAdvert => 'Enviar Anúncio';

  @override
  String get contactsAdvertZeroHop => 'Anúncio · Zero Hop';

  @override
  String get contactsAdvertFlood => 'Anúncio · Flood';

  @override
  String get contactsAdvertSentZeroHop => 'Anúncio Zero Hop enviado';

  @override
  String get contactsAdvertSentFlood => 'Anúncio Flood enviado';

  @override
  String get contactsSort => 'Ordenar';

  @override
  String get contactsSortNameAZ => 'Nome (A-Z)';

  @override
  String get contactsSortLastHeard => 'Ouvido recentemente';

  @override
  String get contactsSortLastMessage => 'Última mensagem';

  @override
  String get contactsMoreOptions => 'Mais opções';

  @override
  String get contactsDiscover => 'Descobrir contatos';

  @override
  String get contactsMultiSelect => 'Selecionar múltiplos';

  @override
  String get contactsEmptyCompanions => 'Sem companheiros na rede';

  @override
  String get contactsEmptyRepeaters => 'Sem repetidores na rede';

  @override
  String get contactsEmptyRooms => 'Sem salas na rede';

  @override
  String get contactsEmptySensors => 'Sem sensores na rede';

  @override
  String get contactsEmpty => 'Sem contatos';

  @override
  String get contactsEmptyFavorites => 'Sem favoritos';

  @override
  String get contactsEmptyHint =>
      'Os contatos aparecem quando o rádio os descobre';

  @override
  String get contactsSelected => 'selecionado(s)';

  @override
  String get contactsRemoveSelected => 'Remover selecionados';

  @override
  String get contactsCancelSelection => 'Cancelar seleção';

  @override
  String get contactsAddContact => 'Adicionar contato';

  @override
  String get contactsAddInstruction =>
      'Envie um anúncio para que outros nós o descubram automaticamente, ou adicione manualmente pela chave pública';

  @override
  String get contactsSendAdvertAuto => 'Enviar Anúncio (descoberta automática)';

  @override
  String get contactsReadQR => 'Ler QR Code';

  @override
  String get contactsOrManual => 'ou adicionar manualmente';

  @override
  String get contactsPublicKeyLabel => 'Chave pública (hex, 64 chars)';

  @override
  String get contactsDisplayName => 'Nome de exibição';

  @override
  String get contactsTypeChat => 'Chat';

  @override
  String get contactsTypeRepeater => 'Repetidor';

  @override
  String get contactsTypeRoom => 'Sala';

  @override
  String get contactsAdding => 'Adicionando...';

  @override
  String get contactsSeen => 'Visto:';

  @override
  String get contactsRenameTitle => 'Renomear contato';

  @override
  String get contactsAnnouncedName => 'Nome anunciado:';

  @override
  String get contactsCustomName => 'Nome personalizado';

  @override
  String get contactsSaveToRadioTitle => 'Salvar contato no rádio';

  @override
  String get contactsTypeCompanion => 'Tipo: Companheiro';

  @override
  String contactsSavedToRadio(String name) {
    return '$name salvo no rádio';
  }

  @override
  String get contactsSaveToRadioError => 'Erro ao salvar contato no rádio';

  @override
  String get contactsSaveTimeout => 'Tempo esgotado: rádio não respondeu';

  @override
  String get contactsRemoveTitle => 'Remover contato(s)?';

  @override
  String get contactsRemovedPrefix => 'Removidos';

  @override
  String get contactsRemoveErrorSuffix => 'erro(s)';

  @override
  String get contactsRemoveError => 'Erro ao remover contatos';

  @override
  String get contactsRemoveFromListSuffix => 'da lista de contatos?';

  @override
  String get contactsRemoveRadioError => 'Erro ao remover no rádio (código';

  @override
  String get contactsRemoveTimeout =>
      'Tempo esgotado: rádio não respondeu à remoção';

  @override
  String get contactsRemoveFavorites => 'Remover dos favoritos';

  @override
  String get contactsAddFavorites => 'Adicionar aos favoritos';

  @override
  String get contactsShareQR => 'Compartilhar via QR';

  @override
  String get contactsPrivateMessage => 'Mensagem privada';

  @override
  String get contactsJoinRoom => 'Entrar na sala';

  @override
  String get contactsRemoteAdmin => 'Admin remoto';

  @override
  String get contactsManagePath => 'Gerenciar caminho';

  @override
  String get contactsCurrentPath => 'Caminho atual:';

  @override
  String get contactsRemoveContact => 'Remover contato';

  @override
  String get contactsAdminLabel => 'Admin:';

  @override
  String get contactsIdLabel => 'ID:';

  @override
  String get contactsHopsLabel => 'Saltos:';

  @override
  String get contactsAuth => 'Autenticação';

  @override
  String get contactsPassword => 'Senha (opcional)';

  @override
  String get contactsPasswordHint => 'Deixe em branco se não houver senha';

  @override
  String get contactsJoin => 'Entrar';

  @override
  String get contactsStatusSent => 'Pedido de status enviado...';

  @override
  String get contactsStatusSending => 'Enviando:';

  @override
  String get contactsRemoteActions => 'Ações Remotas';

  @override
  String get contactsFloodAdvert => 'Anúncio Flood';

  @override
  String get contactsFloodAdvertDesc => 'Força o nó a enviar um anúncio flood';

  @override
  String get contactsZeroHopAdvert => 'Anúncio Zero-Hop';

  @override
  String get contactsZeroHopAdvertDesc => 'Anúncio só para vizinhos diretos';

  @override
  String get contactsSyncClock => 'Sincronizar Relógio';

  @override
  String get contactsSyncClockDesc => 'Envia o timestamp atual para o nó';

  @override
  String get contactsStartOTA => 'Iniciar OTA';

  @override
  String get contactsStartOTADesc => 'Inicia atualização OTA — NRF DFU / ESP32';

  @override
  String get contactsConfirmOTATitle => 'Confirmar OTA';

  @override
  String get contactsConfirmOTAContent =>
      'O rádio vai entrar em modo de atualização OTA e ficará temporariamente inacessível';

  @override
  String get contactsConfirmOTAQuestion => 'Tem certeza?';

  @override
  String get contactsStats => 'Estatísticas';

  @override
  String get contactsUptime => 'Uptime';

  @override
  String get contactsSnrLast => 'SNR (último)';

  @override
  String get contactsRssiLast => 'RSSI (último)';

  @override
  String get contactsNoise => 'Ruído';

  @override
  String get contactsRxTx => 'RX / TX';

  @override
  String get contactsFloodRxTx => 'Flood RX/TX';

  @override
  String get contactsDirectRxTx => 'Direto RX/TX';

  @override
  String get contactsAirtimeTx => 'Tempo no ar (TX)';

  @override
  String get contactsAirtimeRx => 'Tempo no ar (RX)';

  @override
  String get contactsDuplicates => 'Duplicados';

  @override
  String get contactsNotSavedHint =>
      'Este contato foi ouvido mas não está salvo no rádio';

  @override
  String get channelsCreatePrivate => 'Criar Canal Privado';

  @override
  String get channelsCreatePrivateDesc => 'Protegido com uma chave secreta';

  @override
  String get channelsJoinPrivate => 'Entrar em um Canal Privado';

  @override
  String get channelsJoinPrivateDesc => 'Digite manualmente uma chave secreta';

  @override
  String get channelsJoinPublic => 'Entrar no Canal Público';

  @override
  String get channelsJoinPublicDesc =>
      'Qualquer pessoa pode entrar neste canal';

  @override
  String get channelsJoinHashtag => 'Entrar em um Canal Hashtag';

  @override
  String get channelsJoinHashtagDesc =>
      'Qualquer pessoa pode entrar em canais hashtag';

  @override
  String get channelsReadQR => 'Ler QR Code';

  @override
  String get channelsReadQRDesc => 'Escanear o QR Code de um canal';

  @override
  String get channelsSlotPosition => 'Posição do canal';

  @override
  String get channelsSlot => 'Canal';

  @override
  String get channelsSlotInUse => '(em uso)';

  @override
  String get channelsChannelName => 'Nome do canal';

  @override
  String get channelsHashtagName => 'Nome do hashtag (sem #)';

  @override
  String get channelsHashtagHint => 'ex: meshcore  →  canal #meshcore';

  @override
  String get channelsNameHintGeneral => 'ex: Geral';

  @override
  String get channelsNameHintPrivate => 'ex: Minha Rede';

  @override
  String get channelsSecretKey => 'Chave secreta (32 caracteres hex)';

  @override
  String get channelsSecretKeyHint => 'ex: 8b3387e9c5cdea6ac9e5edbaa115cd72';

  @override
  String get channelsPublicKey => 'Chave pública conhecida';

  @override
  String get channelsDerivedKey => 'Chave derivada do hashtag';

  @override
  String get channelsRandomKey => 'Chave gerada aleatoriamente';

  @override
  String get channelsPublicKeyInfo =>
      'Esta chave é pública e igual em todos os dispositivos MeshCore';

  @override
  String get channelsHashtagKeyInfo =>
      'Qualquer pessoa que entre no mesmo hashtag terá esta chave automaticamente';

  @override
  String get channelsRandomKeyInfo =>
      'Guarde esta chave ou compartilhe o QR Code para convidar outros';

  @override
  String get channelsRegenerateKey => 'Gerar nova chave';

  @override
  String get channelsEmpty => 'Sem canais';

  @override
  String get channelsEmptyHint =>
      'Os canais configurados no rádio aparecem aqui';

  @override
  String get channelsRefresh => 'Atualizar Canais';

  @override
  String get channelsAllRead => 'Tudo lido';

  @override
  String get channelsAllReadHint => 'Sem mensagens não lidas nos canais';

  @override
  String get channelsSeeAll => 'Ver todos os canais';

  @override
  String get channelsMsgSuffix => 'msg';

  @override
  String get channelsOptionsFabTooltip => 'Opções do canal';

  @override
  String get channelsClearHistoryConfirm =>
      'Excluir todas as mensagens deste canal? Esta ação não pode ser desfeita';

  @override
  String get channelsEditSheet => 'Editar canal';

  @override
  String get channelsQRTitle => 'QR Code do canal';

  @override
  String get channelsShowQR => 'Mostrar QR Code do canal';

  @override
  String get channelsQRDesc =>
      'Compartilhe este QR Code para dar acesso ao canal';

  @override
  String get channelsShareText => 'Compartilhar texto';

  @override
  String get channelsShareQR => 'Compartilhar QR';

  @override
  String get channelsRemovePublicTitle => 'Remover Canal Público?';

  @override
  String get channelsRemovePublicWarning =>
      'Você está prestes a remover o Canal Público. Este é o canal principal compartilhado pela comunidade MeshCore. Tem certeza?';

  @override
  String get channelsRemoveAnyway => 'Remover mesmo assim';

  @override
  String get channelsRemoveTitle => 'Remover canal';

  @override
  String get channelsRemoveConfirm => 'Tem certeza que quer remover';

  @override
  String get channelsRemoveWarning => 'Esta ação não pode ser desfeita.';

  @override
  String get channelsMuteTitle => 'Canal silenciado';

  @override
  String get channelsUnmuteTitle => 'Notificações ativas';

  @override
  String get channelsMuteSubtitleOn =>
      'Sem alertas — badge de não lidas ainda visível';

  @override
  String get channelsMuteSubtitleOff =>
      'Recebe notificações e badge de não lidas';

  @override
  String get channelsMuteLabel => 'silenciado';

  @override
  String get chatMuteChannel => 'Silenciar canal';

  @override
  String get chatUnmuteChannel => 'Reativar notificações';

  @override
  String get chatNoMessages => 'Sem mensagens neste canal';

  @override
  String get chatSendFirstMessage => 'Envie a primeira mensagem!';

  @override
  String get chatInputHint => 'Mensagem para o canal...';

  @override
  String get chatRepeater => 'Repetidor';

  @override
  String get chatRepeaters => 'Repetidores';

  @override
  String get chatMsgCount => 'mensagens';

  @override
  String get chatHeard => 'Ouvida';

  @override
  String get chatOnce => 'vez';

  @override
  String get chatTimes => 'vezes por repetidores';

  @override
  String get chatViaRepeaters => 'Recebida via repetidores';

  @override
  String get chatAuthenticatedMessage => 'Autenticado';

  @override
  String get chatMsgDetails => 'Detalhes da mensagem';

  @override
  String get chatRetry => 'Reenviar';

  @override
  String get chatFailed => 'Falhou';

  @override
  String get chatPathLabel => 'Caminho';

  @override
  String get chatHeardCount => 'Ouvido';

  @override
  String get chatTimesCount => 'vezes';

  @override
  String get chatPathExplanation =>
      'Cada caminho representa uma vez que o seu rádio ouviu a mensagem de volta';

  @override
  String get chatPathInstruction =>
      'Toque em um caminho para ver a rota completa';

  @override
  String get chatNoPathData =>
      'Os dados de caminho não estão disponíveis. Reconecte o rádio para registrar novos caminhos';

  @override
  String get chatViewOnMap => 'Ver no mapa';

  @override
  String get chatYourRadio => 'O seu rádio';

  @override
  String get chatLastRepeater => 'Último repetidor';

  @override
  String get chatYouSent => 'Você enviou a mensagem';

  @override
  String get chatSentMessage => 'Enviou a mensagem';

  @override
  String get chatReceived => 'Recebeu a mensagem';

  @override
  String get chatHopLabel => 'Salto';

  @override
  String get chatHopOrderFarthest => 'mais distante';

  @override
  String get chatRepeated => 'Repetiu';

  @override
  String get chatHashtagChannel =>
      'Canal Hashtag — qualquer pessoa com o nome pode entrar';

  @override
  String get chatKeyLabel => 'Chave:';

  @override
  String get chatCreateJoinChannel => 'Criar e entrar no canal';

  @override
  String get chatNoChannelSlots => 'Sem espaço disponível para novos canais';

  @override
  String get chatDeleteMessage => 'Excluir mensagem';

  @override
  String get chatMenuOptions => 'Opções do canal';

  @override
  String get chatNewMessages => 'Novas mensagens';

  @override
  String get chatPingButton => '!ping';

  @override
  String get chatViewResultOnline => 'ver resultado online';

  @override
  String get connectTitle => 'MeshCore Brasil';

  @override
  String get connectReconnect => 'Conectar novamente';

  @override
  String get connectContinueOffline => 'Continuar offline';

  @override
  String get connectSearchDevices => 'Procurar Dispositivos';

  @override
  String get connectSearching => 'Procurando...';

  @override
  String get connectBrowserNote =>
      'O navegador vai mostrar um seletor de dispositivos Bluetooth';

  @override
  String get connectScanningMessage => 'Procurando rádios MeshCore...';

  @override
  String get connectTapHint =>
      'Toque em \"Procurar\" para encontrar dispositivos';

  @override
  String get connectSectionBluetooth => 'BLUETOOTH';

  @override
  String get connectSectionSerial => 'USB / SERIAL';

  @override
  String get connectDeviceBLE => '(Bluetooth LE)';

  @override
  String get connectDeviceUSB => '(Serial USB — Companion)';

  @override
  String get connectDeviceKISS => '(KISS TNC)';

  @override
  String get connectDeviceWebUSB => 'Web USB — Companion';

  @override
  String get connectDeviceWebKISS => 'Web USB — KISS TNC';

  @override
  String get connectWebUsbButton => 'Conectar via USB (Web Serial)';

  @override
  String get connectWebUsbScanning => 'Selecionando porta USB...';

  @override
  String get connectWebUsbHint =>
      'Suportado no Chrome e Edge. O navegador vai mostrar um seletor de portas USB.';

  @override
  String get connectWebUsbExpiredMessage =>
      'Porta USB não disponível (página recarregada). Selecione o dispositivo novamente.';

  @override
  String get connectWebUsbAction => 'Conectar via USB';

  @override
  String get connectStepConnecting => 'Conectando...';

  @override
  String get connectStepWaiting => 'Aguardando rádio...';

  @override
  String get connectStepDeviceInfo => 'Informações do dispositivo';

  @override
  String get connectStepContacts => 'Contatos';

  @override
  String get connectStepChannels => 'Canais';

  @override
  String get connectStepDone => 'Concluído';

  @override
  String get connectBluetoothOffTitle => 'Bluetooth desligado';

  @override
  String get connectBluetoothOffMessage =>
      'O Bluetooth está desligado. Deseja ativá-lo para conectar ao rádio MeshCore?';

  @override
  String get connectBluetoothEnable => 'Ativar';

  @override
  String get connectBluetoothDeniedTitle => 'Ativação do Bluetooth recusada';

  @override
  String get connectBluetoothDeniedMessage =>
      'Por favor, ative o Bluetooth nas Configurações do sistema';

  @override
  String get connectBluetoothOff =>
      'Bluetooth desligado. Ligue o Bluetooth para procurar dispositivos';

  @override
  String get connectBluetoothPermission =>
      'Permissões de Bluetooth necessárias para procurar dispositivos';

  @override
  String get connectOpenSettings => 'Configurações';

  @override
  String get connectFailTitle => 'Falha ao conectar ao dispositivo';

  @override
  String get connectLastFailTitle => 'Falha ao conectar ao último dispositivo';

  @override
  String get connectCancelledMessage => 'Conexão com o rádio cancelada';

  @override
  String get discoverTitle => 'Descobrir';

  @override
  String get discoverSubtitle => 'Anúncios Recentes';

  @override
  String get discoverSearchHint => 'Procurar contatos descobertos...';

  @override
  String get discoverEmpty => 'Nenhum contato encontrado';

  @override
  String get discoverEmptyHint => 'Tente uma busca diferente';

  @override
  String get discoverNone => 'Nenhum contato descoberto';

  @override
  String get discoverNoneHint =>
      'Contatos aparecem enquanto transmitem na rede';

  @override
  String get discoverCleanTooltip => 'Limpar contatos só locais';

  @override
  String get discoverCleanSheetTitle => 'Limpar contatos só locais';

  @override
  String get discoverCleanSheetSubtitle =>
      'Escolha quais contatos descobertos remover. Os contatos salvos no rádio são sempre mantidos.';

  @override
  String get discoverCleanOption48h => 'Não ouvidos há 48 horas';

  @override
  String get discoverCleanOption7d => 'Não ouvidos há 7 dias';

  @override
  String get discoverCleanOption30d => 'Não ouvidos há 30 dias';

  @override
  String get discoverCleanOptionNever => 'Nunca ouvidos (sem advert)';

  @override
  String get discoverCleanOptionAll => 'Todos os contatos só locais';

  @override
  String get discoverCleanTitle => 'Limpar contatos descobertos?';

  @override
  String discoverCleanBody(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n contatos',
      one: '1 contato',
    );
    return 'Vai remover $_temp0 que não estão salvos no rádio. Os contatos salvos no rádio são mantidos.';
  }

  @override
  String get discoverCleanNothing =>
      'Todos os contatos descobertos já estão salvos no rádio. Nada para limpar.';

  @override
  String discoverCleanDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Removidos $n contatos',
      one: 'Removido 1 contato',
    );
    return '$_temp0';
  }

  @override
  String get discoverSaveToRadio => 'Salvar no rádio';

  @override
  String get discoverSendMessage => 'Enviar mensagem';

  @override
  String get discoverJoinRoom => 'Entrar na sala';

  @override
  String get discoverAddAndSave => 'Adicionar e salvar';

  @override
  String get discoverAnnouncedName => 'Nome Anunciado';

  @override
  String get discoverHeard => 'Ouvido';

  @override
  String get discoverNever => 'Nunca';

  @override
  String get discoverNoName => 'Sem nome';

  @override
  String get discoverTypeCompanion => 'Companheiro';

  @override
  String get discoverTypeUnknown => 'Desconhecido';

  @override
  String get discoverPathNear => 'Próximo';

  @override
  String get discoverJustNow => 'Agora';

  @override
  String discoverMinutesAgo(int min) {
    return '${min}m atrás';
  }

  @override
  String discoverHoursAgo(int hours) {
    return '${hours}h atrás';
  }

  @override
  String discoverDaysAgo(int days) {
    return '${days}d atrás';
  }

  @override
  String get appsPlano333Title => 'Plano 3-3-3';

  @override
  String get appsPlano333Subtitle => 'Evento semanal MeshCore';

  @override
  String get appsTelemetryTitle => 'Telemetria';

  @override
  String get appsTelemetrySubtitle => 'Bateria, RF e contadores';

  @override
  String get appsRxLogTitle => 'RX Log';

  @override
  String get appsRxLogSubtitle => 'Captura e exporta PCAP';

  @override
  String get appsQrTitle => 'Leitor QR';

  @override
  String get appsQrSubtitle => 'Escanear código QR';

  @override
  String get mapNoGps =>
      'Sem dados de GPS. Toque em \"Localizar\" ou aguarde contatos com coordenadas';

  @override
  String get mapShareMap => 'Compartilhar mapa';

  @override
  String get mapViewAll => 'Ver todos';

  @override
  String get mapCenterMyPosition => 'Centralizar na minha posição';

  @override
  String get mapGetGps => 'Obter localização GPS';

  @override
  String get mapLocationDisabled => 'Serviço de localização desativado';

  @override
  String get mapLocationDenied => 'Permissão de localização negada';

  @override
  String get mapLocationDeniedPermanently =>
      'Permissão de localização negada permanentemente';

  @override
  String get mapLocationError => 'Erro ao obter localização GPS';

  @override
  String get mapCaptureError => 'Não foi possível capturar o mapa';

  @override
  String get mapImageError => 'Falha ao gerar imagem do mapa';

  @override
  String get mapShareError => 'Erro ao compartilhar o mapa';

  @override
  String get mapNodesAtLocation => 'nós nesta localização';

  @override
  String get mapMinimizeList => 'Minimizar lista';

  @override
  String get mapShowMore => 'Mostrar +';

  @override
  String get mapHops => 'hop(s)';

  @override
  String get mapFinal => 'Final:';

  @override
  String get mapLegendTitle => 'Legenda';

  @override
  String get mapLegendCompanion => 'Companheiro';

  @override
  String get mapLegendRepeater => 'Repetidor';

  @override
  String get mapLegendRoom => 'Sala';

  @override
  String get mapLegendSensor => 'Sensor';

  @override
  String get mapLegendYou => 'Você';

  @override
  String get mapAttribution => 'MeshCore Brasil';

  @override
  String get mapAttributionOSM => '© OpenStreetMap contributors';

  @override
  String get mapPathPrefix => 'Path ·';

  @override
  String get privateNoMessages => 'Sem mensagens';

  @override
  String get privateSendFirstMessage => 'Envie a primeira mensagem!';

  @override
  String privateMessageTo(String name) {
    return 'Mensagem para $name...';
  }

  @override
  String privateTracingRoute(String name) {
    return 'Traçando rota para $name';
  }

  @override
  String get privateRouteFailed =>
      'Não foi possível descobrir a rota — tente novamente';

  @override
  String get privateRouteNoResponse => 'Sem resposta da rota — tente novamente';

  @override
  String get privateRouteFound => 'Rota encontrada —';

  @override
  String get privateDirectRoute => 'Rota direta (sem repetidores)';

  @override
  String get privateReceivedOnRadio => 'Recebido no rádio';

  @override
  String get privateConfirmed => 'Confirmado';

  @override
  String get privatePending => 'Pendente';

  @override
  String get privateSentVia => 'Enviado via';

  @override
  String get privateTraceRoute => 'Traçar rota';

  @override
  String get privateManagePath => 'Gerenciar caminho';

  @override
  String get privateContactLabel => 'Contato';

  @override
  String get qrTitle => 'Ler QR Code';

  @override
  String get qrUnavailable =>
      'Scanner de QR Code não disponível nesta plataforma';

  @override
  String get qrUnavailableHint => 'Use um dispositivo Android ou iOS';

  @override
  String get qrHint => 'Aponte para um QR Code MeshCore';

  @override
  String get radioSettingsTitle => 'Configuração do Rádio';

  @override
  String get radioSettingsDevice => 'Dispositivo';

  @override
  String get radioSettingsModel => 'Modelo';

  @override
  String get radioSettingsFirmware => 'Firmware';

  @override
  String get radioSettingsStorage => 'Armazenamento';

  @override
  String get radioSettingsChannels => 'Canais';

  @override
  String get radioSettingsContacts => 'Contatos';

  @override
  String get radioSettingsDiscovered => 'Contatos locais';

  @override
  String get radioSettingsAppVersion => 'Versão do App';

  @override
  String get radioSettingsLoRa => 'Parâmetros LoRa';

  @override
  String get radioSettingsFrequency => 'Frequência (MHz)';

  @override
  String get radioSettingsFreqLabel => 'Frequência';

  @override
  String get radioSettingsFrequencyHint => 'Ex: 923.1250';

  @override
  String get radioSettingsBandwidth => 'Largura de banda';

  @override
  String get radioSettingsSpreadingFactor => 'Spreading Factor';

  @override
  String get radioSettingsCodingRate => 'Coding Rate';

  @override
  String get radioSettingsTxPower => 'Potência TX';

  @override
  String get radioSettingsMax => 'Máx:';

  @override
  String get radioSettingsDbm => 'dBm';

  @override
  String get radioSettingsFrequencyRequired => 'Informe a frequência';

  @override
  String get radioSettingsFrequencyInvalid =>
      'Frequência inválida (150–2500 MHz)';

  @override
  String get radioSettingsBandwidthRequired => 'Selecione a largura de banda';

  @override
  String get radioSettingsSFRequired => 'Selecione o spreading factor';

  @override
  String get radioSettingsCRRequired => 'Selecione o coding rate';

  @override
  String get radioSettingsPowerRequired => 'Informe a potência';

  @override
  String get radioSettingsPowerInvalid => 'Potência inválida (1–30 dBm)';

  @override
  String get radioSettingsActiveConfig => 'Configuração Ativa';

  @override
  String get radioSettingsSaved => 'Configuração salva';

  @override
  String get radioSettingsPrivKeyCopied => 'Chave privada copiada';

  @override
  String get radioSettingsResetValues => 'Restaurar valores atuais';

  @override
  String get radioSettingsExperimentalTitle => 'Experimental';

  @override
  String get radioSettingsExperimentalWarning =>
      'Use com cuidado — estas opções afetam a compatibilidade no ar com outros nós.';

  @override
  String get radioSettingsPathHashMode => 'Tamanho do hash de caminho';

  @override
  String get radioSettingsPathHashModeDesc =>
      'Número de bytes usados por salto no caminho de encaminhamento. Valores maiores reduzem a probabilidade de colisão entre nós distantes. Requer firmware v1.14.0+. Padrão: 1 byte.';

  @override
  String get radioSettingsPathHashMode1 => '1 byte';

  @override
  String get radioSettingsPathHashMode2 => '2 bytes';

  @override
  String get radioSettingsPathHashModeCaptionDefault =>
      '1 byte por salto — padrão, compatível com todos os firmwares.';

  @override
  String get radioSettingsPathHashModeCaptionExperimental =>
      'Experimental — só nós com firmware v10+ encaminham este pacote corretamente.';

  @override
  String get radioSettingsPathHashModeUnsupported =>
      'Não suportado por este firmware.';

  @override
  String get radioSettingsPathHashModeSaved => 'Tamanho do hash atualizado';

  @override
  String get radioSettingsPathHashModeFailed =>
      'Falha ao atualizar o tamanho do hash';

  @override
  String get radioSettingsAutoAddTitle => 'Configurações de Contatos';

  @override
  String get radioSettingsAutoAddDesc =>
      'Quando um nó envia um advert e o rádio está em modo manual, adicionar automaticamente como:';

  @override
  String get radioSettingsAutoAddAll => 'Adicionar Todos Automaticamente';

  @override
  String get radioSettingsAutoAddAllDesc =>
      'Quando ativo, todos os adverts recebidos serão adicionados aos contatos.';

  @override
  String get radioSettingsAutoAddSelected =>
      'Adicionar Selecionados Automaticamente';

  @override
  String get radioSettingsAutoAddSelectedDesc =>
      'Quando ativo, apenas os tipos de contatos selecionados abaixo serão adicionados automaticamente.';

  @override
  String get radioSettingsAutoAddCompanion => 'Companheiro (Chat)';

  @override
  String get radioSettingsAutoAddRepeater => 'Repetidor';

  @override
  String get radioSettingsAutoAddRoom => 'Sala (Room)';

  @override
  String get radioSettingsAutoAddSensor => 'Sensor';

  @override
  String get radioSettingsOverwriteOldest => 'Sobrescrever o Mais Antigo';

  @override
  String get radioSettingsOverwriteOldestDesc =>
      'Quando ativo, os contatos mais antigos sem favorito são substituídos por novos quando a lista está cheia.';

  @override
  String get radioSettingsAutoAddMaxHops =>
      'Saltos Máximos para Adição Automática';

  @override
  String get radioSettingsAutoAddMaxHopsDesc =>
      'Os contatos só serão adicionados automaticamente se o caminho do advert tiver o mesmo número de saltos ou menos que o limite. Deixe em branco para sem limite.';

  @override
  String get radioSettingsAutoAddMaxHopsHint => 'Saltos (0-63)';

  @override
  String get radioSettingsPullToRefresh => 'Puxar para Atualizar';

  @override
  String get radioSettingsPullToRefreshDesc =>
      'Quando ativo, você pode deslizar para baixo para atualizar a lista de contatos.';

  @override
  String get radioSettingsShowPublicKeys => 'Mostrar Chaves Públicas';

  @override
  String get radioSettingsShowPublicKeysDesc =>
      'Quando ativo, as chaves públicas serão mostradas na lista de contatos.';

  @override
  String get radioSettingsBandPresetsTitle => 'Predefinições de Banda';

  @override
  String get roomJoinTitle => 'Entrar na sala';

  @override
  String get roomJoinInstruction =>
      'Esta sala pode exigir uma senha. Deixe em branco se for pública.';

  @override
  String get roomPasswordLabel => 'Senha (opcional)';

  @override
  String get roomPasswordHint => 'Deixe em branco se não houver senha';

  @override
  String get roomJoinFailed => 'Falhou — verifique a senha';

  @override
  String get roomJoining => 'Conectando...';

  @override
  String get roomJoinError =>
      'Não foi possível entrar na sala. Verifique a senha e tente novamente.';

  @override
  String get roomReplyStrip => 'Sala';

  @override
  String roomMessageHint(String name) {
    return 'Mensagem para a sala $name...';
  }

  @override
  String get roomMessageFallback => 'Escreva uma mensagem...';

  @override
  String get roomTelemetryData => 'Dados de telemetria';

  @override
  String get rxLogTitle => 'RX Log';

  @override
  String get rxLogExportPcap => 'Exportar PCAPNG';

  @override
  String get rxLogClearLog => 'Limpar log';

  @override
  String get rxLogPacketCount => 'pacotes capturados';

  @override
  String get rxLogClearTitle => 'Limpar RX Log';

  @override
  String get rxLogClearConfirm => 'Remover todos os pacotes capturados?';

  @override
  String get rxLogEmpty => 'RX Log vazio - nada para exportar';

  @override
  String get rxLogExportFail => 'Falha ao exportar PCAPNG';

  @override
  String get rxLogPacketAdvert => 'Advert';

  @override
  String get rxLogPacketGroupText => 'Group Text';

  @override
  String get rxLogPacketPrivateText => 'Private Text';

  @override
  String get rxLogPacketPath => 'Path';

  @override
  String get rxLogPacketControl => 'Control';

  @override
  String get rxLogPacketTypePrefix => 'Tipo';

  @override
  String get rxLogEmptyTitle => 'Sem pacotes RX';

  @override
  String get rxLogEmptyHint =>
      'Quando o rádio receber tráfego mesh, os pacotes aparecem aqui.';

  @override
  String get telemetryBattery => 'Bateria';

  @override
  String get telemetryNetStats => 'Estatísticas da Rede';

  @override
  String get telemetryRadioState => 'Rádio — Status';

  @override
  String get telemetryRadioWaiting => 'Aguardando estatísticas do rádio...';

  @override
  String get telemetryRadioRF => 'Rádio — RF';

  @override
  String get telemetryRFWaiting => 'Aguardando estatísticas de RF...';

  @override
  String get telemetryPacketCounters => 'Rádio — Contadores de Pacotes';

  @override
  String get telemetryCountersWaiting => 'Aguardando contadores de pacotes...';

  @override
  String get telemetrySensors => 'Sensores (Telemetria)';

  @override
  String get telemetryNoData => 'Nenhuma telemetria recebida.';

  @override
  String get telemetrySamplesSuffix => 'amostras';

  @override
  String get telemetryNow => 'Agora';

  @override
  String get telemetryHistoryHint =>
      'O histórico aparece após a primeira leitura de bateria.';

  @override
  String get telemetryRX => 'RX';

  @override
  String get telemetryTX => 'TX';

  @override
  String get telemetryHeard => 'Ouvidos';

  @override
  String get telemetryCardPrefix => 'Telemetria —';

  @override
  String get telemetryUptime => 'Uptime';

  @override
  String get telemetryTxQueue => 'Fila TX';

  @override
  String get telemetryErrorsPrefix => 'Erros:';

  @override
  String get telemetryRSSI => 'RSSI';

  @override
  String get telemetryNoise => 'Ruído';

  @override
  String get telemetrySNR => 'SNR';

  @override
  String get telemetryAirtimeTX => 'Airtime TX';

  @override
  String get telemetryAirtimeRX => 'Airtime RX';

  @override
  String get telemetryErrors => 'Erros';

  @override
  String get telemetryRXTotal => 'RX Total';

  @override
  String get telemetryTXTotal => 'TX Total';

  @override
  String get telemetryErrorsRX => 'Erros RX';

  @override
  String get telemetryFloodTX => 'Flood TX';

  @override
  String get telemetryFloodRX => 'Flood RX';

  @override
  String get telemetryDirectTX => 'Direto TX';

  @override
  String get telemetryDirectRX => 'Direto RX';

  @override
  String get eventTitle => 'Programa do Evento';

  @override
  String get eventDateLabel => 'Abril 2026';

  @override
  String get eventSummitTitle => 'Tech Summit 2026';

  @override
  String get eventSummitSubtitle => 'MeshCore Portugal';

  @override
  String get eventMorning => 'Manhã';

  @override
  String get eventAfternoon => 'Tarde';

  @override
  String get eventWorkshops => 'Workshops (sala paralela)';

  @override
  String get eventAddChannel => 'Adicionar';

  @override
  String get eventChannelSheetTitle => 'Canal MeshCore  #plano333';

  @override
  String get eventChannelSheetDesc =>
      'Adiciona o canal ao rádio conectado ou consulte os dados manualmente.';

  @override
  String eventChannelAdded(int slot) {
    return 'Canal #plano333 adicionado no slot $slot';
  }

  @override
  String get eventChannelNotFound =>
      'Canal #techsummit2026 não encontrado no rádio.';

  @override
  String get eventChannelNoSlots =>
      'Sem slots de canal disponíveis para adicionar #techsummit2026.';

  @override
  String get plan333CardTitle => 'MESH 3-3-3';

  @override
  String get plan333EventActive => '● EVENTO ATIVO';

  @override
  String get plan333PhaseCQ => 'CQ 21:00–22:00';

  @override
  String get plan333CqSent => 'CQ enviados:';

  @override
  String get plan333LastSent => '(último:';

  @override
  String get plan333EventSchedule =>
      'Sábados 21:00–22:00  •  CQ Presenças MeshCore';

  @override
  String get plan333ReportPrefix => 'Relatório em';

  @override
  String get plan333ConfigTitle => 'Configuração do Evento';

  @override
  String get plan333StationName => 'Nome de estação *';

  @override
  String get plan333StationNameHint => 'Ex: Mike 05';

  @override
  String get plan333City => 'Cidade *';

  @override
  String get plan333CityHint => 'Ex: São Paulo';

  @override
  String get plan333Locality => 'Localidade';

  @override
  String get plan333LocalityHint => 'Ex: Pinheiros';

  @override
  String get plan333AutoSend => 'Envio automático de CQ';

  @override
  String get plan333AutoSendDesc => 'CQ: até 3 mensagens (21:00–22:00)';

  @override
  String get plan333CqMessageLabel => 'Mensagem CQ:';

  @override
  String get plan333FormatTitle => 'Formatos de Mensagem';

  @override
  String get plan333FormatPresence => 'Presença (CQ)';

  @override
  String get plan333FormatPresencePhase => 'MeshCore 21:00–22:00';

  @override
  String get plan333FormatCqTemplate =>
      'CQ Plano 333, [Nome], [Cidade], [Localidade]';

  @override
  String get plan333ConfigureChannel =>
      'Configurar Canal MeshCore  (#plano333)';

  @override
  String get plan333Alerts => 'Alertas Mesh 3-3-3';

  @override
  String get plan333AlertToggle => 'Lembrete do evento de sábado';

  @override
  String get plan333AlertDesc =>
      'Alertas 10 e 5 min antes do Mesh 3-3-3 (sábados 21:00)';

  @override
  String get plan333AlertsActive => 'Alertas ativos às 20:50 e 20:55.';

  @override
  String get plan333StationsHeard => 'Estações Ouvidas';

  @override
  String get plan333ShareLog => 'Compartilhar log';

  @override
  String get plan333ClearLog => 'Limpar log';

  @override
  String get plan333NoStationsYet =>
      'Nenhuma estação ouvida ainda. Os CQs recebidos no canal aparecem aqui automaticamente.';

  @override
  String get plan333ClearQslTitle => 'Limpar log?';

  @override
  String get plan333ClearQslContent =>
      'Todas as estações registradas serão apagadas.';

  @override
  String get plan333AddQslTitle => 'Adicionar estação';

  @override
  String get plan333StationLabel => 'Estação *';

  @override
  String get plan333StationHint => 'ex: Daytona';

  @override
  String get plan333HopsLabel => 'Hops:';

  @override
  String get plan333DirectOption => 'Direto';

  @override
  String get plan333LocationLabel => 'Localização';

  @override
  String get plan333LocationHint => 'ex: Campinas';

  @override
  String get plan333NotesLabel => 'Notas (opcional)';

  @override
  String get plan333AbortAutoSend => 'Abortar envio automático';

  @override
  String get plan333AbortedMessage =>
      'Automação abortada — sem mais envios nesta sessão.';

  @override
  String plan333SendCqButton(int count) {
    return 'ENVIAR CQ  ($count/3)';
  }

  @override
  String get plan333AllSent => '✓  3 CQs enviados';

  @override
  String get plan333ConfigureFirst => 'Configure os dados primeiro';

  @override
  String get plan333RadioOff => 'Rádio desconectado — não é possível enviar';

  @override
  String get plan333ChannelSheetTitle => 'Canal MeshCore  #plano333';

  @override
  String get plan333ChannelSheetDesc =>
      'Adiciona o canal ao rádio conectado ou consulte os dados manualmente.';

  @override
  String plan333ChannelAdded(int slot) {
    return 'Canal #plano333 adicionado no slot $slot';
  }

  @override
  String get signalNone =>
      'Sem sinal (nenhum pacote recebido nos últimos 5 min)';

  @override
  String get signalWeak => 'Sinal muito fraco';

  @override
  String get signalFair => 'Sinal fraco';

  @override
  String get signalGood => 'Bom sinal';

  @override
  String get signalExcellent => 'Sinal excelente';

  @override
  String get urlOpenTitle => 'Abrir link externo?';

  @override
  String get urlOpenConfirm => 'Abrir';

  @override
  String get topologyScreenTitle => 'Topologia da Rede';

  @override
  String get topologyTabGraph => 'Grafo';

  @override
  String get topologyTabTimeline => 'Linha do Tempo';

  @override
  String get topologyEmptyTitle => 'Sem dados de topologia';

  @override
  String get topologyEmptyHint =>
      'Conecte-se a um rádio para\nvisualizar a rede';

  @override
  String get topologySelf => 'Eu';

  @override
  String get topologyResetView => 'Redefinir visualização';

  @override
  String get topologySnrGood => 'SNR ≥ 5 dB';

  @override
  String get topologySnrMid => 'SNR 0–5 dB';

  @override
  String get topologySnrBad => 'SNR < 0 dB';

  @override
  String get topologyLabelId => 'ID';

  @override
  String get topologyLabelPath => 'Caminho';

  @override
  String get topologyLabelSeen => 'Visto';

  @override
  String topologySecondsAgo(int s) {
    return 'há ${s}s';
  }

  @override
  String topologyMinutesAgo(int min) {
    return 'há ${min}min';
  }

  @override
  String topologyHoursAgo(int h) {
    return 'há ${h}h';
  }

  @override
  String topologyDaysAgo(int d) {
    return 'há ${d}d';
  }

  @override
  String topologyWeeksAgo(int w) {
    return 'há $w sem.';
  }

  @override
  String get topologyFilterRecent => 'Mostrar apenas contatos no rádio';

  @override
  String get topologyFilterAll => 'Mostrar todos (incl. locais)';

  @override
  String get topologyToggleLabels => 'Mostrar/ocultar etiquetas';

  @override
  String topologyNodesShown(int shown, int total) {
    return '$shown/$total nós';
  }

  @override
  String get topologyHopDirect => 'Direto';

  @override
  String get topologyHop1 => '1 salto';

  @override
  String get topologyHop2 => '2 saltos';

  @override
  String get topologyHopFlood => 'Flood / 3+';

  @override
  String get topologyTabPaths => 'Caminhos';

  @override
  String get topologyPathsEmptyTitle => 'Sem dados de rota';

  @override
  String get topologyPathsEmptyHint =>
      'Faça um trace a partir de um\ncontato para ver o caminho';

  @override
  String topologyPathsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n caminhos',
      one: '1 caminho',
    );
    return '$_temp0';
  }

  @override
  String get repeaterTitle => 'Gerenciar Repetidor';

  @override
  String get repeaterConfig => 'Configuração Remota';

  @override
  String get repeaterApply => 'Aplicar';

  @override
  String get repeaterNodeName => 'Nome do nó';

  @override
  String get repeaterTxPower => 'Potência TX';

  @override
  String get repeaterForwarding => 'Repetição de pacotes';

  @override
  String get repeaterForwardingDesc =>
      'Ativa ou desativa o encaminhamento de pacotes';

  @override
  String get repeaterAdvertInterval => 'Intervalo de anúncio local';

  @override
  String get repeaterAdvertZeroHop => 'Anúncio Automático (Zero Hop)';

  @override
  String get repeaterAdvertFlood => 'Anúncio Automático (Flood)';

  @override
  String get repeaterIntervalMinutes => 'Intervalo (minutos)';

  @override
  String get repeaterIntervalHours => 'Intervalo (horas)';

  @override
  String get repeaterMinimalTrafficHint =>
      'Para usar tráfego mínimo na rede, use os ícones de atualizar para pedir apenas a informação que você precisa.';

  @override
  String get repeaterValueNotLoaded => '—';

  @override
  String get repeaterFloodMax => 'Flood máximo (saltos)';

  @override
  String get repeaterClearStats => 'Limpar Estatísticas';

  @override
  String get repeaterClearStatsDesc => 'Reinicia contadores de pacotes e erros';

  @override
  String get repeaterNoStats =>
      'Autentique-se e toque em \"Atualizar\" para obter as estatísticas.';

  @override
  String get repeaterFetchStats => 'Atualizar';

  @override
  String get repeaterAuthenticated => 'Autenticado';

  @override
  String get repeaterTabStatus => 'Status';

  @override
  String get repeaterTabCommandLine => 'Linha de comandos';

  @override
  String get repeaterTabSettings => 'Configurações';

  @override
  String get repeaterCmdHint => 'Enviar um comando...';

  @override
  String get repeaterCmdEmpty =>
      'Nenhum comando enviado. Use o campo abaixo para enviar comandos CLI diretamente.';

  @override
  String get repeaterCmdClear => 'Limpar histórico';

  @override
  String get repeaterMenuHelp => 'Ajuda de Comandos';

  @override
  String get repeaterMenuClearHistory => 'Excluir Histórico de Comandos';

  @override
  String get repeaterHelpTitle => 'Ajuda';

  @override
  String get repeaterHelpSubtitle => 'Comandos do Repetidor';

  @override
  String get repeaterHelpFirmwareNote =>
      'Alguns comandos exigem firmware recente.';

  @override
  String get repeaterHelpSearchHint => 'Pesquisar';

  @override
  String get dataExportTitle => 'Exportar Dados';

  @override
  String get dataExportContactsTitle => 'Contatos';

  @override
  String dataExportContactsDesc(int count) {
    return '$count contatos salvos';
  }

  @override
  String get dataExportMessagesTitle => 'Mensagens';

  @override
  String get dataExportMessagesDesc => 'Todas as conversas — privadas e canais';

  @override
  String get dataExportKmlTitle => 'Dados de Mapa';

  @override
  String dataExportKmlDesc(int count) {
    return '$count contatos com GPS';
  }

  @override
  String get dataExportNote =>
      'Os arquivos são exportados diretamente para o menu de compartilhamento.\nNenhum dado sai do dispositivo sem a sua confirmação.';

  @override
  String get dataExportNoContacts => 'Sem contatos para exportar';

  @override
  String get dataExportNoMessages => 'Sem mensagens para exportar';

  @override
  String get dataExportNoGps => 'Sem contatos com coordenadas GPS';

  @override
  String get dataExportFailed => 'Falha na exportação';

  @override
  String get appsDataExportTitle => 'Exportar Dados';

  @override
  String get appsDataExportSubtitle =>
      'Exporta contatos, mensagens e dados de mapa';
}
