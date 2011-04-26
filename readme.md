# Casper Server

(In Development Mode)

# What is this?

Casper Server is a Sinatra Web Server that provides an interface to the Casper Reports
library.

With this server you can send a jrxml template, a xml document and a xpath string.

# Install Gem

```
gem install casper_server
```

# Requirements

* Java
* JRuby
* Rack
* RVM

# How do I create a Casper Server?

```
casper-server [name]
```

# How do I run the Casper Server?

```
cd [name]
rackup
```

---

API

```
POST / {content-type:application/json}
#body=>
{ 
  "casper": 
  {
    "jrxml": <base64 encoded jrxml document>,
    "data": <base64 encoded xml document>,
    "xpath": <xpath query string>
  }
}
```

(XML VERSION CURRENTLY NOT WORKING!!!)
```
POST / {content-type:application/xml}
#body=>
<casper>
  <jrxml><![CDATA[{insert jrxml document here}]]></jrxml>
  <data><![CDATA[{insert xml document here}]]></data>
  <xpath><![CDATA[{insert xpath string here}]]></xpath>
</casper>

#RESPONSE=>
<pdf>
  <base64><![CDATA[{base64encoded pdf string}]]></base64>
<pdf>
  
---

TEST

```
GET /
```

On the web page you will be presented with three inputs and a process button.

The first input will be requesting the jrxml file
The second input will be requesting the xml document
The third input will be requesting xpath query string

Click Generate Report, and a pdf should stream to your browser.




