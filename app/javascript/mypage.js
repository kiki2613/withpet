function mypage (){
  const pullDownButton = document.getElementById("mypage");
  const pullDownParents = document.getElementById("mypage-list");

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style","display:block;");
  });

  pullDownButton.addEventListener('mouseout', function(){
    setTimeout(function() {
      if (!pullDownParents.matches(':hover') && !pullDownButton.matches(':hover')) {
        pullDownParents.removeAttribute("style");
      }
    }, 200);
  });

  pullDownParents.addEventListener('mouseover', function() {
    pullDownParents.setAttribute("style", "display:block;");
  });

  pullDownParents.addEventListener('mouseout', function() {
    setTimeout(function() {
      if (!pullDownParents.matches(':hover') && !pullDownButton.matches(':hover')) {
        pullDownParents.removeAttribute("style");
      }
    }, 200);
  });
}

window.addEventListener('turbo:load', mypage);