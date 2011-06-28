require 'spec_helper'

describe CasperReports do

  it 'compiles jasper report' do
    jrxml = open(File.join(File.dirname(__FILE__), 'data','testreport.jrxml')).read
    xmldata = open(File.join(File.dirname(__FILE__), 'data','patients.xml')).read
    #open('test.pdf', 'wb').write subject.compile(jrxml, xmldata, '//patient')
    subject.compile(jrxml, xmldata, '//patient').length.should > 1000
  end
end
