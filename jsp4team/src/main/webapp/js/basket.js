/**
 * 장바구니 페이지 관련 스크립트
 */

 function checkSelectAll()  {
  // 전체 체크박스
  const checkboxes 
    = document.querySelectorAll('input[name="choice"]');
  // 선택된 체크박스
  const checked 
    = document.querySelectorAll('input[name="choice"]:checked');
  // select all 체크박스
  const selectAll 
    = document.querySelector('input[name="allcheck"]');
  
  if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
  }else {
    selectAll.checked = false;
  }

}

function selectAll(selectAll)  {
  const checkboxes 
     = document.getElementsByName('choice');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}