<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="fileUpload" method="post" enctype="multipart/form-data" name="exelForm" id="exelForm"> 
사진파일명 :&nbsp;<input type="file" multiple="multiple" name="file" value="file" id="imageFile" accept=".jpg" width="155" height="18"><br/>
엑셀파일명 :&nbsp;<input type="file" multiple="multiple" name="exelFile" value="exelFile" id="exelFile" width="155" height="18"><br/>
워드파일명 :&nbsp;<input type="file" multiple="multiple" name="wordFile" value="wordFile" id="wordFile" width="155" height="18"><br/>
<input type="submit">
</form>




</body>
</html>