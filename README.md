# aaqc

## How to add an ssh agent to your linux computer

 1. Run ` mkdir -p ~/.config/systemd/user`
 2. Create file `~/.config/systemd/user/ssh-agent.service` with content:
    ```ini
    [Unit]
    Description=SSH key agent

    [Service]
    Type=simple
    Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
    # DISPLAY required for ssh-askpass to work
    Environment=DISPLAY=:0
    ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

    [Install]
    WantedBy=default.target
    ```
 2. Run `systemctl --user enable --now ssh-agent`
 3. Add `SSH_AUTH_SOCK DEFAULT="${XDG_RUNTIME_DIR}/ssh-agent.socket"` to the file `~/.pam_environment`
 4. Add `AddKeysToAgent yes` to the top of the file `~/.ssh/config`

## How to use `puller.sh` and `cloner.sh`:

### cloner.sh

 1. Go to the folder where you would like your repositories to reside
 2. Run this script with an absolute or relative path, for example `aaqc/cloner.sh`
 3. Wait for the script to clone all repos

### puller.sh

 1. Go to the folder where your repositories are located
 2. Run this script with an absolute or relative path, for example `aaqc/puller.sh`
 3. Wait for the script to pull all repos
 3. Run `systemctl --user enable --now ssh-agent`
 4. Add `SSH_AUTH_SOCK DEFAULT="${XDG_RUNTIME_DIR}/ssh-agent.socket"` to the file `~/.pam_environment`
 5. Add `AddKeysToAgent yes` to the top of the file `~/.ssh/config`
