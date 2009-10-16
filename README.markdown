# markup

Markup is a small (ie tiny) command line tool for converting Markdown to HTML.

## Installation

	$ sudo gem install markup --source http://gemcutter.org

## Usages

	$ cd ~/projects/markup && ls
	$ LICENSE  README.markdown  Rakefile  VERSION  bin  lib  markup.gemspec  test
	$ markup README.markdown
	Created README.html
	$ cat README.html
	<h1>markup</h1>
	
	<p>Markup is a small.... etc
	
By default markup outputs to {sourcefile_name}.html, but you can specify a different filename using the -o option:

	$ markup README.markdown -o instructions.html
	
Overwrite existing output using the -F option (this will clobber existing files so be careful):

	$ markup README.markdown -F

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 James Wilding. See LICENSE for details.
