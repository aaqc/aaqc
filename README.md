# aaqc


## How to add an ssh agent to your linux computer

 1. Create file `~/.config/systemd/user/ssh-agent.service` with content:
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
