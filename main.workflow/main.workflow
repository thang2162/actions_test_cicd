workflow "New workflow" {
  on = "push"
  resolves = ["appleboy/ssh-action@v0.0.2"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "appleboy/ssh-action@v0.0.2" {
  uses = "appleboy/ssh-action@v0.0.2"
  needs = ["GitHub Action for npm"]
  secrets = ["HOST", "KEY"]
}
