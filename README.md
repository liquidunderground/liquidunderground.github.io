Liquid Underground Blog
=======================

This is the editorial repository for <https://liquidunderground.github.io>.
It provides a static site generator based on [Pandoc] with batteries
included. This means all generated HTML pages are fully standalone and can
thus be tested and verified with any regular web browser.

Our Makefile provides a mechanism to generate Blog articles, an
eye-catching index page as well as an RSS feed to relay updates to the
Liquid Underground community.


How to contribute
-----------------

Fork this repository and add your own Markdown articles to `contrib/`
before filing a pull request.  
For sorting purposes, your article's filename shall begin with the date of
first creation in [ISO8601] syntax, for example

```
<YYYY-MM-DD>_<TITLE>.md
```

[ISO8601]: <https://en.wikipedia.org/w/index.php?title=ISO_8601&oldid=1160073691>

The Date of creation is to be specified in [ISO8601] syntaxt, for example

Articles are written in [Pandoc-style Markdown], with at least the
following fields in it's front matter (the beginning of the file):

```YAML
---
title: Never bring a gun to a Battlemod match
author: Fang "sniperwolf" the Sniper
pubdate: 2021-08-27 
...
```

[Pandoc-style Markdown]: <https://boisgera.github.io/pandoc/markdown/>


Installation
------------

This generator requires [Pandoc] to be installed on your system. To use it,
simply type:

```
[user@unix /path/to/here]$ make
```

[Pandoc]: <https://pandoc.org/>

You can also generate parts of the blog using the following Make targets:

- `$ make`/`$ make all`: Create everything
- `$ make rss`: Build RSS feed
- `$ make index`
- `$ make template`

### Repository structure

Here's a quick explanation of what you're meant to change in this
repository and what will be handled by Pandoc:

- `blog/`: HTML blog articles created by Pandoc
- `blog.html`: Auto-generated list of articles.
- `contrib/`: User-submitted manuscripts to be audited.
- `css/`: CSS stylesheets used by the template
- `index.html`: HTML index page created by Pandoc
- `index.md`: Index page manuscript.
- `globalpages/`: Markdown manuscripts for non-blog sites
- `md/`: Blog article manuscripts.
- `out_rss/`: Temporary directory for individual RSS items. May need to be created manually.
- `templates/`: Pandoc templates for generating content
- `templates/template.html`: Pandoc templates for generating content
- `templates/article.template.rss`: RSS template for individual articles.
   Needed for temporary files in a two-step generation process.
- `templates/template.rss`: Global RSS template. Generates the channel.
- `templates/template.yaml`: Global template config, independent of articles

