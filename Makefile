default: slides.html

vpath reveal.js $(HOME) .

REVEALJS_URL=https://unpkg.com/reveal.js@4.3.1

slides.html: _build/slides.md reveal.js theme.css Agda.css Makefile
	pandoc -t revealjs -V revealjs-url=$(REVEALJS_URL) --css=Agda.css --css=theme.css -V transition="linear" -V controls="false" -V center="false" --mathjax -s $< -o $@

_build/slides.md: slides.lagda.md
	agda-2.6.3 --html --html-dir=_build --html-highlight=auto $<

_build/Agda.css: _build/slides.md

Agda.css: _build/Agda.css
	cp _build/Agda.css Agda.css

./reveal.js:
	git clone https://github.com/hakimel/reveal.js
