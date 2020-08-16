<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="m-12">
    <p class = "text-3xl border-b-2">관리자 - 메인</p>
    
    
<div class = "my-10">

    <div class="flex mb-4">
	  <div class="grid w-1/2 h-20 mx-2">
        <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
	        onclick="location.href = '<%= request.getContextPath() %>/admin/userPoint';"/>
	                회원 포인트 증가 / 차감
        </button> 
	  </div>
	  
	  <div class="grid w-1/2 h-20 mx-2">
	    <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
	        onclick="location.href = '<%= request.getContextPath() %>/admin/userWithdrawList';"/>
	                 출금요청 목록
        </button>
	  </div>
	</div>
	
	
    <div class="flex mb-4">
	  
	  <div class="grid w-1/2 h-20 mx-2">
	    <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
	        onclick="location.href = '<%= request.getContextPath() %>/admin/userPointLogView';"/>
	                포인트 로그 조회
        </button> 
	  </div>
	  
	  <div class="grid w-1/2 h-20 mx-2">
        <button class="text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase px-8 py-3 rounded outline-none focus:outline-none mr-1 mb-1" type="button"
        onclick="location.href = '';"/>
	               총매출 조회
        </button>
	  </div>
	  
	</div>
    
    
    
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>