
	INSTALL_DIR = /usr/bin/

all : 


install :
	@mkdir -p $(DESTDIR)$(INSTALL_DIR)/
	cp ./pajackconnect $(DESTDIR)$(INSTALL_DIR)/pajackconnect
	cp ./resume-fix-pulseaudio.service $(DESTDIR)/etc/systemd/system/resume-fix-pulseaudio.service
	@echo ". ." $(BLUE)", done"$(NONE)
