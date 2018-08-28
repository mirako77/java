﻿<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:WX="http://schemas.microsoft.com/office/word/2003/auxHint"
    xmlns:aml="http://schemas.microsoft.com/aml/2001/core"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
	xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"
	xmlns:java="http://xml.apache.org/xalan/java"
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
	xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
	xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
	xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
	xmlns:c="http://schemas.openxmlformats.org/drawingml/2006/chart"
	xmlns:dgm="http://schemas.openxmlformats.org/drawingml/2006/diagram"
    version="1.0"
        exclude-result-prefixes="java w a o v WX aml w10 pkg wp pic">

<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes" indent="no"  />

<!-- I want to use method="xml" to minimise encoding that Xalan does.

     But output type xml of

			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" ></meta>

		<script type="text/javascript" src="/ckeditor/ckeditor.js">
			// b
		</script>

	confuses the browser, since that is sent as
				 	<script type="text/javascript" src="/ckeditor/ckeditor.js"/>
				 	which causes the following script to be ignored!

	I can't use
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"

	since then Chrome doesn't display iframe full height, and FF 3.5 doesn't load JS!

	Solution is to use:

		<xsl:text disable-output-escaping="yes">
			&lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >&lt;/meta>
		</xsl:text>

    (rather than
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > //a </meta>
			which displays the characters)

 -->
<xsl:param name="ContextPath" /> <!-- passed in eg /docx4j-web-editor-->
<xsl:param name="HttpServletResponse"/> <!-- select="'passed in'"-->

<xsl:param name="conversionContext"/> <!-- select="'passed in'"-->



