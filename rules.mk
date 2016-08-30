#
# rules.mk
# This file is part of slide-switch.
#
# Copyright (C) 2016 Jeffery To
# https://github.com/jefferyto/openwrt-slide-switch
#
# slide-switch is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 2 as published by the Free Software Foundation.
#
# slide-switch is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with slide-switch.  If not, see <http://www.gnu.org/licenses/>.
#

SUFFIXES: .json .json-cut .sh .sh-cut

.json-cut.json:
	$(AWK) 'p; /--8<----/ {p=1}' $< > $@

.sh-cut.sh:
	$(AWK) 'p; /--8<----/ {p=1}' $< > $@

CLEANFILES = $(UNSUFFIX) $(UNSUFFIX:=.sh)

$(UNSUFFIX): $(UNSUFFIX:=.sh)
	cp $(UNSUFFIX:=.sh) $(UNSUFFIX)