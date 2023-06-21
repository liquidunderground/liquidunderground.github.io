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

Liquid Underground is built on it's community and as such, we welcome any
SRB2 or Liquid-related article you wish to publish here. However, to keep
things running smoothly, here's some tips on getting your article onto our
website:

### Forks, Submissions and Pull Requests

It's best to fork this repository for creating your article. After you're
done, add it to `contrib/` and file a pull request for it to be evaluated. 
For security and auditing purposes, we only accept pull requests that are
being merged into `dev`. **DO NOT ATTEMPT TO MERGE AGAINST `main`**

Once you file your pull request, make sure we can verify your affiliation
and/or membership relating to LqU.  This blog is an outlet for official
Liquid Underground-related media and as such, we will freely represent our
community, however we will not accept to host content defined by
potentially malicious outside sources.

### Filenames and Editing

For keeping things in chronological order, your article's filename shall
begin with the date of first creation in [ISO8601] syntax, for example:

```
<YYYY-MM-DD>_<TITLE>.md
```

[ISO8601]: <https://en.wikipedia.org/w/index.php?title=ISO_8601&oldid=1160073691>

Please keep in mind that you are not the only one filing a pull request to
get your article published. Please don't try to be smart by submitting
ready-made content that's been run through the entire production pipeline
by you. Publish only the newly added article in raw Markdown form (+all
necessary assets) within your pull request and let Liquid's site
administrators handle the heavy lifting.

We also expect you to have quality controlled your article. Things such as
missing or broken links, commits containing unrelated data and other
content that doesn't match our quality criteria will not be accepted.


### Quality of Content

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

**Keep your style civil and professional:** Opinion pieces and even columns
are fine, but make sure to present such content in a manner that makes it
clear that you are merely expressing your own personal viewpoint. Also be
aware that with any piece you publish, you represent our community to the
outside world.


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

