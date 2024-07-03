function mypage() {
  const pullDownButton = document.getElementById("mypage");
  const pullDownParents = document.getElementById("mypage-list");

  function showMenu() {
    pullDownParents.setAttribute("style", "display:block;");
  }

  function hideMenu() {
    pullDownParents.removeAttribute("style");
  }

  pullDownButton.addEventListener('mouseover', showMenu);
  pullDownButton.addEventListener('mouseout', function(){
    setTimeout(function() {
      if (!pullDownParents.matches(':hover') && !pullDownButton.matches(':hover')) {
        hideMenu();
      }
    }, 200);
  });

  pullDownParents.addEventListener('mouseover', showMenu);
  pullDownParents.addEventListener('mouseout', function() {
    setTimeout(function() {
      if (!pullDownParents.matches(':hover') && !pullDownButton.matches(':hover')) {
        hideMenu();
      }
    }, 200);
  });

  window.addEventListener('turbo:load', hideMenu);
  window.addEventListener('turbo:render', hideMenu);
}

window.addEventListener('turbo:load', mypage);
window.addEventListener('turbo:render', mypage);