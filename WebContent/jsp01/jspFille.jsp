<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int i;
	int sum = 0;
	
	for(i=1;i<=10;i++){
		sum += i;
	}
	
%>
1부터 10까지 누적합 =<%=sum%><hr>

<%
	i=11;
	sum=0;
	
	while(i<=20){
		sum=sum+i;
		i++;
	}
	out.println("11부터 20까지 누적합 = "+sum+"<hr>");
	
	i=21;
	sum=0;
	
	do{
		sum+=i;
		i+=1;
	}while(i<=30);
%>
21부터 30까지 누적합 = <%=sum %><hr>