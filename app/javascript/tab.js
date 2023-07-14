function tabset(){
  const tabs = document.querySelectorAll('.tab');
  const tabContents = document.querySelectorAll('.tabbox');

  tabs.forEach((tab) => {
    tab.addEventListener('click', () => {
      const target = tab.dataset.target;

      // クリックされたタブをアクティブにする
      tabs.forEach((t) => t.classList.remove('tab-active'));
      tab.classList.add('tab-active');
    
      // 対応するタブコンテンツを表示する
      tabContents.forEach((content) => {
        if (content.id === target){
          content.classList.add('box-show');
        } else {
          content.classList.remove('box-show');
        };     
      });
    });
  });
};

window.addEventListener("turbo:load",tabset);