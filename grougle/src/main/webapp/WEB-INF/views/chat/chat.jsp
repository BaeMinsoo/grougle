<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="text" id="nickname" class="form-inline" placeholder="닉네임을 입력해주세요" required autofocus>
    <button class = "btn btn-primary" id = "name">확인</button>
    <div id = "chatroom" style = "width:400px; height: 600px; border:1px solid; background-color : gray"></div>
    <input type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
    <button class = "btn btn-primary" id = "send">전송</button>
