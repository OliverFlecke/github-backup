# Github backup

Small script to clone all repos from Github to create a backup.
The script uses [Github cli](https://cli.github.com/), which is required to be installed on the machine and for the user to be logged in.
All of repos of the currently logged in user will be cloned locally, including public, private, and forked repos, and if there are already cloned, a pull will be performed to ensure the latest changes are downloaded locally.

