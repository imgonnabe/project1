<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(document).read(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type = 'file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false, 
			data : formData,
			type : 'POST',
			dataType : 'json',
				success:function(result){
					console.log(result);
					showUploadResult(result);
				}
		});
	});
	
	function showUploadResult(uploadResultArr){
		  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
		  var uploadUL = $(".uploadResult ul");
		  var str = "";
		  
		  $(uploadResultArr).each(function(i, obj){
			     
			   if(!obj.image){
		       
		       var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
		       
		       var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
		       
		       str += "<li><a href='/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.png'>"
		    		   +obj.fileName+"</a>" + "<span data-file=\ '"+ fileCallPath+"\' data-type='file'> x </span>"
		    		   + "<div></li>"

		     }else{
		       
		       var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		       var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
		       originPath = originPath.replace(new RegExp(/\\/g),"/");
		       
		       str += "<li><a href=\"javascript:showImage(\'"
		    		   +originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a>"
		    				   + "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span><li>";
		     }
		   });
			
			uploadResult.append(str);
	  }
});
</script>
</head>
<body>
<!-- 첨부파일 -->
<div class = "row">
	<div class = "col-lg-12">
		<div class = "panel panel-default">
			<div class = "panel-heading">File Attach</div>
			<!-- /.panel-heading -->
			<div class = "panel-body">
				<div class = "panel-body">
					<div class = "form-group uploadDiv">
						<input type = "file" name = 'uploadFile' multiple>
					</div>
					
					<div class = 'uploadResult'>
						<ul>
						
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>