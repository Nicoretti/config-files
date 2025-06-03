set -gx EDITOR nvim
fish_add_path -m ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Use bat as man pager if available
if command -v bat >/dev/null 2>&1
  set -x PAGER "bat --plain"
  set -x MANPAGER "bat --plain --language man"
end

if command -v starship
    starship init fish | source
end

if command -v atuin
    atuin init fish | source
end
