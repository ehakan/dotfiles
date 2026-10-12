# setup for common kubernetes tools

if status is-interactive
    if type -q kubectl
        alias k="kubectl"
    end

    if type -q k9s
        # k9s uses ~/Library/ as the default config path on macos, which seems to get reset every so often by homebrew
        set -gx K9S_CONFIG_DIR "$HOME/.config/k9s"
    end

end
