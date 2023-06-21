HTTP_BASE := http://liquidunderground.github.io

rss_template := templates/template.rss
html_template := templates/template.html
template_config := templates/template.yaml

args_pandoc_html := -s --template $(html_template) -t html5

.PHONY: all html clean clean_rss clean_html

all: all_html feed.rss
clean: clean_rss clean_html
clean_rss:
	-rm -r out_rss feed.rss
clean_html:
	-rm -r blog/ ./*.html
all_html: $(shell ls globalpages/*.md md/*.md | sed "s/md/html/g" | sed "s/globalpages\///" | sed "s/^html/blog/") | 

out_rss: 
	-mkdir $@
blog: 
	-mkdir $@
globalpages: 
	-mkdir $@

blog/%.html: md/%.md templates/template.html | blog
	pandoc $< $(args_pandoc_html) -o $@ 

# Index page, basically
%.html: globalpages/%.md templates/template.html | globalpages
	pandoc $< $(args_pandoc_html) -o $@ 

out_rss/%.rss: md/%.md templates/article.template.rss | out_rss
	echo -e "---\nbaselink: ${HTTP_BASE}$*.html\nlink: ${HTTP_BASE}/blog/$*.html\n...\n" | \
	pandoc - $< -f markdown --template templates/article.template.rss -t html -o $@ 

feed.rss: $(shell ls md/*.md | sed "s/md/rss/g" | sed "s/^/out_/") templates/template.rss
	pandoc $(template_config) out_rss/*.rss --template ./templates/template.rss -t html -o $@ 

