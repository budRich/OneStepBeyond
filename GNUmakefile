.Phony: all clean check install uninstall

.ONESHELL:

SHELL  := /bin/bash
NAME   := OneStepBeyond

ifdef PREFIX
  SHARE_DIR := $(PREFIX)/share/themes
else
  SHARE_DIR := $(HOME)/.themes
endif

install_at := $(DESTDIR)$(SHARE_DIR)/$(NAME)

sass_files     := $(wildcard src/sass/*.scss)
gtk3_css       := theme/gtk-3.0/gtk.css

theme_files    := theme/gtk-2.0/gtkrc   \
                  theme/gtk-4.0/gtk.css \
                  theme/index.theme     \
                  $(gtk3_css)           \
                  $(wildcard theme/img/*)

installed_files = $(patsubst theme/%,$(install_at)/%,$(theme_files))

all: $(gtk3_css)

$(gtk3_css): $(sass_files)
	sassc --style expanded src/sass/main.scss > $@
	cp -f $@ src/gtk.css

clean:
	rm -f $(gtk3_css)

$(installed_files): $(install_at)/%: theme/% | $(DESTDIR)$(SHARE_DIR)/
	install -D -m644 $< $@

install: all $(installed_files)

uninstall:
	rm -rf $(install_at)

# watch, restore and reload only works if xfconfd is running
# and theme/gtk-3.0/css.gtk is "active" (install-dev)
.Phony: watch restore reload install-dev uninstall-dev

uninstall-dev: uninstall

install-dev: $(DESTDIR)$(SHARE_DIR)/
	ln -fs "$(shell realpath theme)" "$(install_at)"

$(DESTDIR)$(SHARE_DIR)/:
	mkdir -p $@

watch:
	@while read -r ; do
	  $(MAKE) $(gtk3_css)
	  $(reload_theme)
	done < <(inotifywait -e close_write -m $(sass_files))

restore:
	cp -f src/OneStepBack.css $(gtk3_css)
	$(reload_theme)

reload:
	$(reload_theme)
	
define reload_theme =
	xfconf-query --create -c xsettings -p /Net/ThemeName -t string -s Adwaita
	xfconf-query --create -c xsettings -p /Net/ThemeName -t string -s $(NAME)
endef
