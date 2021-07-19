build:
	pandoc -f vimwiki -t markdown cmdline_notes.wiki -o README.md

build_pdf:
	pandoc -f vimwiki -t pdf cmdline_notes.wiki -o cmdlines_notes.pdf
