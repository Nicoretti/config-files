set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Use bat as man pager if available
if command -v bat >/dev/null 2>&1
  set -x PAGER "bat --plain"
  set -x MANPAGER "bat --plain --language man"
end

starship init fish | source
