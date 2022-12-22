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
							type : "post",
							url  : "restcon.ajax",
							success : function(data){ 
								console.log(data);
								//$('#exp').empty();
								//$('#exp').append('<fieldset><legend>@RestController</legend><p>@Controller 대신 @RestController를 사용하면 자동으로 @ResponseBody가 기본으로 작동</p></fieldset>');
								createTable(data, "@Restcontroller");
								$('#datatable').DataTable();   
							}
						 });
				   
			});
			
			
			//삭제
			$(document).on("click",".delete",function(){
				$.ajax({
					type : "post",
					url  : "delete.ajax",
					data : {empno : $(this).attr("value2")},
					success : function(data){ 
						createTable(data, "삭제완료");
						$('#datatable').DataTable();
					}
				});
				
			});
		})
		
		//수정 폼
		function empupdate(me){
				var tr = $(me).closest('tr')
				var datas = {empno:tr.children().html()};
				tr.empty();
				
				$.ajax({
					type : "get",
					url:"update.ajax",
					data:datas,
					success : function(data) {
						console.log(data);
					 	var td = "<td><input type='text' value='"+data.empno +"' readonly></td>";
							td +="<td><input type='text' value='"+data.ename +"'></td>";
							td +="<td><input type='text' value='"+data.job +"'></td>";
							td +="<td><input type='text' value='"+data.mgr +"'></td>";
							td +="<td><input type='text' value='"+data.hiredate.substring(0,10) +"' readonly></td>";
							td +="<td><input type='text' value='"+data.sal +"'></td>";
							td +="<td><input type='text' value='"+data.comm +"'></td>";
							td +="<td><input type='text' value='"+data.deptno +"'></td>";
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
			var data = {empno:tr.find("td:eq(0)").children().val(),
						ename:tr.find("td:eq(1)").children().val(),
						job:tr.find("td:eq(2)").children().val(),
						mgr:tr.find("td:eq(3)").children().val(),
						hiredate:tr.find("td:eq(4)").children().val(),
						sal:tr.find("td:eq(5)").children().val(),
						comm:tr.find("td:eq(6)").children().val(),
						deptno:tr.find("td:eq(7)").children().val(),
					   }
			$.ajax({
				type : "post",
				url:"update.ajax",
				data:data,
				success : function(data){  
					createTable(data, "수정완료");
					$('#datatable').DataTable();
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
            	"<th>JOB</th>"+
            	"<th>MGR</th>"+
            	"<th>HIREDATE</th>"+
            	"<th>SAL</th>"+
            	"<th>COMM</th>"+
            	"<th>DEPTNO</th>"+
            	"<th>EDIT</th><th>DELETE</th></tr></thead><tbody>";
			$.each(data,function(index,emp){
				opr += "<tr><td>"+emp.empno+
				"</td><td>"+emp.ename+
				"</td><td>"+emp.job+
				"</td><td>"+emp.mgr+
				"</td><td>"+emp.hiredate.substring(0,10)+
				"</td><td>"+emp.sal+
				"</td><td>"+emp.comm+
				"</td><td>"+emp.deptno+
				"</td><td><input type='button' onclick='empupdate(this)' value='수정' class ='update'  value2="+emp.empno+
				"></td><td><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></td></tr>";
			});
			opr+="</tbody></table><table><tr><td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td></tr></table>";
			$('#menuView').append(opr);
			
		}
		
		//등록 폼
		function createinput(me){
			var tr = $(me).closest('tr');
			tr.empty();
			var td = "<td><input type='text' placeholder='empno'></td>";
			td +="<td><input type='text' placeholder='ename'></td>";
			td +="<td><input type='text' placeholder='job'></td>";
			td +="<td><input type='text' placeholder='mgr'></td>";
			td +="<td><input type='text' placeholder='hiredate'></td>";
			td +="<td><input type='text' placeholder='sal'></td>";
			td +="<td><input type='text' placeholder='comm'></td>";
			td +="<td><input type='text' placeholder='deptno'></td>";
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
			var data = {empno:tr.find("td:eq(0)").children().val(),
						ename:tr.find("td:eq(1)").children().val(),
						job:tr.find("td:eq(2)").children().val(),
						mgr:tr.find("td:eq(3)").children().val(),
						hiredate:tr.find("td:eq(4)").children().val(),
						sal:tr.find("td:eq(5)").children().val(),
						comm:tr.find("td:eq(6)").children().val(),
						deptno:tr.find("td:eq(7)").children().val(),
					   }
			$.ajax({
				type : "post",
				url:"insert.ajax",
				data:data,
				success : function(data){  
					createTable(data, "추가");
					$('#datatable').DataTable();
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