<xsl:template match="/w:document">

	<xsl:variable name="dummy"
		select="java:org.docx4j.convert.out.common.XsltCommonFunctions.logInfo($conversionContext, '/pkg:package')" />
	<xsl:variable name="dummy2"
		select="java:org.docx4j.convert.out.common.XsltCommonFunctions.moveNextSection($conversionContext)" />

	<xsl:variable name="cssURL"><xsl:value-of select="$ContextPath"/>/services/css/docx.css</xsl:variable>
	<xsl:variable name="cssURLEncoded"><xsl:value-of select="java:org.plutext.htmleditor.Editor.encodeURL($HttpServletResponse, $cssURL)"/></xsl:variable>

	<xsl:variable name="filebrowserImageBrowseUrl"><xsl:value-of select="$ContextPath"/>/services/images/</xsl:variable>
	<xsl:variable name="filebrowserImageUploadUrl"><xsl:value-of select="$ContextPath"/>/services/image/</xsl:variable>

	<xsl:variable name="saveURL"><xsl:value-of select="$ContextPath"/>/services/save</xsl:variable>
	<xsl:variable name="saveURLEncoded"><xsl:value-of select="java:org.plutext.htmleditor.Editor.encodeURL($HttpServletResponse, $saveURL)"/></xsl:variable>

	<html>
      <head>

		<xsl:text disable-output-escaping="yes">
			&lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >&lt;/meta>
		</xsl:text>

		<!--  using our SessionStyleHandler -->
		<xsl:variable name="dummyCSS" select="java:org.docx4j.convert.out.html.XsltHTMLFunctions.appendStyleElement($conversionContext)" />
		<link href="{$cssURLEncoded}" rel="stylesheet" type="text/css"/>

		<script type="text/javascript" src="{$ContextPath}/ckeditor/ckeditor.js">
			// b
		</script>

		<script type="text/javascript">

			onload = function()
			{
				replaceDiv(
						 document.getElementById("myckdiv")
				);

			};


			var editor;

			function replaceDiv( div )
			{
				if ( editor )
					editor.destroy();


				CKEDITOR.config.extraPlugins= 'stylesheetparser';
				CKEDITOR.config.contentsCss = '<xsl:value-of select="java:org.plutext.htmleditor.Editor.encodeURL($HttpServletResponse, $cssURL)"/>';
				CKEDITOR.config.stylesSet = [];


				CKEDITOR.config.entities = false;
				// CKEDITOR.config.entities_additional is #39, the single quote character which is apos in xml,
				CKEDITOR.config.entities_greek = false;
				CKEDITOR.config.entities_latin = false;

				editor = CKEDITOR.replace( div, {

							toolbar :
							[
							    ['SelectAll','Cut','Copy','Paste','PasteText','PasteFromWord','RemoveFormat'],
							    ['Undo','Redo'],['Find','Replace'],['SpellChecker', 'Scayt'],
							    ['Maximize','Preview', 'Source', 'About'],
						   '/', ['Font','FontSize'],['Bold','Italic','Underline','Strike','-','Subscript','Superscript', '-', 'TextColor'], // 'BGColor'
						   		['Link','Unlink','Anchor'],
						   '/', ['Styles'],
							    ['Outdent','Indent'],['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
							    ['NumberedList','BulletedList'],
							    ['Image'],
							    ['Table']

							],
					        on :
					        {
					            instanceReady : function( ev )
					            {
					            	var tags = ['p', 'table', 'tbody', 'tr', 'td', 'ol', 'ul', 'li'];

					            	for (var key in tags) {
						                // Output paragraphs using p element
						                this.dataProcessor.writer.setRules( tags[key],
						                    {
						                        indent : false,
						                        breakBeforeOpen : false,
						                        breakAfterOpen : false,
						                        breakBeforeClose : false,
						                        breakAfterClose : false
						                    });
						            }

						            var editor = ev.editor;

						            // Grey out things we don't support yet; only works for buttons which are
						            // actually editor commands, which seems to be all but bgcolor
						            //editor.getCommand('pastefromword').disable();
						            //editor.getCommand('strike').disable();
						            editor.getCommand('subscript').disable();
						            editor.getCommand('superscript').disable();
						            // bgcolor: not an editor command
						            //editor.getCommand('link').disable();
						            //editor.getCommand('unlink').disable();
						            //editor.getCommand('anchor').disable();
						            //editor.getCommand('numberedlist').disable();
						            //editor.getCommand('bulletedlist').disable();
						            //editor.getCommand('image').disable();

						            var dform = document.getElementById("docxform");
						            editor.config.height = dform.clientHeight - 210;
						            editor.resize(editor.config.width, editor.config.height, true, false); // 3rd param true is crucial; last doesn't matter?


					            }
					        },
					        filebrowserImageBrowseUrl : '<xsl:value-of select="java:org.plutext.htmleditor.Editor.encodeURL($HttpServletResponse, $filebrowserImageBrowseUrl)"/>',
					        filebrowserImageUploadUrl : '<xsl:value-of select="java:org.plutext.htmleditor.Editor.encodeURL($HttpServletResponse, $filebrowserImageUploadUrl)"/>'

					    });
			}

						function mySave() {
						    var contents = editor.getData();

							// Remove image data uri
							// from 'src="data:' to next '"'
						<xsl:text disable-output-escaping="yes">
							contents = contents.replace(   /(\&lt;img[^\>]+)(src="data[^"]+")([^\>]*&gt;)/g, "$1$3");
						</xsl:text>

							document.getElementById("docxEditorOutput").value=contents;

							//alert(contents);
							document.getElementById("docxform").submit();
							//alert("Vos modifications ont été sauvegardées.");

						}


		</script>
        <style>
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}
.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
.btn:hover,
.btn:focus,
.btn.focus {
  color: #333;
  text-decoration: none;
}
.btn:active,
.btn.active {
  background-image: none;
  outline: 0;
  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
          box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
}
.btn-success {
  color: #fff;
  background-color: #5cb85c;
  border-color: #4cae4c;
}
.btn-success:focus,
.btn-success.focus {
  color: #fff;
  background-color: #449d44;
  border-color: #255625;
}
.btn-success:hover {
  color: #fff;
  background-color: #449d44;
  border-color: #398439;
}
.btn-success:active,
.btn-success.active,
.open > .dropdown-toggle.btn-success {
  color: #fff;
  background-color: #449d44;
  border-color: #398439;
}
.btn-success:active:hover,
.btn-success.active:hover,
.open > .dropdown-toggle.btn-success:hover,
.btn-success:active:focus,
.btn-success.active:focus,
.open > .dropdown-toggle.btn-success:focus,
.btn-success:active.focus,
.btn-success.active.focus,
.open > .dropdown-toggle.btn-success.focus {
  color: #fff;
  background-color: #398439;
  border-color: #255625;
}
.btn-success:active,
.btn-success.active,
.open > .dropdown-toggle.btn-success {
  background-image: none;
}
.btn-success.disabled:hover,
.btn-success[disabled]:hover,
fieldset[disabled] .btn-success:hover,
.btn-success.disabled:focus,
.btn-success[disabled]:focus,
fieldset[disabled] .btn-success:focus,
.btn-success.disabled.focus,
.btn-success[disabled].focus,
fieldset[disabled] .btn-success.focus {
  background-color: #5cb85c;
  border-color: #4cae4c;
}
.btn-success .badge {
  color: #5cb85c;
  background-color: #fff;
}
</style>
      </head>

      <body>
 <script>
   document.addEventListener('DOMContentLoaded', function(){
      if(window.name === 'frameRemove'){
        document.querySelector('#removeMe').style.display = 'none';
      }
   });
</script>

				<form id="docxform" name="dialog" method="post"
				       action="{$saveURLEncoded}"
				       accept-charset="UTF-8"
				       enctype="application/x-www-form-urlencoded"
				       style='width:100%; height:95%'>
					<button type="button" id="removeMe" class="btn btn-success" onclick="javascript:mySave()" style="margin-left:86.8%; margin-bottom: 10px;">Sauvegarder</button>
					<div id='myckdiv' class="editable">
						<xsl:apply-templates select="w:body|w:cfChunk"/>
					</div>
					<input type="hidden" id="docxEditorOutput" name="editorOutput" value="something" />
					<!-- <button type="submit" id="removeMe" onclick="javascript:mySave()">submit</button> -->
				</form>

		</body>
	</html>
</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates select="*" />
	</xsl:template>

	<xsl:template match="w:body">
		<xsl:apply-templates select="*" />
	</xsl:template>


  <xsl:template match="w:bookmarkStart">
		<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, ., 1, 'bookmarkStart', $HttpServletResponse)" />
  </xsl:template>

  <xsl:template match="w:bookmarkEnd">
		<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, ., 1, 'bookmarkEnd', $HttpServletResponse)" />
  </xsl:template>

  <xsl:template match="w:commentRangeStart">
		<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, ., 1, 'commentRangeStart', $HttpServletResponse)" />
  </xsl:template>

  <xsl:template match="w:commentRangeEnd">
		<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, ., 1, 'commentRangeEnd', $HttpServletResponse)" />
  </xsl:template>

  <xsl:template match="w:sectPr" />

  <xsl:template match="w:p">

			<xsl:variable name="objectCount"
							select="count(descendant::w:sectPr)
									+ count(descendant::m:oMathPara)" />

  	<xsl:choose>
  		<xsl:when test="$objectCount &gt; 0">

			<xsl:variable name="frozenContentTypeHint"
							select="local-name(descendant::*[
										self::w:sectPr
										or self::m:oMathPara][position()=last()])" />

			<xsl:variable name="pNode" select="." />
			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $pNode, $objectCount, $frozenContentTypeHint, $HttpServletResponse)" />

  		</xsl:when>
  		<xsl:otherwise>

 			<!--  Usual case-->

			<xsl:variable name="pPrNode" select="w:pPr" />
			<xsl:variable name="pStyleVal" select="string( w:pPr/w:pStyle/@w:val )" />

			<xsl:variable name="numId" select="string( w:pPr/w:numPr/w:numId/@w:val )" />
			<xsl:variable name="levelId" select="string( w:pPr/w:numPr/w:ilvl/@w:val )" />


			<xsl:variable name="childResults" >
				<xsl:choose>
					<xsl:when test="ancestor::w:tbl and count(child::node())=0">
						<!-- A row that has no content will be displayed by browsers
						     (Firefox at least) with a microscopic row height.

						     Rather than put dummy content here - an nbsp or something -
						     i've set a height in the global td style. This could be
						     improved, by only setting it on tr's which need it.

							span>STUFF</span-->
					</xsl:when>
					<xsl:when test="count(child::node())=1 and count(w:pPr)=1">
						<!--  Do count an 'empty' paragraph (one with a w:pPr node only) -->
						<xsl:value-of select="
							java:org.docx4j.convert.out.html.XsltHTMLFunctions.getNumberXmlNode(
						  					$conversionContext, $pPrNode, $pStyleVal, $numId, $levelId)"/>
						<!--  Don't apply templates, since there is nothing to do. -->
					</xsl:when>
					<xsl:otherwise>
						<!--  At present, this doesn't use HTML OL|UL and LI;
						      we'll do that when we have a document model to work from -->
						<xsl:value-of select="
							java:org.docx4j.convert.out.html.XsltHTMLFunctions.getNumberXmlNode(
						  					$conversionContext, $pPrNode, $pStyleVal, $numId, $levelId)" />
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="pPrNode" select="w:pPr" />

			<!-- override org.docx4j.convert.out.html.XsltHTMLFunctions.createBlockForPPr
			     to round trip pPr-->
			<xsl:copy-of select="java:org.plutext.htmleditor.SessionPPrHandler.createBlockForPPr(
		 							$conversionContext, $pPrNode, $pStyleVal, $childResults)" />

  		</xsl:otherwise>
  	</xsl:choose>

  </xsl:template>

