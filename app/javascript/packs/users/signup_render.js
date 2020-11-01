// ユーザー登録失敗時にnewのviewなのにcreateアクションのおかげでURLが/usersになることへの対処。/signupに書き換えてリロードしても問題ないようにする。
history.replaceState('', '', '/signup')
