def --env cd [dest: string = "~"] {
  z $dest

  if ( (git rev-parse | complete | get exit_code) == 0) {
    git fetch
  }
}