<!--  Bullets, non-breaking spaces, quotes etc:-

      As a general principle, don't use character entities, since these
      don't play nicely with extension functions.

      Instead, *use UTF-8 at the Java end*.

      This seems to work nicely.

      Note, that with HTML output method, \u2022 bullet is converted to &bull;
        and \u00A0 is converted to &nbsp; (I'm not sure how it knows to do
        that .. see http://s-n-ushakov.blogspot.com.au/2011/09/xslt-entities-java-xalan.html
        and http://stackoverflow.com/questions/31870/using-a-html-entity-in-xslt-e-g-nbsp
        but nowhere do I tell it what &bull; is!)

      With XML output, the characters appear as their proper UTF 8 output.

      So either output method is fine.  (Though IE needs to use correct encoding ..
      it seems to ignore encoding in XML declaration!)

      For completeness, note that I couldn't get character entities processing
      properly through the extension functions.

	  Findings:
	  1.  can return as text using value-of, provided you disable output escape.
	  2.  to round trip certain entities as strings (don't disable output escaping!)
	  3.  ** can't create an entity as text, and return as DF, use in copy-of
	      (so use of createTextNode in XmlUtils.treeCopy may cause problems ..
	       it converts a single & to &amp; and there seems to be no way around that,
	       short of changing it to <amp> there ...
	  4.  (can round trip an entity as a node)

      But as noted above, there is *no reason* ever to use an entity in our code
      .. just use the UTF 8 character, inserted at Java end as \u...
      (not that XSLT end as &#...)

      The workaround described at http://stackoverflow.com/questions/10842856/text-node-content-escaped-by-xalan-extension
      doesn't work in some cases, because in Java (XmlUtils.treecopy) createTextNode
      seems to automatically convert a single '&' to &amp;
 -->


  <xsl:template match="w:pPr | w:rPr" /> <!--  handle via extension function -->

	<xsl:template match="w:br"> <!-- other than @w:type = 'page' -->

		<xsl:variable name="childResults">
			<xsl:apply-templates />
		</xsl:variable>

		<xsl:variable name="currentNode" select="." />

	     <xsl:copy-of select="java:org.docx4j.convert.out.common.XsltCommonFunctions.toNode($conversionContext, $currentNode,
				$childResults)" />

	</xsl:template>





  <xsl:template match="w:r">

			<xsl:variable name="rNode" select="." />
			<xsl:variable name="objectCount"
							select="count(descendant::w:drawing)
									+ count(descendant::w:pict)
									+ count(descendant::w:object)" />

  	<xsl:choose>

  		<xsl:when test="$objectCount &gt; 0">

			<xsl:variable name="frozenContentTypeHint"
							select="local-name(descendant::*[
										self::v:textbox
										or self::v:imagedata
										or self::o:signatureline
										or self::w:control
										or self::a:blip
										or self::dgm:relIds
										or self::w:pict
										or self::w:object
										or self::c:chart][position()=last()])" />
										<!--  left out v:shape, which contains various things, including v:textbox -->

			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $rNode, $objectCount, $frozenContentTypeHint, $HttpServletResponse)" />

  		</xsl:when>
  		<xsl:when test="descendant::w:commentReference">
			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $rNode, 1, 'commentReference', $HttpServletResponse)" />
  		</xsl:when>

  		<xsl:when test="descendant::w:footnoteReference">
			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $rNode, 1, 'footnoteReference', $HttpServletResponse)" />
  		</xsl:when>

  		<xsl:when test="descendant::w:endnoteReference">
			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $rNode, 1, 'endnoteReference', $HttpServletResponse)" />
  		</xsl:when>

  		<xsl:when test="descendant::w:tab">
			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $rNode, 1, 'tab', $HttpServletResponse)" />
  		</xsl:when>

  		 <xsl:when test="w:br[@w:type = 'page']">
			<xsl:copy-of select="java:org.plutext.htmleditor.LongTailHelper.createFrozenContentBlock( $conversionContext, $rNode, 1, 'br', $HttpServletResponse)" />
  		</xsl:when>

  		<xsl:when test="java:org.docx4j.convert.out.common.XsltCommonFunctions.isInComplexFieldDefinition($conversionContext)" >
  			<!-- in a field, so ignore, unless this run contains fldChar -->
		  	<xsl:if test="w:fldChar"><xsl:apply-templates/></xsl:if>

  		</xsl:when>
  		<xsl:otherwise>

		  	<xsl:choose>
  				<xsl:when test="w:rPr">
					<xsl:variable name="childResults">
						<xsl:apply-templates/>
					</xsl:variable>

					<xsl:variable name="pStyleVal" select="string( ../w:pPr/w:pStyle/@w:val )" />

					<xsl:variable name="rPrNode" select="w:rPr" />

				  	<xsl:copy-of select="java:org.docx4j.convert.out.html.XsltHTMLFunctions.createBlockForRPr(
				  		$conversionContext, $pStyleVal, $rPrNode, $childResults)" />

			  	</xsl:when>
	  			<xsl:otherwise>
		        	<xsl:apply-templates/>
	  			</xsl:otherwise>
			  </xsl:choose>

  		</xsl:otherwise>

  	</xsl:choose>


  </xsl:template>

	<xsl:template match="w:t[parent::w:r]">

		<xsl:variable name="pPrNode" select="../../w:pPr" />
		<xsl:variable name="rPrNode" select="../w:rPr" />
		<xsl:variable name="text" select="." />


		<xsl:choose>
			<xsl:when test="@xml:space='preserve'">
				<span style="white-space:pre-wrap;"><xsl:value-of select="." /></span>
				<!-- Good for FF3, and WebKit; not honoured by IE7 though. Yawn. -->
			</xsl:when>
			<xsl:otherwise>

				<xsl:copy-of select="java:org.docx4j.convert.out.common.XsltCommonFunctions.fontSelector(
				  		$conversionContext, $pPrNode, $rPrNode, $text)" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

  <xsl:template match="w:t[not(parent::w:r)]">
  	<xsl:value-of select="."/>
  </xsl:template>

