def --env cd [dest: string = "~"] {
  z $dest

  if ($"(pwd)/.git" | path exists) {
    git fetch
  }
}
