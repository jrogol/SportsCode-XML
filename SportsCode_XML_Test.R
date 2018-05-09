library(xml2)
library(dplyr)

tl <- read_xml("Desktop/SportsCode-XML/U19WNT v CHN U19 170912 DB.TLcodes")
tl

html_structure(tl[1)

xml <- read_html("Desktop/SportsCode-XML/XML Edit list.xml")


instances <- xml_find_all(xml,".//instance")
html_structure(instances[1])

xml_children(instances[2])
xml_attrs(instances[1], "code")


x <- read_xml("<root id='1'><child id ='a' /><child id='b' d='b'/></root>")
xml_attr(x, "id")
xml_attr(x, "apple")
xml_attrs(x)

kids <- xml_children(x)
kids
xml_attr(kids, "id")
xml_has_attr(kids, "id")
xml_attrs(kids)
