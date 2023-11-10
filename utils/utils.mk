RSYNC=rsync --verbose --recursive --human-readable --progress

UTILS_CONFIGS=utils/configs

WHIPTAIL_REDIRECT_STDERR=2>&1 1>/dev/tty
NEWT_COLOR_PALETTE_DIALOGS="$(shell cat $(UTILS_CONFIGS)/whiptail-theme-green.cfg)"
WHIPTAIL_COLORED=export NEWT_COLORS=$(NEWT_COLOR_PALETTE_DIALOGS); whiptail

WHIPTAIL_CONFIRM_ACTION = $(WHIPTAIL_COLORED) \
													--yesno "$${WHIPTAIL_DESCRIPTION}" 15 100 \
													--yes-button "Confirmar" \
													--no-button "Cancelar" \

WHIPTAIL_CONFIRM_COPY_ACTION = $(WHIPTAIL_CONFIRM_ACTION) --title "Copiar archivos" \
															$(WHIPTAIL_REDIRECT_STDERR); \
															[ $(CHECK_EXIT_STATUS) ]
