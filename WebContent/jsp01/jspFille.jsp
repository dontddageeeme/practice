<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int i;
	int sum = 0;
	
	for(i=1;i<=10;i++){
		sum += i;
	}
	
%>
1���� 10���� ������ =<%=sum%><hr>

<%
	i=11;
	sum=0;
	
	while(i<=20){
		sum=sum+i;
		i++;
	}
	out.println("11���� 20���� ������ = "+sum+"<hr>");
	
	i=21;
	sum=0;
	
	do{
		sum+=i;
		i+=1;
	}while(i<=30);
%>
21���� 30���� ������ = <%=sum %><hr>