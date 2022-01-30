JSTL XML tags
The JSTL XML tags are used for providing a JSP-centric way of manipulating and creating XML documents.

The xml tags provide flow control, transformation etc. The url for the xml tags is http://java.sun.com/jsp/jstl/xml and prefix is x.
The JSTL XML tag library has custom tags used for interacting with XML data. The syntax used for including JSTL XML tags library in your JSP is:

<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

#1.JSTL XML <x:out> Tag
    The <x:out> tag is used for displaying the result of an xml Path expression and writes the result to JSP writer object.
        It is similar to the scriptlet tag <%= %> used in JSP.

        The syntax used for including the <x:out> tag is:

            <x:out attributes/>
 Example:=
            <h2>Vegetable Information:</h2>
            <c:set var="vegetable">
                <vegetables>
                    <vegetable>
                        <name>onion</name>
                        <price>40/kg</price>
                    </vegetable>
                    <vegetable>
                        <name>Potato</name>
                        <price>30/kg</price>
                    </vegetable>
                    <vegetable>
                        <name>Tomato</name>
                        <price>90/kg</price>
                    </vegetable>
                </vegetables>
            </c:set>
            <x:parse xml="${vegetable}" var="output"/>
            <b>Name of the vegetable is</b>:
            <x:out select="$output/vegetables/vegetable[1]/name" /><br>
            <b>Price of the Potato is</b>:
            <x:out select="$output/vegetables/vegetable[2]/price" />
 #2.JSTL XML <x:parse> Tag
                The <x:parse> tag is used for parse the XML data specified either in the tag body or an attribute.
                    It is used for parse the xml content and the result will stored inside specified variable.

                    The syntax used for including the <x:parse> tag is:

                        <x:parse attributes> body content </x:parse>
 EXAMPLE:=
                        <c:import var="bookInfo" url="file:///E:/All%20Projects/spring%20projects/sec/firstproject/src/book.xml"/>

                        <x:parse xml="${bookInfo}" var="output"/>
                        <p>First Book title: <x:out select="$output/books/book[1]/name" /></p>
                        <p>First Book price: <x:out select="$output/books/book[1]/price" /></p>
                        <p>Second Book title: <x:out select="$output/books/book[2]/name" /></p>
                        <p>Second Book price: <x:out select="$output/books/book[2]/price" /></p>
 #3.JSTL XML <x:set> Tag
 The <x:set> tag is used to set a variable with the value of an XPath expression.
It is used to store the result of xml path expression in a scoped variable.

                                The syntax used for including the <x:set> tag is:

                                    <x:set attributes/>
EXAMPLE:=
                                    <h3>Books Information:</h3>
                                    <c:set var="book">
                                        <books>
                                            <book>
                                                <name>Three mistakes of my life</name>
                                                <author>Cheetah Parker</author>
                                                <price>200</price>
                                            </book>
                                            <book>
                                                <name>Tomorrow land</name>
                                                <author>Brad Pitt</author>
                                                <price>2000</price>
                                            </book>
                                        </books>
                                    </c:set>
                                    <x:parse xml="${book}" var="output"/>
                                    <x:set var="fragment" select="$output/books/book[2]/price"/>
                                    <b>The price of the Tomorrow land book</b>:
                                    <x:out select="$fragment" />
 #4.JSTL XML <x:choose>, <x:when>, <x:otherwise> Tags
 The <x:choose> tag is a conditional tag that establish a context for mutually exclusive conditional operations.
  It works like a Java switch statement in which we choose between a numbers of alternatives.

The <x:when> is subtag of <x:choose> that will include its body if the condition evaluated be 'true'.

 The <x:otherwise> is also subtag of <x:choose> it follows <x:when> tags and runs only if all the prior condition evaluated is 'false'.

The <x:when> and <x:otherwise> works like if-else statement. But it must be placed inside <x:choose> tag.


The syntax used for including the <x:choose;> tag is:

<x:choose> body content </x:choose>
The syntax used for including the <x:when> tag is:

