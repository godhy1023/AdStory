<%@page import="java.util.List"%>
<%@page import="tipboard.model.vo.TipBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
    List<TipBoard> list = (List<TipBoard>)request.getAttribute("list");

%>
<div class = "m-12">  

    <p class = "text-3xl border-b-2 mb-10">팁 게시판</p>
    
	<%  if(list == null || list.isEmpty()){ %>     
	            <div class="text-lg text text-red-700 text-center">조회된 게시물이 없습니다.</div>
	<% } else { %>
    <div class = "text-center ">
	    <table class = "m-auto">
	        <tr>
	            <th class = "mobile-hide-table px-2 pb-2">번호</th>
	            <th class = "px-4 pb-2">제목</th>
	            <th class = "px-4 pb-2">작성자</th>
	            <th class = "mobile-hide-table px-4 pb-2">작성일</th>
	            <th class = "px-1 pb-2">조회수</th>
	            <th class = "px-1 pb-2">추천수</th>
	        </tr>
	
	<%		
	    	boolean color = false;
	    	
	        for(TipBoard b : list){
	%>      
		  <%if(color == true){ color = false; %>
		    <tr class = "bg-gray-200 border hover:bg-blue-200 ">
		  <% } else { color = true;%>
		    <tr class="border hover:bg-blue-200 ">
		  <% } %>
	            <td class = "mobile-hide-table px-2 py-2"><%= b.getKey() %></td>
	            <td class = " text-left px-4 w-1/3 hover:text-blue-700 hover:underline hover:font-bold cursor-pointer"
	            onclick="location.href='<%= request.getContextPath() %>/tipBoard/view?boardNo=<%= b.getKey() %>'">
	                <%= b.getTitle() %>
	            </td>
	            <td class = "px-4"><%= b.getMemberId() %></td>
				<%
				   String date[] = b.getPostDate().split(" ");
				%>
	            <td class = "mobile-hide-table px-4"><%= date[0] %></td>
	            <td class = "px-1"><%= b.getReadCount() %></td>
	            <td class = "px-1"><%= b.getRecommend() %></td>
	        </tr>   
   
	       <%       } %>
	    </table>
	
		<div class="align-middle flex justify-center">
	        <div class="flex rounded-md mt-8">
	            <%=request.getAttribute("pageBar")%>
	        </div>
	    </div>

   <%    }     %>   
	    <div class="py-10 m-auto" style='max-width:557px;'>
		    <button
		          class="float-left bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
		          onclick="location.href='<%=request.getContextPath()%>/board/insert';">
		                   인기글</button>
	        <button
	              class="float-right bg-transparent hover:bg-blue-500 text-blue-500 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
	              onclick="location.href='<%=request.getContextPath()%>/tipBoard/insert';">
	                          글쓰기
	        </button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>