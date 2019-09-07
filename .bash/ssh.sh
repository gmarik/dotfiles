ssh_prompt() {
  local ssh_host=''
  if [ "$SSH_CONNECTION" ]; then 
    ssh_host="@$(hostname):"
  fi

  echo "$ssh_host"
}
