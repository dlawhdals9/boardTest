<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

button {
	background-color:transparent;  
	border:0px transparent solid;
}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

/* 이미지 파일 입력하기 */
$(function() {
    $("#imageFile").on('change', function(){
    	var fileNm = $("#imageFile").val();
    	var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();	// 확장자 가져오기
		if(ext == 'jpg'){
			
		}else{
			alert("jpg파일만 업로드가 가능합니다.");
			$("#imageFile").val("");
			return;
		}
    	
    });
});

/* 주민등록 번호로 생년월일 입력 */
$(function() {
    $("#jumin_nof").on('change', function(){
       	var tempbirth =  $("#jumin_nof").val();
       	
       	var year = "19" + tempbirth.substr(0,2);  
       	var month = tempbirth.substr(2,2);  
       	var day = tempbirth.substr(4,2);  
		
       	var birth1 =  document.getElementById("birth1");
       	var birth2 =  document.getElementById("birth2");
       	var birth3 =  document.getElementById("birth3");
		
    	birth1.value = year;
    	birth2.value = month;
    	birth3.value = day;
    });
}); 
//이미지 업로드 미리보기
$(function() {
      $("#imageFile").on('change', function(){
          readURL(this);
      });
  }); 

function readURL(input) {
     if (input.files && input.files[0]) {		// 선택된 파일이 있다면,
     var reader = new FileReader();			// 파일을 읽어서,
     reader.onload = function (e) {			// #preview 이미지 태그에 들어있는 사진과 바꾸기
             $('#preview').attr('src', e.target.result);
         }
       reader.readAsDataURL(input.files[0]);
     }
 }
  
  
var pattern_eng = /[a-zA-Z]/;	// 문자
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
var pattern_num = /[0-9]/;	// 숫자 
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자

var korNameFlag = false;

/* 한글입력검사 */
function checkName(){
	
	var kor_name = document.getElementById("kor_name").value;
	var korNameCheck = document.getElementById("korNameCheck");
	if(!(pattern_kor.test(kor_name)) || pattern_eng.test(kor_name) || pattern_num.test(kor_name) || pattern_spc.test(kor_name)){
		korNameFlag = false;
		korNameCheck.innerText = "※ 한글만 입력가능합니다.";
		
	}else{
		korNameFlag = true;
		korNameCheck.innerText = "";
	}
	
}

/* 모든항목이 입력됬는지 검사 */
function checkForm(){
	
	var txtEle = $("#frm input[type=text]");
	var radioEle = $("#frm input[type=radio]:checked");
	
	if(radioEle.length < 3){
		alert('모든항목을 입력해주세요')
		return false;
	}
	for(var i = 0; i < txtEle.length; i ++){
	//alert($(txtEle[i]).val());
		if("" == $(txtEle[i]).val() || null == $(txtEle[i]).val()){
			var ele_id = $(txtEle[i]).attr("id");
			alert('모든항목을 입력해주세요 : ' + ele_id);
			return false;
		}
	}
	
	return true
}

