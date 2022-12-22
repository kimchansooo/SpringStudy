<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			//@restcontroller방식 ajax
			$('#restconBtn').click(function(){
				 $.ajax({  
							type : "get",
							dataType: 'json',
							url  : "emp",
							success : function(data){ 
								console.log(data);
								//$('#exp').empty();
								//$('#exp').append('<fieldset><legend>@RestController</legend><p>@Controller 대신 @RestController를 사용하면 자동으로 @ResponseBody가 기본으로 작동</p></fieldset>');
								createTable(data, "@Restcontroller");
							}
						 });
				   
			});
			
			//검색
			$("#selectbtn").click(function(){
				const empno = Number($("#selectbyempno").val());
				$.ajax({
						type: "get",
						dataType : 'json',
						url :"emp/"+empno,
						success : function(data){
							console.log(data);
							createTable2(data, "검색결과")
						}
					
					
				})
				
				
			});
						
			//삭제
			$(document).on("click",".delete",function(){
				console.log(({"empno" : Number($(this).attr("value2"))}))
				const empno = Number($(this).attr("value2"));
				$.ajax({
					type : "DELETE",
					dataType : 'json',
					url  : "emp/"+empno,
					success : function(data){ 
						createTable(data, "삭제완료");
					}
				});
				
			});
		})
		
		//수정 폼
		function empupdate(me){
				var tr = $(me).closest('tr')
				const empno = Number(tr.children().html());
				tr.empty();
				
				$.ajax({
					type : "get",
					url:"emp/"+empno,
					success : function(data) {
					 	var td = "<td><input type='text' value='"+data.empno +"' readonly></td>";
							td +="<td><input type='text' value='"+data.ename +"'></td>";
							td +="<td><input type='text' value='"+data.sal +"'></td>";
							td +="<td colspan='2'><input type='button'onclick='empupdateconfirm(this)' value='완료' value2="+data.empno+" /></td>";
							$(tr).append(td); 
					}
				});
			}
		
		
		function empupdateconfirm(me){			
			empupdateok(me);
		}
		//수정 처리
		function empupdateok(me){
			var tr = $(me).closest('tr');
			var data =  JSON.stringify({"empno":tr.find("td:eq(0)").children().val(),
						"ename":tr.find("td:eq(1)").children().val(),
						"sal":tr.find("td:eq(2)").children().val(),
					   });
			$.ajax({
				type : "PUT",
				dataType : 'json',
				url:"emp",
				contentType:'application/json;charset=utf-8',
				data:data,
				success : function(data){  
					createTable(data, "수정완료");
					}
			});
		}
		
		//Json 전용 table 생성
		function createTable(data, way){
			$('#menuView').empty();
			var opr="<h4>"+way+"</h4>"+
				"<table id='datatable'><thead><tr>"+
				"<th>EMPNO</th>"+
            	"<th>ENAME</th>"+
            	"<th>SAL</th>"+
            	"<th>EDIT</th><th>DELETE</th></tr></thead><tbody>";
			$.each(data,function(index,emp){
				opr += "<tr><td>"+emp.empno+
				"</td><td>"+emp.ename+
				"</td><td>"+emp.sal+
				"</td><td><input type='button' onclick='empupdate(this)' value='수정' class ='update'  value2="+emp.empno+
				"></td><td><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></td></tr>";
			});
			opr+="</tbody></table><table><tr><td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td></tr></table>";
			$('#menuView').append(opr);
			
		}
		
		//검색을 위한 테이블 생성 
		function createTable2(data, way){
			$('#menuView').empty();
			var opr="<h4>"+way+"</h4>"+
				"<table id='datatable'><thead><tr>"+
				"<th>EMPNO</th>"+
            	"<th>ENAME</th>"+
            	"<th>SAL</th>"+
            	"<th>EDIT</th><th>DELETE</th></tr></thead><tbody>"+
				"<tr><td>"+data.empno+
				"</td><td>"+data.ename+
				"</td><td>"+data.sal+
				"</td><td><input type='button' onclick='empupdate(this)' value='수정' class ='update'  value2="+data.empno+
				"></td><td><input type='button' value='삭제' class ='delete' value2="+data.empno+"></td></tr>"+
				"</tbody></table><table><tr><td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td></tr></table>";
			$('#menuView').append(opr);
			
		}
		
		//등록 폼
		function createinput(me){
			var tr = $(me).closest('tr');
			tr.empty();
			var td = "<td><input type='text' placeholder='empno'></td>";
			td +="<td><input type='text' placeholder='ename'></td>";
			td +="<td><input type='text' placeholder='sal'></td>";
			td +="<td><input type='button'onclick='empinsert(this)' value='완료'/></td>";
			td +="<td><input type='button'onclick='cancel(this)' value='취소'/></td>";
			$(tr).append(td); 
		}
		
		//취소버튼
		function cancel(me){
			var tr = $(me).closest('tr');
			tr.empty();
			tr.append("<td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td>");
			
		}
		//등록 처리
		function empinsert(me){
			var tr = $(me).closest('tr');
			var data = JSON.stringify({"empno":tr.find("td:eq(0)").children().val(),
						"ename":tr.find("td:eq(1)").children().val(),
						"sal":tr.find("td:eq(2)").children().val(),
					   });
			$.ajax({
				type : "post",
				dataType :'json',
				url:"emp",
				data:data,
				contentType:'application/json;charset=utf-8',
				success : function(data){  
					createTable(data, "추가");
				}
			});
		}
	
	</script>
		 <style>
table {
	border-collapse: collapse; /* 붕괴하다 , 무너지다 */
	width: 100%;
	table-layout: fixed
}

th {
	text-align: center;
	width: 10px;
}

td {
	text-align: center;
	width: 10px;
}
input[type="text"]{
	width: 60%;
}

</style>
</head>
<body>
	<div class="wrapper">
	    <div class="fresh-table toolbar-color-azure full-screen-table" style="align-content: center;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
				<fieldset>
					<legend>JSON</legend>
					<input type="button" value="목록 불러오기" id="restconBtn">
					사번으로 검색 : <input type="text" id="selectbyempno"><input type="button" value="검색" id="selectbtn">
				</fieldset>
				</div>
				<div class="col-sm-6">
				</div>
			</div>
			<hr>
			<div id="exp"></div>
				<span id="menuView">
				</span>
		</div>
		</div>
	</div>
	
</body>
</html>