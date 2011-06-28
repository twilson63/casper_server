# Welcome to Casper
# The friendly cousin of Jasper Reports

# Casper allows you to generate a pdf from a jrxml file, xml data, and a xpath selector

# The compile statement return a string of bytes that can be streammed to file or to
# a browser.

# Example:
#
#  c = Casper.new
#  pdf_data = c.compile open('text.jrxml'), open('data.xml'), '//node', 'pdf'
#  open('mypdf.pdf', 'wb').write pdf_data

# Requirements
# This Gem requires jruby > 1.6.0
require 'java'
# Load Jar and Java Classes
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'poi-3.6.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'commons-digester-1.7.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'commons-logging-1.1.1.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'commons-collections-2.1.1.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'commons-beanutils-1.8.0.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'groovy-all-1.7.5.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'xalan-2.7.1.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'lib', 'itext-2.1.7.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include', 'dist', 'jasperreports-4.0.1.jar')
$CLASSPATH << File.join(File.dirname(__FILE__), '..', 'include')

# Provide a simple class interface to running a jasper report
class CasperReports
  VERSION = '0.1.0'

  def compile(jrxml, data, xpath, type='pdf')
    String.from_java_bytes(Java::XmlDataReportProducer.compile(jrxml, data, xpath, type))
  end

end