<!-- This is an extension point.
     You can register your own SdtTagHandlers, which
     tailor the HTML output based on the content of
     w:sdtPr/w:tag.
     See the SdtWriter class for details. -->
	<xsl:template match="w:sdt">

		<xsl:variable name="childResults">
			<xsl:apply-templates select="w:sdtContent/*" />
		</xsl:variable>

		<xsl:variable name="currentNode" select="./w:sdtPr" />

		<xsl:copy-of
			select="java:org.docx4j.convert.out.html.XsltHTMLFunctions.toSdtNode(
  			$conversionContext, $currentNode,
  			$childResults)"  />

	</xsl:template>



  <xsl:template match="w:lastRenderedPageBreak" />


  <!--  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
  <!--  +++++++++++++++++++ table support +++++++++++++++++++++++ -->
  <!--  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


  <xsl:template match="w:tbl">

		<xsl:variable name="currentNode" select="." />

		<xsl:variable name="childResults">
			<xsl:apply-templates /> <!-- select="*[not(name()='w:tblPr' or name()='w:tblGrid')]" /-->
		</xsl:variable>

		<!--  Create the HTML table in Java -->
	  	<xsl:copy-of select="java:org.docx4j.convert.out.common.XsltCommonFunctions.toNode($conversionContext, $currentNode, $childResults)"/>

  </xsl:template>

