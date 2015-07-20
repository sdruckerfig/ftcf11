<html>
<head>
<!--- load the editor from a CDN --->
<script src="//tinymce.cachefly.net/4.2/tinymce.min.js"></script>

<!--- target the cftextarea --->
<script type="text/javascript">
 tinymce.init({selector:'#fullContent'});
</script>
</head>
<body>
<cfform>
  <label for="fullContent">
  Full Content:
  </label>
  <cftextarea name="fullContent" 
              id="fullContent"
              value="Some Content" />
  <br />
  <cfinput type="submit" name="btnSubmit" value="Save">
</cfform>
</body>
</html>