<x:when attribute> body content </x:when>
The syntax used for including the < x:otherwise > tag is:

 <x:otherwise> body content </x:otherwise>

                                                            <h3>Books Information:</h3>

                                                            <c:set var="xmltext">
                                                                <books>
                                                                    <book>
                                                                        <name>Three mistakes of my life</name>
                                                                        <author>Cheetah Parker</author>
                                                                        <price>200</price>
                                                                    </book>
                                                                    <book>
                                                                        <name>Tomorrow land</name>
                                                                        <author>Brad Pitt</author>
                                                                        <price>2000</price>
                                                                    </book>
                                                                </books>
                                                            </c:set>

                                                            <x:parse xml="${xmltext}" var="output"/>
                                                            <x:choose>
                                                                <x:when select="$output//book/author = 'Cheetah Parker'">
                                                                    Book is written by Chetan bhagat
                                                                </x:when>
                                                                <x:when select="$output//book/author = 'Brad Pitt'">
                                                                    Book is written by Brad Bird
                                                                </x:when>
                                                                <x:otherwise>
                                                                    The author is unknown...
                                                                </x:otherwise>
                                                            </x:choose>
#5.JSTL XML <x:if> Tag
 The <x:if> tag is used for evaluating the test XPath expression.
 It is a simple conditional tag which is used for evaluating its body if the supplied condition is true.

 The syntax used for including the <x:if> tag is:

                <x:if attributes> body content </x:if>
   EXAMPLE:=
                                                                        <h2>Vegetable Information:</h2>
                                                                        <c:set var="vegetables">
                                                                            <vegetables>
                                                                                <vegetable>
                                                                                    <name>onion</name>
                                                                                    <price>40</price>
                                                                                </vegetable>
                                                                                <vegetable>
                                                                                    <name>Potato</name>
                                                                                    <price>30</price>
                                                                                </vegetable>
                                                                                <vegetable>
                                                                                    <name>Tomato</name>
                                                                                    <price>90</price>
                                                                                </vegetable>
                                                                            </vegetables>
                                                                        </c:set>
                                                                        <x:parse xml="${vegetables}" var="output"/>
                                                                        <x:if select="$output/vegetables/vegetable/price < 100">
                                                                            Vegetables prices are very low.
                                                                        </x:if>

#6.JSTL XML <x:transform> Tag
 The <x:transform> tag is used in a XML document for providing the XSL (Extensible Stylesheet Language) transformation.
It is used for transforming xml data based on XSLT script.

The syntax used for including the <x:transform> tag is:

   <x:transform attributes> body content </x:transform>
   EXAMPLE:=

         <c:import var="xml" url="file:///E:/All%20Projects/spring%20projects/sec/firstproject/src/transfer.xml" />
         <c:import var="xsl" url="file:///E:/All%20Projects/spring%20projects/sec/firstproject/src/transfer.xsl" />
         <x:transform xml="${xml}" xslt="${xsl}" />

#7.JSTL XML <x:param> Tag
The <x:param> tag is used to set the parameter in the XSLT style sheet.
 It use along with the transform tag for sending parameter along with the value.

The syntax used for including the < x:param > tag is:

    <x:param name="name" value="value"></x:param>

 EXAMPLE:=
                                                                                            <h3>Novels Information:</h3>
                                                                                            <c:set var="xmltext">
                                                                                                <books>
                                                                                                    <book>
                                                                                                        <name>Three mistakes of my life</name>
                                                                                                        <author>Cheetah Parker</author>
                                                                                                        <price>200</price>
                                                                                                    </book>
                                                                                                    <book>
                                                                                                        <name>Tomorrow land</name>
                                                                                                        <author>Brad Pitt</author>
                                                                                                        <price>1000</price>
                                                                                                    </book>
                                                                                                    <book>
                                                                                                        <name>Wings of fire</name>
                                                                                                        <author>Dr.Octupus</author>
                                                                                                        <price>500</price>
                                                                                                    </book>
                                                                                                </books>
                                                                                            </c:set>

                                                                                            <c:import url="file:///E:/All%20Projects/spring%20projects/sec/firstproject/src/transfer.xsl" var="xslt"/>
                                                                                            <x:transform xml="${xmltext}" xslt="${xslt}">
                                                                                                <x:param name="bgColor" value="yellow"/>
                                                                                            </x:transform>