function check(){
	var checktext = checkForm();
	
	if(checktext && confirm('등록하시겠습니까?')){
		
		var kor_name = document.getElementById("kor_name").value;
		var eng_name = document.getElementById("eng_name").value;
		var chn_name = document.getElementById("chn_name").value;
		var tech_lev = document.getElementById("tech_lev").value;
		
		var jumin_nof = document.getElementById("jumin_nof").value;
		var jumin_nob = document.getElementById("jumin_nob").value;
		var birth1 = document.getElementById("birth1").value;
		var birth2 = document.getElementById("birth2").value;
		var birth3 = document.getElementById("birth3").value;
		var work_year = document.getElementById("work_year").value;
		var phone1 = document.getElementById("phone1").value;
		var phone2 = document.getElementById("phone2").value;
		var phone3 = document.getElementById("phone3").value;
		
		var jumin_nof = document.getElementById("jumin_nof").value;
		var jumin_nob = document.getElementById("jumin_nob").value;
		
		/* 주민등록 번호 중복확인 AJAX */
		$.ajax({
			type : 'get',
			url : 'checkJumin?jumin_nof='+jumin_nof+'&jumin_nob=' + jumin_nob,
			dataType : 'json',
			success : function(data){
				if(data==0){
					/* 텍스트 상자 입력 검사 */
					if(!(pattern_kor.test(kor_name)) || pattern_eng.test(kor_name) || pattern_num.test(kor_name) || pattern_spc.test(kor_name)){
						alert('한글이름에는 한글만 입력해주세요~')
					}else if(pattern_kor.test(eng_name) || !(pattern_eng.test(eng_name)) || pattern_num.test(eng_name) || pattern_spc.test(eng_name)){
						alert('영문이름에는 영어만 입력해주세요~')
					}else if(!(pattern_kor.test(tech_lev)) || pattern_eng.test(tech_lev) || pattern_num.test(tech_lev) || pattern_spc.test(tech_lev)){
						alert('기술등급에는 문자열만 입력가능합니다~')
					}else if(pattern_num.test(chn_name) || pattern_spc.test(chn_name)){
						alert('한문이름에는 문자열만 입력가능합니다~')
					}else if( pattern_kor.test(jumin_nof) || pattern_eng.test(jumin_nof) || !(pattern_num.test(jumin_nof)) || pattern_spc.test(jumin_nof)){
						alert('주민등록번호에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(jumin_nob) || pattern_eng.test(jumin_nob) || !(pattern_num.test(jumin_nob)) || pattern_spc.test(jumin_nob)){
						alert('주민등록번호에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(birth1) || pattern_eng.test(birth1) || !(pattern_num.test(birth1)) || pattern_spc.test(birth1)){
						alert('생년월일에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(birth2) || pattern_eng.test(birth2) || !(pattern_num.test(birth2)) || pattern_spc.test(birth2)){
						alert('생년월일에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(birth3) || pattern_eng.test(birth3) || !(pattern_num.test(birth3)) || pattern_spc.test(birth3)){
						alert('생년월일에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(work_year) || pattern_eng.test(work_year) || !(pattern_num.test(work_year)) || pattern_spc.test(work_year)){
						alert('년차에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(phone1) || pattern_eng.test(phone1) || !(pattern_num.test(phone1)) || pattern_spc.test(phone1)){
						alert('핸드폰번호에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(phone2) || pattern_eng.test(phone2) || !(pattern_num.test(phone2)) || pattern_spc.test(phone2)){
						alert('핸드폰번호에는 숫자만 입력가능합니다~')
					}else if( pattern_kor.test(phone3) || pattern_eng.test(phone3) || !(pattern_num.test(phone3)) || pattern_spc.test(phone3)){
						alert('핸드폰번호에는 숫자만 입력가능합니다~')
					}else{
						var form = document.userinput;
					    form.submit();
					}
				}else{
					alert('중복된 주민등록번호는 입력이 불가능합니다.')
				}
			}//sucess
		});//AJAX
	}else{}//confirm
}//check
	
/* function fileUploadCheck(){
	var form = document.userinput;
    form.submit();
}	 */
	
</script>
</head>
<body topmargin="0" leftmargin="0">

<form action="insertOK" method="post" enctype="multipart/form-data" name="userinput" id="frm">
<table width="640" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원 기본 정보 수정</strong></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="15" align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="640" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="2" background="image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10"><table width="600" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"><strong>교육정보 | 자격증. 보유기술정보 | 프로젝트 
                              정보 |경력정보 | 근무정보</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="3" align="right" background="image/bar_bg1.gif"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="6" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="135" align="center" bgcolor="#E4EBF1"><table width="600" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="144" height="119" align="center"><table width="100" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="112" bgcolor="#CCCCCC">
                              <table width="100" border="0" cellspacing="1" cellpadding="0">
                                  <tr>
                                    <td width="144"  height="110" bgcolor="#FFFFFF">
							 			<img id="preview" style="width: 100px"/>
						 			</td>
                                  </tr>
                              </table>
                              </td>
                            </tr>
                          </table></td>
                          <td width="456"><table width="423" border="0" cellspacing="2" cellpadding="0">
                            <tr>
                              <td height="2" colspan="2"></td>
                              </tr>
                            <tr>
                              <td width="107" height="26" align="right"><strong>한글이름 :</strong>&nbsp;</td>
                              <td width="310" height="26">
                                <input type="text" id="kor_name" name="kor_name" onkeyup="checkName()">
                                <div id="korNameCheck" style="float: right; color: red; font: bold;"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
                              <td height="26"><input type="text" id="eng_name" name="eng_name"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>한문이름:</strong>&nbsp;</td>
                              <td height="26"><input type="text" id="chn_name" name="chn_name"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
                              <td height="26"><input id="jumin_nof" name="jumin_nof" type="text" size="15" maxlength="6">
      -
        <input id="jumin_nob" name="jumin_nob" type="text" size="15" maxlength="7"></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td height="13" align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102"  align="right"><strong>사진파일명 :&nbsp;</strong></td>
                            <td width="410" ><font color="#FF0000">
                            	<input type="file" name="file" value="file" id="imageFile" accept=".jpg" width="155" height="18">
                            </font></td>
                          </tr>
                        </table></td>
                    </tr>
					<tr> 
						<td bgcolor="#E4EBF1">
							<form action="exelFileUpload" method="post" enctype="multipart/form-data" name="exelForm" id="exelForm"> 
								  <table width="526" border="0" cellspacing="1" cellpadding="1">
								      <tr> 
								        <td width="102" align="right"><strong>엑셀파일명 :&nbsp;</strong></td>
								        <td width="410"><font color="#FF0000">
								        	<input type="file" name="exelFile" value="exelFile" id="exelFile" width="155" height="18">
								        </font></td>
								      </tr>
								    </table>
							</form>
						</td>
					</tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>워드파일명 :&nbsp;</strong></td>
                            <td width="410"><font color="#FF0000">
                            	<input type="file" name="wordFile" value="wordFile" id="wordFile" width="155" height="18">
                            </font></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>생년월일 :&nbsp;</strong></td>
                            <td width="391"><input id="birth1" name="birth1" type="text" size="10">
                              년 
                              <input id="birth2" name="birth2" type="text" size="7">
                              월 
                              <input id="birth3" name="birth3" type="text" size="7">
                              일 ( 
                              <input type="radio" id="sol_flag" name="sol_flag" value="양력">
                              양력 
                              <input type="radio" id="sol_flag" name="sol_flag" value="음력">
                              음력 )</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
                            <td width="391"> <input type="radio" id="sex" name="sex" value="남자">
                              남자 
                              <input type="radio" id="sex" name="sex" value="여자">
                              여자</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
                            <td width="391"> <input type="radio" id="marry_flag" name="marry_flag" value="유">
                              유 
                              <input type="radio" id="marry_flag" name="marry_flag" value="무">
                              무</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
                            <td width="392"><input id="work_year" name="work_year" type="text" size="10"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>급여 지급유형 :&nbsp;</strong></td>
                            <td width="392"> <select name="payment_type" id="payment_type">
                                <option>월급</option>
                                <option>주급</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
                            <td width="392"> <select name="desire_dept" id="desire_dept">
                                <option>SI</option>
                                <option>SM</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
                            <td width="392"> <select name="jop_type" id="jop_type">
                                <option>정규직</option>
                                <option>계약직</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주소:&nbsp;</strong></td>
                            <td width="392"><!-- <input name="address" type="text" size="10">  -->
                              <input name="address" id="address" type="text" size="40"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>연락처:&nbsp;</strong></td>
                            <td width="392"><input name="phone1" id="phone1" type="text" size="10">
                              - 
                              <input name="phone2" id="phone2" type="text" size="10">
                              - 
                              <input name="phone3" id="phone3" type="text" size="10"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
                            <td width="392"><input name="email" id="email" type="text" size="20"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
                            <td width="392"><input name="tech_lev" id="tech_lev" type="text" size="20"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
                            <td width="392"><input name="liquor" id="liquor" type="text" size="20"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="3" align="center"><table width="107" border="0" cellpadding="1" cellspacing="1">
            <tr>
              <td width="49">
              	<button type="button" onclick="check()"><img src="image/bt_add.gif" name="cancel"  align="absmiddle" width="49" height="18"></button>
              </td>
              <td width="51">
              	<button type="button" onclick="location.href='list'"><img src="image/bt_cancel.gif" name="cancel"  align="absmiddle" width="49" height="18"></button>
              </td>
            </tr>
          </table>            </td>
        </tr>
        <tr> 
          <td height="7" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>