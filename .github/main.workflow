workflow "New workflow" {
  on = "push"
  resolves = ["new-action"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "npm -v"
}

action "appleboy/ssh-action@master" {
  uses = "appleboy/ssh-action@master"
  needs = ["GitHub Action for npm"]
  secrets = ["HOST", "KEY"]
  args = [
    "--user",
    "bitnami",
    "--script",
    "whoami",
    "--script",
    "scp ./ ./home/bitnami/toBeDeleted",
  ]
}
