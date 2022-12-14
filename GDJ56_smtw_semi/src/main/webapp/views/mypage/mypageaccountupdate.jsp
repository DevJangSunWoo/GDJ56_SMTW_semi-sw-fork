<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@include file="/views/common/header.jsp" %>
  <%
  	Member m = (Member)request.getAttribute("member");
  	String postcode = (String)request.getAttribute("postcode");
  	String address = (String)request.getAttribute("address");
  	String detialadd = (String)request.getAttribute("detialadd");
  	String bYear = (String)request.getAttribute("bYear");
  	String bMonth = (String)request.getAttribute("bMonth");
  	String bDay = (String)request.getAttribute("bDay");
  	
  %>
 <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">���� ������</h4></div>
           <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=m.getMemberId()%>');">��Ȧ ������</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=m.getMemberId()%>');">���� ����</p></div>
            <div><p>������</p></div>
            <div><p>���� �� ��</p></div>
            <div><p>���� ����</p></div>
           
        </div>
        <div class="menuDiv"></div>
        <div class="contentList">
            <div id="menutitle"><h2 style="background-color: cornflowerblue;">���� ����</h2></div>
        
        <form action="<%=request.getContextPath()%>/mypageAccountUpdateEnd.do" method="post">
        <div id="mypsc">
                <img src="<%=m.getMyImg()%>" alt="" width="200" height="200" >
                <br>
                ������ ������ �ҷ������� <br>
                <input type="file" name="mypcs">
                <!-- <button onclick="window.open('mypage-pwcheck.html')">�����ϱ�</button>
                <button onclick="window.open('mypage-pwcheck.html')">Ż���ϱ�</button> -->
        </div>
        <div id="myimpo">
            <div>���̵� : <input type="text" name="id" value="<%=m.getMemberId()%>" readonly></div>
            <div>�̸� : <input type="text" name="name" value="<%=m.getMemberName()%>" required ></div>
            
            <div>���� : 
                <input type="radio" name="gender" id="gender0" value="M" <%=m.getGender()=='M'? "checked":"" %>>
                <label for="gender0">��</label>
                <input type="radio" name="gender" id="gender1" value="F" <%=m.getGender()=='F'? "checked":"" %>>
                <label for="gender1">��</label>
            </div>
            
            <div>
            

            
            <label class="form-label mt-4">�������<span class="obli">(�ʼ�)</span></label><br>
        	�� <input type="text" class="form-control" name="bYear" value="<%=bYear %>" placeholder="��(4��)" maxlength="4" required>

               �� <select name="bMonth" id="bMonth" placeholder="��" value="<%=bMonth %>"> 
                    <option value="01">1
                    </option>
                    <option value="02">2
                    </option>
                    <option value="03">3
                    </option>
                    <option value="04">4
                    </option>
                    <option value="05">5
                    </option>
                    <option value="06">6
                    </option>
                    <option value="07">7
                    </option>
                    <option value="08">8
                    </option>
                    <option value="09">9
                    </option>
                    <option value="10">10
                    </option>
                    <option value="11">11
                    </option>
                    <option value="12">12
                    </option>
                </select>
     
            �� <select name="bDay" id="bDay" class="custom-select"> 
                <option value="01" selected="selected">1
                </option>
                <option value="02">2
                </option>
                <option value="03">3
                </option>
                <option value="04">4
                </option>
                <option value="05">5
                </option>
                <option value="06">6
                </option>
                <option value="07">7
                </option>
                <option value="08">8
                </option>
                <option value="09">9
                </option>
                <option value="10">10
                </option>
                <option value="11">11
                </option>
                <option value="12">12
                </option>
                <option value="13">13
                </option>
                <option value="14">14
                </option>
                <option value="15">15
                </option>
                <option value="16">16
                </option>
                <option value="17">17
                </option>
                <option value="18">18
                </option>
                <option value="19">19
                </option>
                <option value="20">20
                </option>
                <option value="21">21
                </option>
                <option value="22">22
                </option>
                <option value="23">23
                </option>
                <option value="24">24
                </option>
                <option value="25">25
                </option>
                <option value="26">26
                </option>
                <option value="27">27
                </option>
                <option value="28">28
                </option>
                <option value="29">29
                </option>
                <option value="30">30
                </option>
                <option value="31">31
                </option>   
           </select>
           </div>
           
           <div>
            <div class ="adddressContainer">
        <label class="form-label mt-4">�ּ�</label>
        <div class="bir_yy address">
                <input type="text" class="form-control inputAddr" value=<%=postcode %>
                   name="inputAddress_postcode" id="inputAddress_postcode" placeholder="�����ȣ" readonly>
        
            <input id="searchAddr" type="button" value="�ּ� �˻�" onclick="sample6_execDaumPostcode()">
        </div>
    </div> <div class ="adddressContainer">
   
        <div class="bir_yy address">
                <input type="text" class="form-control inputAddr" value=" <%=address %>"
                   name="inputAddress_address" id="inputAddress_address" placeholder="�ּ�" readonly>
        
        
                <input type="text" class="form-control inputAddr"  value="<%=detialadd %>"
                   name="inputAddress_detailAddress"id="inputAddress_detailAddress" placeholder="���ּ�">
        </div>
    </div>


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
//                 var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('inputAddress_postcode').value = data.zonecode;
                document.getElementById("inputAddress_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("inputAddress_detailAddress").focus();
            }
        }).open();
    }
</script>
           </div>
           
            
            
            <div>��ȭ��ȣ : <input type="tel" placeholder="(-����)01012345678" name="phone" id="phone" value="<%=logInMember.getPhone()%>" maxlength="11" required ></div>
            <div>�̸��� : <input type="email" placeholder="abc@xyz.com" name="email" id="email"  value="<%=logInMember.getEmail()%>" required ></div>
           
           
            <div>��й�ȣ : <button name="password" onclick="window.open('mypage-pwupdate.html','_blank','scrollbars=yes,width=500,height=385,top=100,left=100')">��й�ȣ����</button></div>
           
           
            <div style="padding: 2%;"><input type="submit" name="�����ϱ�" value="�����ϱ�" style="float: right;" onclick=""></div>
		
		
		</form>
        </div>


           
          
        </div>
        

    </section>
    <script>
        
    </script>
    <style>
    #myimpo{
       
        position: absolute;
        top: 500px;
        left: 800px;
        width: 600px;
        height: 300px;
       
        
    }
    #myimpo>*:not(div:nth-child(9)){
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
            height: 443px;
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
        .bir_wrap>*{
            float: left;
            margin: 0.5%;          
        }
        .form-control>input{
            border-width: 1px;
            border-style: solid;
            border-radius: 5px;
          
            border-color: cornflowerblue;
        }
        #bMonth{
            border-width: 1px;
            border-style: solid;
            border-radius: 5px;
          
            border-color: cornflowerblue;
        }
        #bDay{
            border-width: 1px;
            border-style: solid;
            border-radius: 5px;
            
            border-color: cornflowerblue;
        }
        
    </style>
<%@include file="/views/common/footer.jsp" %>