<xsl:template match="w:tblPr"/>
<xsl:template match="w:tblPrEx"/>
<xsl:template match="w:tblGrid"/>
<xsl:template match="w:tr|w:tc">
	<xsl:copy>
		<!--xsl:apply-templates select="@*"/-->
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>
<xsl:template match="w:tcPr"/>
<xsl:template match="w:trPr"/>

  <!--  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
  <!--  +++++++++++++++++++  other stuff  +++++++++++++++++++++++ -->
  <!--  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


	<xsl:template match="w:proofErr" />

	<xsl:template match="w:softHyphen">
		<xsl:text>&#xAD;</xsl:text>
	</xsl:template>

	<xsl:template match="w:noBreakHyphen">
		<xsl:text disable-output-escaping="yes">&amp;#8209;</xsl:text>
	</xsl:template>

<!--
  <xsl:template match="w:br[not(@w:type = 'page')]">
		<xsl:text disable-output-escaping="yes">
		</xsl:text>
  </xsl:template>
  -->

  <xsl:template match="w:cr">
	<br clear="all" />
</xsl:template>

<!--  <w:sym w:font="Wingdings" w:char="F04A"/> -->
<xsl:template match="w:sym">

	<xsl:variable name="childResults">
		<xsl:apply-templates />
	</xsl:variable>

	<xsl:variable name="currentNode" select="." />

     <xsl:copy-of select="java:org.docx4j.convert.out.common.XsltCommonFunctions.toNode($conversionContext, $currentNode,
			$childResults)" />

