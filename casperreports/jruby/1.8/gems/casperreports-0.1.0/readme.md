# CasperReports

V 0.1.0

Casper wraps a jRuby sheet over the jasper reporting engineto make it
more ruby friendly.  Just like your friendly ghost :-)


# Requirements

This gem requires jruby > 1.6.0

# Install

``` ruby
gem install casperreports
```

# Input Paramters

* JasperReport Template or jrxml file (String of XML)
* Xml Data (String of XML)
* XPath Selection (String)
* Type ('pdf','xls')

# How does it work?

Casper will use the JasperReports library to take the two xml documents
along with the filter string to build a jasper report return the report
as a pdf or xls, based on the type parameter.

# Output

A pdf document in string of bytes

# Usage Examples

``` ruby

require 'casper_reports'

movie_jrxml = open('moviereport.jrxml').read
movies = open('movies.xml').read

pdf_string = Casper.new.compile(movie_jrxml, movies, '//movie')
open('movie.pdf', 'wb').write(pdf_string)

```
