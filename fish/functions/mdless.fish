function mdless
	pandoc -s -f markdown -t man $argv[1] | man -l -
end
