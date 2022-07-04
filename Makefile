#/usr/bin/make

# TODO: Apologize for crude makefile

# https://www.gnu.org/prep/standards/standards.html
prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin# Binaries/runnables go here
sysconfdir = $(prefix)/etc# Configuration go here.

# Custom

sudoersdir = /etc/sudoers.d

# Build dirs
builddir = build
buildbindir = $(builddir)/bin
buildconfdir = $(builddir)/conf
# Source codes
src_bash = $(wildcard bin/odoo*)
basenames_bash = $(notdir $(src_bash))
# "Compiled" targets
bin_bash = $(addprefix $(buildbindir)/,$(basenames_bash))
bin_conf = $(buildconfdir)/odoo.tools

#src_bash_autocomplete = $(wildcard bashcompletions/odoo*)

# Find and replace variables
odoouser = odoo
odootoolconfdir = $(sysconfdir)/odoo
odootoolconf = $(odootoolconfdir)/odoo.tools

# Section 1 - Normal targets
.PHONY: all
all: $(bin_bash) $(bin_conf)
	@echo "Building:" $^

.PHONY: clean
clean:
	rm -rf build/*

.PHONY: install
install: install_bin install_conf

.PHONY: uninstall
uninstall: uninstall_bin uninstall_conf

.PHONY: install_bin
install_bin: $(bin_bash)
	mkdir -p $(DESTDIR)$(bindir)
	install -m 755 $(buildbindir)/* $(DESTDIR)$(bindir)

.PHONY: uninstall_bins
rm_bins = $(addprefix $(DESTDIR)$(bindir)/,$(basenames_bash))
uninstall_bins:
	echo $(rm_bins)
	rm $(rm_bins)
#	find $(DESTDIR) -type d -empty -delete # What if required empty folders are present?

.PHONY: install_conf
install_conf: $(bin_conf)
	mkdir -p $(DESTDIR)$(odootoolconfdir)
	install -m 644 $(buildconfdir)/* $(DESTDIR)$(odootoolconfdir)

.PHONY: uninstall_conf
uninstall_conf:
	rm $(DESTDIR)$(odootoolconf)

# Actual

# Configure and build all odoo*-commands
$(buildbindir)/odoo%: bin/odoo%
	mkdir -p $(buildbindir)
	@cp $< $@
	@sed -i "s|_ODOOTOOLS_CONF|$(odootoolconf)|g" $@
	@sed -i "s|_ODOO_USER|$(odoouser)|g" $@
# Configure conf
$(buildconfdir)/odoo%: conf/odoo%
	mkdir -p $(buildconfdir)
	@cp $< $@
	@sed -i "s|_ODOOTOOLS_CONF|$(odootoolconf)|g" $@
	@sed -i "s|_ODOO_USER|$(odoouser)|g" $@

.PHONY: mtest
mtest:
	@echo $(basenames_bash)
	@echo $(bin_bash)
	@echo $(src_bash)
	@echo $(addprefix $(DESTDIR)$(bindir)/,$(basenames_bash))


#.PHONY: all clean install
