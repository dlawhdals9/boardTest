<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#left{
	width:250px;
	float: left;
}

#main{
	width:850px;
	float: left;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

function downloadExel(){
	
	
	
}
function downloadWord(){
	
}



	
	function checkUpdate(){
		var cnt = $("input:checkbox[name='no']:checked").length
		if(cnt == 1){
			var no = $("input:checkbox[name='no']:checked").val();
			var currentPage = ${boardList.currentPage};
			location.href="update?no="+no+"&currentPage="+currentPage;
		}else{
			alert('한개만 선택해주세요')
		}
	}
	function checkDelete(){
		var cnt = $("input:checkbox[name='no']:checked").length
		var check_cnt = document.getElementsByName("no").length;
		var currentPage = ${boardList.currentPage};
		var numbers = "";
		if(cnt>0){
			if(confirm('삭제하시겠습니까?')){
				for(var i = 0; i < check_cnt; i++ ){
					 if (document.getElementsByName("no")[i].checked == true) {
						 numbers += document.getElementsByName("no")[i].value +","
			            }
				}
				location.href="delete?numbers="+numbers+"&currentPage="+currentPage+"&cnt="+cnt;
				
			}
		}else{
			alert('한개 이상 선택을 해주세요');
		}
			
	}
	
	function search(){
		var search = document.getElementById("search").value;
		var searchText = document.getElementById("searchText").value;
		location.href="searchOK?search="+search+"&searchText="+searchText;
	}
	function allSelect(bool) {
		var chks = document.getElementsByName("no");
		for(var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}
	function checkSearch(){
		
		if(confirm('성별, 기술등급 , 상태 , 근무로 검색하시겠습니까?')){
			var form = document.DynamicSearchForm;
		    form.submit();
		}
	}
	
	
	
</script>

</head>
<body>

<div id="left">
<table width="200px" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center" valign="top"><table width="170" height="300" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="9"><img src="image/left_top.gif" width="170" height="9"></td>
        </tr>
        <tr> 
          <td align="center" valign="top" background="image/left_bg.gif">
		  <!----------------------  메뉴들 ----------------------------->
		  <table width="150" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17" height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td width="133"><a href="list">기본정보</a></td>
              </tr>
              <tr> 
                <td height="20">&nbsp;</td>
                <td><a href="insert">- 등록</a></td>
              </tr>
              <tr> 
                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>직원명부</td>
              </tr>
              <tr> 
                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>퇴직자현황</td>
              </tr>
              <tr> 
                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>예비인력정보</td>
              </tr>
              <tr> 
                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td>거래처정보</td>
              </tr>
              <tr> 
                <td height="20">&nbsp;</td>
                <td>- 등록</td>
              </tr>
            </table>
		  <!----------------------  메뉴들 ----------------------------->
			</td>
        </tr>
        <tr> 
          <td height="9"><img src="image/left_bottom.gif" width="170" height="9"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"><table width="170" height="49" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="center" background="image/left_box.gif">
		  <!------------------------------ 경력검색 ---------------------------------->
		  <table width="155" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="17"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
                <td width="143" height="20"><strong>경력검색</strong></td>
              </tr>
              <tr align="right"> 
                <td colspan="2"><input name="textfield" type="text" class="flat" size="15" maxlength="14"> 
                  <img src="image/search.gif" width="49" height="18" align="absmiddle"></td>
              </tr>
            </table>
		  <!------------------------------ 경력검색 ---------------------------------->
			</td>
        </tr>
      </table></td>
  </tr>
</table>

</div>

<div id="main" style="width: 660px">



<c:set var="list" value="${boardList.boardList}"/>
<table width="650px" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="30" align="right"><select name="search" id="search">
              <option value="전체">전체</option>
              <option value="이름">이름</option>
              <option value="성별">성별</option>
              <option value="기술등급">기술등급</option>
            </select> <input name="textfield" type="text" id="searchText"> <a href="#"><img src="image/search.gif" width="49" height="18" border="0" align="absmiddle" onclick="search()"></a></td>
        </tr>
        <tr> 
          <td><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="3" background="image/bar_bg1.gif"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  
                  
                  <input type="button" value="수정" onclick="checkUpdate()"> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  
                  
                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr> 
                <td>
				<!-------------------------  리스트 ------------------------------>
				<table width="640" border="0" cellspacing="0" cellpadding="0">
					<tr> 
                      <td width="35" height="20" align="center"><input type="checkbox" name="all" onclick="allSelect(this.checked)"></td>
                      <td width="85" align="center">이름</td>
                      <td width="153" align="center">주민번호</td>
                      <td width="91" align="center">성별</td>
                      <td width="91" align="center">기술등급</td>
                      <td width="91" align="center">상태</td>
                      <td width="94" align="center">근무</td>
                      <td width="50" align="center">파일</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="image/line_bg.gif"></td>
                    </tr>
					
					
					<c:forEach var="vo" items="${list}">
                    <tr> 
                      <td width="35" height="20" align="center"><input type="checkbox" name="no" id="no" value="${vo.no}"></td>
                      <td width="85" align="center">${vo.kor_name}</td>
                      <td width="153" align="center">${vo.jumin_nof}-${vo.jumin_nob}</td>
                      <td width="91" align="center">${vo.sex}</td>
                      <td width="91" align="center">${vo.tech_lev}</td>
                      <td width="91" align="center">${vo.jop_type}</td>
                      <td width="94" align="center">${vo.desire_dept}</td>
                      <td width="50" align="center">
                      		<c:if test="${vo.exel != null}">
	                      		<a href="/board/download?fileName=${vo.exel}">
	                      			<img src="image/exel.png" id="exel${vo.no}" width="11" height="11" align="absmiddle" onclick="downloadExel()" style="cursor: pointer;">
	                      		</a>
                      		</c:if>
                      		&nbsp;
                      		<c:if test="${vo.word != null}">
	                      		<a href="/board/download?fileName=${vo.word}">
	                      			<img src="image/word.png" id="word${vo.no}" width="11" height="11" align="absmiddle" onclick="downloadWord()" style="cursor: pointer;">
	                      		</a>
                      		</c:if>
                      		
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="image/line_bg.gif"></td>
                    </tr>
                   	</c:forEach>
                   
                   
                    <tr> 
                      <td height="35" colspan="7" align="center" style="padding-bottom:3">
                      
                      		<!-- 검색조건이 null일때 -->
	                      	<c:if test="${param.search == null && dynamicParam.sex == null}">
	                      		<c:if test="${boardList.startPage > 1}">
									<a href="?currentPage=1">
				                      	<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
			                      	<a href="?currentPage=${boardList.startPage - 1}">
			                      		<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
								</c:if>	
							
								<c:if test="${boardList.startPage <= 1}">
									<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
									<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle">
								</c:if>	
								<c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
									<c:if test="${i == boardList.currentPage}">
										<input class="button button2" type="button" value="${i}" disabled="disabled"/>
									</c:if>
									<c:if test="${i != boardList.currentPage}">
										<input class="button button1" type="button" value="${i}" onclick="location.href='?currentPage=${i}'" />
									</c:if>
								</c:forEach>
								
								<c:if test="${boardList.endPage < boardList.totalPage}">
									<a href="?currentPage=${boardList.endPage + 1}">
				                      	<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
			                      	<a href="?currentPage=${boardList.totalPage}">
			                      		<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
								</c:if>	
							
								<c:if test="${boardList.endPage >= boardList.totalPage}">
									<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
									<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
								</c:if>	
							</c:if>
							
							
							<!-- 카테고리 검색일때 -->
							<c:if test="${param.search != null}">
								<c:if test="${boardList.startPage > 1}">
									<a href="searchOK?currentPage=1&search=${param.search}&searchText=${param.searchText}">
				                      	<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
			                      	<a href="searchOK?currentPage=${boardList.startPage - 1}&search=${param.search}&searchText=${param.searchText}">
			                      		<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
								</c:if>	
								<c:if test="${boardList.startPage <= 1}">
									<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
									<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle">
								</c:if>	
								
								<c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
									<c:if test="${i == boardList.currentPage}">
										<input class="button button2" type="button" value="${i}" disabled="disabled"/>
									</c:if>
									<c:if test="${i != boardList.currentPage}">
										<input class="button button1" type="button" value="${i}" 
										onclick="location.href='searchOK?currentPage=${i}&search=${param.search}&searchText=${param.searchText}'"/>
									</c:if>
								</c:forEach>
								<c:if test="${boardList.endPage < boardList.totalPage}">
									<a href="searchOK?currentPage=${boardList.endPage + 1}&search=${param.search}&searchText=${param.searchText}">
				                      	<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
			                      	<a href="searchOK?currentPage=${boardList.totalPage}&search=${param.search}&searchText=${param.searchText}">
			                      		<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
								</c:if>	
								<c:if test="${boardList.endPage >= boardList.totalPage}">
									<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
									<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
								</c:if>	
							</c:if>
							
							
							<!-- 다중검색일때 -->
							<c:if test="${dynamicParam.sex != null}">
								<c:if test="${boardList.startPage > 1}">
									<a href="dynamicSearch?currentPage=1&sex=${dynamicParam.sex}&tech_lev=${dynamicParam.tech_lev}&jop_type=${dynamicParam.jop_type}&desire_dept=${dynamicParam.desire_dept}">
				                      	<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
			                      	<a href="dynamicSearch?currentPage=${boardList.startPage - 1}&sex=${dynamicParam.sex}&tech_lev=${dynamicParam.tech_lev}&jop_type=${dynamicParam.jop_type}&desire_dept=${dynamicParam.desire_dept}">
			                      		<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
								</c:if>	
								<c:if test="${boardList.startPage <= 1}">
									<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
									<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle">
								</c:if>	
								
								<c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
									<c:if test="${i == boardList.currentPage}">
										<input class="button button2" type="button" value="${i}" disabled="disabled"/>
									</c:if>
									<c:if test="${i != boardList.currentPage}">
										<input class="button button1" type="button" value="${i}" 
										onclick="location.href='dynamicSearch?currentPage=${i}&sex=${dynamicParam.sex}&tech_lev=${dynamicParam.tech_lev}&jop_type=${dynamicParam.jop_type}&desire_dept=${dynamicParam.desire_dept}'"/>
									</c:if>
								</c:forEach>
								<c:if test="${boardList.endPage < boardList.totalPage}">
									<a href="dynamicSearch?currentPage=${boardList.endPage + 1}&sex=${dynamicParam.sex}&tech_lev=${dynamicParam.tech_lev}&jop_type=${dynamicParam.jop_type}&desire_dept=${dynamicParam.desire_dept}">
				                      	<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
			                      	<a href="dynamicSearch?currentPage=${boardList.totalPage}&sex=${dynamicParam.sex}&tech_lev=${dynamicParam.tech_lev}&jop_type=${dynamicParam.jop_type}&desire_dept=${dynamicParam.desire_dept}">
			                      		<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
			                      	</a>&nbsp;
								</c:if>	
								<c:if test="${boardList.endPage >= boardList.totalPage}">
									<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
									<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
								</c:if>	
							</c:if>
							
	                        &nbsp;
	                        
                        </td>
                    </tr>
                  </table>
 				<!-------------------------  리스트 ------------------------------>
				  </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                 
                 
                  <input type="button" value="삭제" onclick="checkDelete()"> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle">
                  
                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" background="image/bar_bg1.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>

</div>

<form action="dynamicSearch" name="DynamicSearchForm" id="DynamicSearchForm" method="post">
<table id="searchTable">
	<tr>
		<td align="center"><strong>성별 :&nbsp;</strong></td>
		<td>
			<select name="sex" id="sex">
				<option selected="selected" value="null">선택</option>
				<option value="남자">남자</option>
				<option value="여자">여자</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td align="center"><strong>기술등급 :&nbsp;</strong></td>
		<td>
			<select name="tech_lev" id="tech_lev">
				<option selected="selected" value="null">선택</option>
				<option value="초급">초급</option>
				<option value="중급">중급</option>
				<option value="상급">상급</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td align="center"><strong>상태 :&nbsp;</strong></td>
		<td>
			<select name="jop_type" id="jop_type">
				<option selected="selected" value="null">선택</option>
				<option value="정규직">정규직</option>
				<option value="계약직">계약직</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td align="center"><strong>근무 :&nbsp;</strong></td>
		<td>
			<select name="desire_dept" id="desire_dept">
				<option selected="selected" value="null">선택</option>
				<option value="SI">SI</option>
				<option value="SM">SM</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="검색" onclick="checkSearch()"></td>
	</tr>
</table>
</form>



</body>
</html>