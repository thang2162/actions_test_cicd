workflow "New workflow" {
  on = "push"
  resolves = ["appleboy/ssh-action@master"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "appleboy/ssh-action@master" {
  uses = "appleboy/ssh-action@master"
  needs = ["GitHub Action for npm"]
  secrets = ["KEY", "HOST", "USERNAME"]
  args = ["--script", "'whoami'", 
  "--script", "'sftp -u@-H -i ssh-key'"
  ]
}
