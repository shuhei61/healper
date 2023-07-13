function tabset(){
  // タブ要素を取得
  const tabs = document.querySelectorAll('.tab');
  // タブコンテンツ要素を取得
  const tabContents = document.querySelectorAll('.tabbox');

  // タブをクリックした時の処理
  tabs.forEach((tab, index) => {
    tab.addEventListener('click', () => {
      // クリックされたタブをアクティブにする
      tabs.forEach((tab) => tab.classList.remove('tab-active'));
      tab.classList.add('tab-active');
    
      // 対応するタブコンテンツを表示する
      tabContents.forEach((content) => content.classList.remove('box-show'));
      tabContents[index].classList.add('box-show');
    });
  });
};

window.addEventListener("turbo:load",tabset);