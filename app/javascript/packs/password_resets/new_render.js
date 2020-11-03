//URL取得を含むif文 現在のURLにnewが含まれていなかったら実行
if(!document.URL.match("/new")) {
  history.replaceState('', '', location.href + '/new')
}

//参考
// https://minetanote.work/js/js/