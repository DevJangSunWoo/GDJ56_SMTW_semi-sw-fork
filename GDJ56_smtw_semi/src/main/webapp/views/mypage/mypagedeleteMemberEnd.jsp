<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@include file="/views/common/header.jsp" %>
<%
	String userId = (String)request.getParameter("id");
%>
 <section>
            <div class="sidemenu">
                <div><h4 style="text-align: center;">���� ������</h4></div>
                <div><p>��Ȧ ������</p></div>
                <div><p>���� ����</p></div>
                <div><p>������</p></div>
                <div><p>���� �� ��</p></div>
                <div><p>���� ����</p></div>
               
            </div>
            <div class="menuDiv"></div>
            <div class="contentList">
                <div id="menutitle"><h2 style="background-color: cornflowerblue;">���� ����</h2></div>
            <div id="pwck">
            <meta http-equiv="refresh" content="2; url=<%=request.getContextPath()%>"> 
            <p >message : �׵��� Show Me The Way�� ã���ּż� �����մϴ�</p>
            </div>
            </div>
            
</section>
<script>
()=()=>{
	setTimeout(() => <%=request.getContextPath()%>, 2000);
	
}
</script>
        <style>
        #pwck{
           
            position: absolute;
            top: 500px;
            left: 650px;
            width: 600px;
            height: 300px;
            
           
            
        }
        #pwck>*{
            border: 1px solid;
            padding: 2%;
        }
           
    
        #mypsc{
                border: 1px solid;
                border-bottom: 3px solid;
    
                position: absolute;
                top: 500px;
                left: 500px;
             
                width: 300px;
                height: 390px;
            }
    
            #menutitle{
                /* border: 1px solid;
                border-bottom: 3px solid; */
    
                position: absolute;
                top: 350px;
                left: 800px;
                width: 300px;
                height: 100px;
            }
    
           
            section{
                display: flex;
            }
    
            .contentList{
                width: 85%;  
                margin-left: 0 auto;
                margin-right: 0 auto;
                text-align: center;
            }
            
    
            #list{
                margin: 0 auto;
                width: 700px;
                border-collapse: collapse;
            }
            #list th{
                border: 1px solid;
                border-bottom: 3px solid;
            }
            #list td{
                border: 1px solid;
            }
            .sidemenu{
                padding: 10px;
                /* margin-top: 1000px; */
                /* margin: 0 auto; */
                /* border: 1px solid; */
                font-size: 18px;
                font-weight: bold;
                position: fixed;
            }
            
            .menuDiv{
                width: 15%;
            }
    
            .sidemenu p:hover{
                transform: scale(1.1);
                transition-property: transform;
                transition-duration: 1s;
            }
            .sidemenu>*:not(div:nth-child(1)){
                width: 200px;
                height: 50px;
                background-color: lavender;
                border-radius: 50px;
                box-shadow: 5px 2px 8px lavender;
            }
            .sidemenu p{
                text-align: center;
                padding: 13px;
                cursor:pointer
            }
            .sidemenu>div:nth-child(3){
                color: purple;
                
            }
            section{
                border: 1px solid tomato;
                
                margin-left: 50px;
                margin-right: 50px;
                /* �ڼ����� �κ� */
                /* padding-left: 100px;
                padding-right: 100px; */
                /* �ڼ����Ѻκ� */
                /* 
                    ���� ���� �ȿ� div�� ����ٸ� ���� padding-left,padding-right����
                    �¿� ������ �����ϼ���
                    ���� �����ʵ� �����ϸ� �ٰ��� ���߸� ���� �� �ϴ� ���� ������ �ǰ��ּ���
                 */
                margin-top: 100px;
                height: 900px; 
                /*
                    ->���� ����ϴ� �߰� ���Ǻκ��� ũ�⸦ �����Ϸ��� �� height�� �����ϼ���ڡ�
                    ������ �����ص� footerħ������ �ʵ��� �����س����� ������ �÷��� �˴ϴ�.
                */
                
            }
            section>div{
                border: 1px solid blue;
                /* ���� ���� div�׵θ� */
                
            }
        </style>
<%@include file="/views/common/footer.jsp" %>