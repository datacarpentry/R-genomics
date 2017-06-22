# RMarkdown files
RMD_SRC = $(wildcard *.Rmd)
RMD_DST = $(patsubst %.Rmd,%.md,$(RMD_SRC))

all: pages

skeleton-%.R: %.Rmd _site.yml
	Rscript -e "knitr::purl('$<', output='$@', documentation=0L)"

%.html: %.Rmd _site.yml footer.html
	Rscript -e "rmarkdown::render_site(input='$<')"

%.html: %.md
	Rscript -e "rmarkdown::render_site(input='$<')"

#code-handout.R: skeleton-00-before-we-start.R skeleton-01-intro-to-r.R skeleton-02-starting-with-data.R skeleton-03-dplyr.R skeleton-04-visualization-ggplot2.R skeleton-05-r-and-databases.R
#	for f in $^; do cat $$f; echo "\n"; done > $@
#	make clean-skeleton

pages: 00-before-we-start.html 01-intro-to-R.html 02-starting-with-data.html index.html LICENSE.html CONTRIBUTING.html CONDUCT.html 03-data-frames.html 04-dplyr.html 05-data-visualization.html

	make clean-md

check-spelling:
	Rscript -e "source('check-spelling.R')"

clean-skeleton:
	-rm skeleton-*-*.R

clean-md:
	@rm -rf ${RMD_DST}

clean-html:
	-rm *-*.html

clean-img:
	@find . -path './img/R-genomics-*.png' -exec rm {} \;

clean: clean-skeleton clean-html clean-md clean-img

clean-data:
	-rm -rf data
