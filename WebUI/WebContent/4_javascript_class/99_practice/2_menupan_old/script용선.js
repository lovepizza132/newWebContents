/**
 * 
 */
window.onload = function (){
    var menulist = new Array(); //계산할 메뉴들 (배열 생성)
    var currentMenu = new Object(); //현재 메뉴정보 (객체 생성)
    var tablemenu = document.getElementById('tablemenu'); //테이블
    var menu = document.getElementsByClassName('menu'); //메뉴들
	var menuview = document.getElementById('menuview'); //메뉴의 사진이 띄어지는 창
 
    printMenulist(menulist);    //메뉴리스트를 콘솔로 확인
    getCountofCurrentMenu(currentMenu, menulist); //확인 버튼 이벤트 함수
    setCurrentMenu(tablemenu, menulist, currentMenu); //테이블 요소인 메뉴버튼 이벤트 함수
    orderButtonFunction(menulist) //최종주문버튼 이벤트 함수
    printMenuview(menu, menuview) //메뉴뷰에 메뉴사진 출력하는 함수
    
}

function printMenuview(menu, menuview){
	for(var i=0; i<menu.length; i++){
		menu[i].onmouseover = function(){
			menuview.setAttribute('src','imgs/'+ this.id+'.jpg');
		}
	}
}

function menulistInitialize(menulist, tablemenu){ //table의 내용으로 menulist를 구성
    for(var r=0; r< tablemenu.rows.length-1; r++){  
        for(var c=0; c<tablemenu.rows[r].cells.length; c++){
            var infoAboutMenu = tablemenu.rows[r].cells[c].innerHTML.split('<br>');             
            var tempMenu = new Object();
            tempMenu.name = infoAboutMenu[0];
            tempMenu.price = infoAboutMenu[1];
            tempMenu.count = 0;
            
            menulist.push(tempMenu); //메뉴를 담는 배열에 객체를 담음
        }
    }
}
function setCurrentMenu(tablemenu, menulist, currentMenu){ // 선택한 테이블의 행,열에 해당하는 메뉴 정보를 가져옴
    var rindex; //행
    var cindex; //열
    for(var r=0; r< tablemenu.rows.length-1; r++){
        for(var c=0; c<tablemenu.rows[r].cells.length; c++){
             tablemenu.rows[r].cells[c].onclick = function(){
            	 tablemenu.rows[r].cells[c].style.
                rindex = this.parentElement.rowIndex;   
                cindex = this.cellIndex;
                var infoAboutMenu = tablemenu.rows[rindex].cells[cindex].innerHTML.split('<br>');
                 
                currentMenu.name = infoAboutMenu[0];
                currentMenu.price = infoAboutMenu[1];
                for(var i =0; i<menulist.length; i++)
                {
                    if(menulist[i].name==currentMenu.name)
                        currentMenu.count=menulist[i].count;
                }
                setCountOfCurrentMenu(currentMenu);
                checkCurrentMenu(currentMenu);
            }
        }
    }
}
function getCountofCurrentMenu(currentMenu, menulist){ //개수 옆에 있는 확인 버튼을 누를 경우
    document.getElementById('checkbtn').onclick=function(){
        var number = document.getElementById('currentMenuCount');
        for(var i=0; i<menulist.length; i++)
        {
            if(currentMenu.name==menulist[i].name)
            {
                menulist[i].count=number.value;
            }
        }
        number.value=0; //현재 메뉴의 개수를 가져온 이후 개수를 0으로 초기화해줌 
        /*currentMenu = new Object(); //현재 메뉴를 초기화해줌 -> 이거 주석으로 만들면 정상적으로 돌아가는데 이유를 몰라요 */
        setTotalPrice(menulist); //확인 버튼이 눌릴 경우 총합도 같이 계산이 됨    
    }
}
function setCountOfCurrentMenu(currentMenu){ //현재 선택한 메뉴의 갯수를 표시해주는 함수
    var currentMenuCount = document.getElementById('currentMenuCount');
    currentMenuCount.value=currentMenu.count;

}
function setTotalPrice(menulist){   // 총합을 계산해줌
    var total = document.getElementById('total');
    var sum = 0;

    for(var i=0; i<menulist.length; i++)
    {
        sum+= parseInt(menulist[i].price) * parseInt(menulist[i].count);
    }

    total.value=sum;
}
function orderButtonFunction(menulist){
    document.getElementById('orderbtn').onclick = function(){   //최종확인 버튼이 눌렸을떄의 이벤트리스너
        printOrderMenulist(menulist);    //메뉴리스트 전부 확인 (***** 추가적인 기능 구현 필요 *****)

        for(var i=0; i<menulist.length; i++){
            menulist[i].count=0;
        }
        document.getElementById('total').value=0; //가격총합 초기화
    };
    
}

function checkCurrentMenu(currentMenu){ //현재 선택한 메뉴의 갯수를 표시해주는 함수
    console.log("현재 메뉴 이름 : " + currentMenu.name + " 현재 메뉴 가격 : " + currentMenu.price + " 현재 메뉴 개수 : " + currentMenu.count);
}
    
function printMenulist(menulist){   //모든 menulist를 순서대로 출력
    for(var i=0; i<menulist.length; i++){
        console.log("메뉴 이름 : " + menulist[i].name + " 메뉴 가격 : " + menulist[i].price + " 현재 개수 : " + menulist[i].count);
        //콘솔로 확인
    }
}
function printOrderMenulist(menulist){   //모든 menulist를 순서대로 출력
    for(var i=0; i<menulist.length; i++){
        if(menulist[i].count!='0')
            console.log("메뉴 이름 : " + menulist[i].name + " 메뉴 가격 : " + menulist[i].price + " 현재 개수 : " + menulist[i].count);
        //콘솔로 확인
    }
}