</xsl:template>


<xsl:template match="w:smartTag">
    <xsl:apply-templates />
</xsl:template>

	<xsl:template match="w:smartTagPr" />

  <xsl:template match="w:hyperlink">
	<xsl:variable name="childResults">
		<xsl:apply-templates />
	</xsl:variable>

	<xsl:variable name="currentNode" select="." />

     <xsl:copy-of select="java:org.docx4j.convert.out.common.XsltCommonFunctions.toNode($conversionContext,$currentNode,
			$childResults)" />
  </xsl:template>


  <xsl:template match="w:ins">
  	<span class="ins">
  		<xsl:apply-templates/>
  	</span>
  </xsl:template>

  <xsl:template match="w:del">
  		<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="w:delText">
  	<span class="del">
  		<xsl:apply-templates/>
  	</span>
  </xsl:template>



  <xsl:template match="w:fldSimple" >
		<xsl:variable name="childResults">
			<xsl:apply-templates/>
		</xsl:variable>

	  	<xsl:copy-of select="java:org.docx4j.convert.out.common.XsltCommonFunctions.toNode(
	  			$conversionContext,., $childResults)"/>
  </xsl:template>

  <!--  Complex fields: update complex field definition level -->
  <xsl:template match="w:fldChar" >
		<xsl:copy-of
			select="java:org.docx4j.convert.out.common.XsltCommonFunctions.updateComplexFieldDefinition($conversionContext, .)" />
  </xsl:template>

  <!--  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
  <!--  +++++++++++++++++++  no match     +++++++++++++++++++++++ -->
  <!--  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

  <xsl:template match="*[ancestor::w:body]" priority="-1"> <!--  ignore eg page number field in footer -->
		<xsl:copy-of
			select="java:org.docx4j.convert.out.common.XsltCommonFunctions.notImplemented($conversionContext,., '' )" />
  </xsl:template>

</xsl:stylesheet>
