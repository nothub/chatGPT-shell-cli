NIXPKGS := https://github.com/NixOS/nixpkgs/archive/2de8efefb6ce7f5e4e75bdf57376a96555986841.tar.gz

.PHONY: check
check:
	nix-shell --pure -I nixpkgs=$(NIXPKGS) -p "shellcheck" --run "shellcheck chatgpt.sh"

.PHONY: install
install: check
	sudo install --group "root:root" --mode "+x" chatgpt.sh /usr/local/bin/chatgpt
